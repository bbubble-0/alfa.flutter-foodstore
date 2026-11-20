import 'package:flutter_application/bloc/product/product_state.dart';
import 'package:flutter_application/resource/model/product_model.dart';
import 'package:flutter_application/resource/remote/home_remote_resource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  final HomeRemoteResource homeRemoteResource;

  ProductCubit(this.homeRemoteResource) : super(ProductInitial());

  Future<void> fetchHomeProducts() async {
    emit(ProductLoading());

    final popularResult = await homeRemoteResource.fetchProductsPopular();
    final productsResult = await homeRemoteResource.fetchProducts(page: 1);

    String? errorMessage;
    List<ProductModel> popular = [];
    List<ProductModel> latest = [];

    popularResult.fold(
      (error) => errorMessage = error,
      (items) => popular = items,
    );

    productsResult.fold(
      (error) => errorMessage ??= error,
      (paging) => latest = paging.data ?? [],
    );

    if (errorMessage != null && popular.isEmpty && latest.isEmpty) {
      emit(ProductError(errorMessage!));
    } else {
      emit(
        ProductLoaded(
          popularProducts: popular,
          latestProducts: latest,
        ),
      );
    }
  }
}