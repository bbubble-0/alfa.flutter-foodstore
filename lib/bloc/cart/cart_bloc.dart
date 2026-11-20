
import 'package:flutter_application/resource/model/cart_response_model.dart';
import 'package:flutter_application/resource/remote/cart_remote_resource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_bloc.freezed.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRemoteResource cartRemoteResource;

  CartBloc(this.cartRemoteResource) : super(const CartState.initial()) {
    on<CartEvent>((event, emit) async {
      await event.when(
        fetchCart: () async {
          emit(const CartState.loading());

          final result = await cartRemoteResource.fetchCart();

          result.fold(
            (message) => emit(CartState.error(message)),
            (cartResponse) => emit(CartState.loaded(cartResponse)),
          );
        },

        addCart: (productId, qty) async {
          emit(const CartState.loading());

          final result = await cartRemoteResource.cartStore(productId, qty);

          await result.fold(
            (message) async {
              emit(CartState.error(message));
            },
            (message) async {
              // Notifikasi berhasil menambahkan produk
              emit(CartState.stored(message));

              // Langsung ambil ulang isi keranjang
              final fetchResult = await cartRemoteResource.fetchCart();

              fetchResult.fold(
                (message) => emit(CartState.error(message)),
                (cartResponse) => emit(CartState.loaded(cartResponse)),
              );
            },
          );
        },

        removeCart: (cartId) async {
          emit(const CartState.loading());

          final result = await cartRemoteResource.removeCart(cartId);

          await result.fold(
            (message) async {
              emit(CartState.error(message));
            },
            (_) async {
              final fetchResult = await cartRemoteResource.fetchCart();

              fetchResult.fold(
                (message) => emit(CartState.error(message)),
                (cartResponse) => emit(CartState.loaded(cartResponse)),
              );
            },
          );
        },

        increment: (productId, cartId) async {
          final result = await cartRemoteResource.incrementCart(
            productId,
            cartId,
          );

          await result.fold(
            (message) async {
              emit(CartState.error(message));
            },
            (_) async {
              final fetchResult = await cartRemoteResource.fetchCart();

              fetchResult.fold(
                (message) => emit(CartState.error(message)),
                (cartResponse) => emit(CartState.loaded(cartResponse)),
              );
            },
          );
        },

        decrement: (productId, cartId) async {
          final result = await cartRemoteResource.decrementCart(
            productId,
            cartId,
          );

          await result.fold(
            (message) async {
              emit(CartState.error(message));
            },
            (_) async {
              final fetchResult = await cartRemoteResource.fetchCart();

              fetchResult.fold(
                (message) => emit(CartState.error(message)),
                (cartResponse) => emit(CartState.loaded(cartResponse)),
              );
            },
          );
        },
      );
    });
  }
}
