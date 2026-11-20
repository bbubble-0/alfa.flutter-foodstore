import 'dart:convert';

class OrderModel {
  final int? id;
  final int? customerId;
  final String? invoiceNumber;
  final String? status;
  final num? totalPrice;
  final String? provinceName;
  final String? districtName;
  final String? subdistrictName;
  final String? zipCode;
  final String? fullAddress;
  final int? weight;
  final String? courier;
  final String? service;
  final num? shippingCost;
  final String? snapToken;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  OrderModel({
    this.id,
    this.customerId,
    this.invoiceNumber,
    this.status,
    this.totalPrice,
    this.provinceName,
    this.districtName,
    this.subdistrictName,
    this.zipCode,
    this.fullAddress,
    this.weight,
    this.courier,
    this.service,
    this.shippingCost,
    this.snapToken,
    this.createdAt,
    this.updatedAt,
  });

  factory OrderModel.fromJson(String str) =>
      OrderModel.fromMap(json.decode(str));

  factory OrderModel.fromMap(Map<String, dynamic> json) => OrderModel(
        id: json['id'],
        customerId: json['customer_id'],
        invoiceNumber: json['invoice_number'],
        status: json['status'],
        totalPrice: json['total_price'] ?? json['grand_total'],
        provinceName: json['province_name'],
        districtName: json['district_name'],
        subdistrictName: json['subdistrict_name'],
        zipCode: json['zip_code'],
        fullAddress: json['full_address'],
        weight: json['weight'],
        courier: json['courier'],
        service: json['service'],
        shippingCost: json['shipping_cost'] ?? json['cost'],
        snapToken: json['snap_token'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.tryParse(json['created_at'].toString()),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.tryParse(json['updated_at'].toString()),
      );
}