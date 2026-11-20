import 'dart:convert';

class SliderModel {
  final int? id;
  final String? title;
  final String? image;
  final String? link;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  SliderModel({
    this.id,
    this.title,
    this.image,
    this.link,
    this.createdAt,
    this.updatedAt,
  });

  factory SliderModel.fromJson(String str) =>
      SliderModel.fromMap(json.decode(str) as Map<String, dynamic>);

  factory SliderModel.fromMap(Map<String, dynamic> json) => SliderModel(
        id: json['id'] as int?,
        title: json['title']?.toString(),
        image: json['image']?.toString(),
        link: json['link']?.toString(),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.tryParse(json['created_at'].toString()),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.tryParse(json['updated_at'].toString()),
      );
}