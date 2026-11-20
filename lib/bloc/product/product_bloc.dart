import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_bloc.freezed.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.fetchProducts() = _FetchProducts;
  const factory ProductEvent.fetchProductDetail(String slug) =
      _FetchProductDetail;
}

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;
  const factory ProductState.loading() = _Loading;
  const factory ProductState.loaded(List<dynamic> products) = _Loaded;
  const factory ProductState.productDetailLoaded(Map<String, dynamic> detail) =
      _ProductDetailLoaded;
  const factory ProductState.error(String message) = _Error;
}

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(const ProductState.initial()) {
    on<_FetchProducts>((event, emit) async {
      emit(const ProductState.loading());
      try {
        const List<dynamic> items = [];
        emit(const ProductState.loaded(items));
      } catch (e) {
        emit(ProductState.error(e.toString()));
      }
    });

    on<_FetchProductDetail>((event, emit) async {
      emit(const ProductState.loading());
      try {
        final Map<String, dynamic> detail = {'slug': event.slug};
        emit(ProductState.productDetailLoaded(detail));
      } catch (e) {
        emit(ProductState.error(e.toString()));
      }
    });
  }
}