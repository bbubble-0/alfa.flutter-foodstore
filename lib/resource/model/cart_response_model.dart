import 'dart:convert';

import 'package:flutter_application/resource/model/product_model.dart';

class CartResponseModel {
  final int? totalWeight;
  final int? totalPrice;
  final List<Cart>? carts;

  CartResponseModel({
    this.totalWeight,
    this.totalPrice,
    this.carts,
  });

  factory CartResponseModel.fromJson(String str) =>
      CartResponseModel.fromMap(json.decode(str) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());

  factory CartResponseModel.fromMap(Map<String, dynamic> json) =>
      CartResponseModel(
        totalWeight: json['total_weight'] as int?,
        totalPrice: json['total_price'] as int?,
        carts: json['carts'] == null
            ? null
            : List<Cart>.from(
                (json['carts'] as List<dynamic>).map(
                  (x) => Cart.fromMap(x as Map<String, dynamic>),
                ),
              ),
      );

  Map<String, dynamic> toMap() => {
        'total_weight': totalWeight,
        'total_price': totalPrice,
        'carts': carts == null
            ? []
            : List<dynamic>.from(carts!.map((x) => x.toMap())),
      };
}

class Cart {
  final int? id;
  final int? customerId;
  final int? productId;
  final int? qty;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final ProductModel? product;

  Cart({
    this.id,
    this.customerId,
    this.productId,
    this.qty,
    this.createdAt,
    this.updatedAt,
    this.product,
  });

  factory Cart.fromJson(String str) =>
      Cart.fromMap(json.decode(str) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());

  factory Cart.fromMap(Map<String, dynamic> json) => Cart(
        id: json['id'] as int?,
        customerId: json['customer_id'] as int?,
        productId: json['product_id'] as int?,
        qty: json['qty'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.tryParse(json['created_at'].toString()),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.tryParse(json['updated_at'].toString()),
        product: json['product'] == null
            ? null
            : ProductModel.fromMap(json['product'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'customer_id': customerId,
        'product_id': productId,
        'qty': qty,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'product': product?.toMap(),
      };
}