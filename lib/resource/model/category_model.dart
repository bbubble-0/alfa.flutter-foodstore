import 'dart:convert';

class CategoryModel {
  final int? id;
  final String? name;
  final String? slug;
  final String? image;

  CategoryModel({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  factory CategoryModel.fromJson(String str) =>
      CategoryModel.fromMap(json.decode(str) as Map<String, dynamic>);

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
        id: json['id'] as int?,
        name: json['name']?.toString(),
        slug: json['slug']?.toString(),
        image: json['image']?.toString(),
      );
}