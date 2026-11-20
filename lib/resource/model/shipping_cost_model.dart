
import 'dart:convert';

class ShippingCostModel {
  final String? name;
  final String? code;
  final String? service;
  final String? description;
  final int? cost;
  final String? etd;

  ShippingCostModel({
    this.name,
    this.code,
    this.service,
    this.description,
    this.cost,
    this.etd,
  });

  factory ShippingCostModel.fromJson(String str) =>
      ShippingCostModel.fromMap(
        json.decode(str) as Map<String, dynamic>,
      );

  String toJson() => json.encode(toMap());

  factory ShippingCostModel.fromMap(Map<String, dynamic> json) =>
      ShippingCostModel(
        name: json['name'] as String?,
        code: json['code'] as String?,
        service: json['service'] as String?,
        description: json['description'] as String?,
        cost: json['cost'] is int
            ? json['cost'] as int
            : int.tryParse(json['cost']?.toString() ?? ''),
        etd: json['etd']?.toString(),
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'code': code,
        'service': service,
        'description': description,
        'cost': cost,
        'etd': etd,
      };
}
