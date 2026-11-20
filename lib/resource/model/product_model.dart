import 'dart:convert';

class ProductModel {
  final int? id;
  final int? categoryId;
  final String? name;
  final String? slug;
  final String? description;
  final num? price;
  final int? stock;
  final String? image;
  final double? rating;
  final int? reviewCount;

  ProductModel({
    this.id,
    this.categoryId,
    this.name,
    this.slug,
    this.description,
    this.price,
    this.stock,
    this.image,
    this.rating,
    this.reviewCount,
  });

  factory ProductModel.fromJson(String str) =>
      ProductModel.fromMap(json.decode(str) as Map<String, dynamic>);

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as int?,
        categoryId: json['category_id'] as int?,
        name: json['name']?.toString(),
        slug: json['slug']?.toString(),
        description: json['description']?.toString(),
        price: num.tryParse(json['price']?.toString() ?? ''),
        stock: json['stock'] as int?,
        image: json['image']?.toString(),
        rating: json['rating'] == null
            ? null
            : double.tryParse(json['rating'].toString()),
        reviewCount: json['review_count'] as int?,
      );
        Map<String, dynamic> toMap() => {
        'id': id,
        'category_id': categoryId,
        'name': name,
        'slug': slug,
        'description': description,
        'price': price,
        'stock': stock,
        'image': image,
        'rating': rating,
        'review_count': reviewCount,
      };
}