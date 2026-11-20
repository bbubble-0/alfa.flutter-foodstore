import 'dart:convert';

class CheckoutModel {
  final int? destinationId;
  final String? provinceName;
  final String? cityName;
  final String? districtName;
  final String? subdistrictName;
  final String? zipCode;
  final String? fullAddress;
  final int? weight;
  final String? shippingCourier;
  final String? shippingService;
  final int? shippingCost;
  final int? total;

  CheckoutModel({
    this.destinationId,
    this.provinceName,
    this.cityName,
    this.districtName,
    this.subdistrictName,
    this.zipCode,
    this.fullAddress,
    this.weight,
    this.shippingCourier,
    this.shippingService,
    this.shippingCost,
    this.total,
  });

  CheckoutModel copyWith({
    int? destinationId,
    String? provinceName,
    String? cityName,
    String? districtName,
    String? subdistrictName,
    String? zipCode,
    String? fullAddress,
    int? weight,
    String? shippingCourier,
    String? shippingService,
    int? shippingCost,
    int? total,
  }) {
    return CheckoutModel(
      destinationId: destinationId ?? this.destinationId,
      provinceName: provinceName ?? this.provinceName,
      cityName: cityName ?? this.cityName,
      districtName: districtName ?? this.districtName,
      subdistrictName: subdistrictName ?? this.subdistrictName,
      zipCode: zipCode ?? this.zipCode,
      fullAddress: fullAddress ?? this.fullAddress,
      weight: weight ?? this.weight,
      shippingCourier: shippingCourier ?? this.shippingCourier,
      shippingService: shippingService ?? this.shippingService,
      shippingCost: shippingCost ?? this.shippingCost,
      total: total ?? this.total,
    );
  }

  factory CheckoutModel.fromJson(String str) =>
      CheckoutModel.fromMap(json.decode(str) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());

  factory CheckoutModel.fromMap(Map<String, dynamic> map) => CheckoutModel(
        destinationId: map['destination_id'] as int?,
        provinceName: map['province_name'] as String?,
        cityName: map['city_name'] as String?,
        districtName: map['district_name'] as String?,
        subdistrictName: map['subdistrict_name'] as String?,
        zipCode: map['zip_code'] as String?,
        fullAddress: map['full_address'] as String?,
        weight: map['weight'] as int?,
        shippingCourier: map['shipping_courier'] as String?,
        shippingService: map['shipping_service'] as String?,
        shippingCost: map['shipping_cost'] as int?,
        total: map['total'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'destination_id': destinationId,
        'province_name': provinceName,
        'city_name': cityName,
        'district_name': districtName,
        'subdistrict_name': subdistrictName,
        'zip_code': zipCode,
        'full_address': fullAddress,
        'weight': weight,
        'shipping_courier': shippingCourier,
        'shipping_service': shippingService,
        'shipping_cost': shippingCost,
        'total': total,
      };
}