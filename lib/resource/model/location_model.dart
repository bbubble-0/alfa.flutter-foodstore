import 'dart:convert';

class LocationModel {
  final int? id;
  final String? label;
  final String? provinceName;
  final String? cityName;
  final String? districtName;
  final String? subdistrictName;
  final String? zipCode;

  LocationModel({
    this.id,
    this.label,
    this.provinceName,
    this.cityName,
    this.districtName,
    this.subdistrictName,
    this.zipCode,
  });

  factory LocationModel.fromJson(String str) =>
      LocationModel.fromMap(json.decode(str) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());

  factory LocationModel.fromMap(Map<String, dynamic> json) => LocationModel(
        id: json['id'] as int?,
        label: json['label'] as String?,
        provinceName: json['province_name'] as String?,
        cityName: json['city_name'] as String?,
        districtName: json['district_name'] as String?,
        subdistrictName: json['subdistrict_name'] as String?,
        zipCode: json['zip_code'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'label': label,
        'province_name': provinceName,
        'city_name': cityName,
        'district_name': districtName,
        'subdistrict_name': subdistrictName,
        'zip_code': zipCode,
      };
}