import 'package:flutter_application/resource/model/product_model.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductModel> popularProducts;
  final List<ProductModel> latestProducts;

  ProductLoaded({
    this.popularProducts = const [],
    this.latestProducts = const [],
  });
}

class ProductError extends ProductState {
  final String message;

  ProductError(this.message);
}