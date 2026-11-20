import 'package:flutter_application/model/product_model.dart';

class CartItemModel {
  final ProductModel product;
  final int quantity;

  const CartItemModel({
    required this.product,
    this.quantity = 1,
  });

  int get subtotal => (product.price ?? 0) * quantity;

  CartItemModel copyWith({
    ProductModel? product,
    int? quantity,
  }) {
    return CartItemModel(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      product: ProductModel.fromJson(
        (json['product'] as Map<String, dynamic>?) ?? json,
      ),
      quantity: (json['quantity'] as int?) ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'quantity': quantity,
    };
  }
}