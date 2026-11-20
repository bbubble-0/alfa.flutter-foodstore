import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_application/resource/model/checkout_model.dart';
import 'package:flutter_application/resource/model/location_model.dart';
import 'package:flutter_application/resource/model/shipping_cost_model.dart';

class CheckoutRemoteResource {
  final Dio dio;

  CheckoutRemoteResource(this.dio);

  // =========================================================
  // DATA LOKASI LOKAL
  // =========================================================

  static final List<LocationModel> _localLocations = [
    LocationModel(
      id: 900001,
      label: 'UNGARAN, UNGARAN BARAT, SEMARANG, JAWA TENGAH',
      provinceName: 'JAWA TENGAH',
      cityName: 'SEMARANG',
      districtName: 'UNGARAN BARAT',
      subdistrictName: 'UNGARAN',
      zipCode: '50511',
    ),
    LocationModel(
      id: 900002,
      label: 'SALATIGA, SALATIGA, JAWA TENGAH',
      provinceName: 'JAWA TENGAH',
      cityName: 'SALATIGA',
      districtName: 'SALATIGA',
      subdistrictName: 'SALATIGA',
      zipCode: '50711',
    ),
    LocationModel(
      id: 900003,
      label: 'SEMARANG, SEMARANG, JAWA TENGAH',
      provinceName: 'JAWA TENGAH',
      cityName: 'SEMARANG',
      districtName: 'SEMARANG',
      subdistrictName: 'SEMARANG',
      zipCode: '50131',
    ),
    LocationModel(
      id: 900004,
      label: 'SOLO, SURAKARTA, JAWA TENGAH',
      provinceName: 'JAWA TENGAH',
      cityName: 'SURAKARTA',
      districtName: 'SURAKARTA',
      subdistrictName: 'SOLO',
      zipCode: '57111',
    ),
    LocationModel(
      id: 900005,
      label: 'YOGYAKARTA, YOGYAKARTA, DI YOGYAKARTA',
      provinceName: 'DI YOGYAKARTA',
      cityName: 'YOGYAKARTA',
      districtName: 'YOGYAKARTA',
      subdistrictName: 'YOGYAKARTA',
      zipCode: '55111',
    ),
    LocationModel(
      id: 900006,
      label: 'JAKARTA, DKI JAKARTA',
      provinceName: 'DKI JAKARTA',
      cityName: 'JAKARTA',
      districtName: 'JAKARTA',
      subdistrictName: 'JAKARTA',
      zipCode: '10110',
    ),
    LocationModel(
      id: 900007,
      label: 'BANDUNG, BANDUNG, JAWA BARAT',
      provinceName: 'JAWA BARAT',
      cityName: 'BANDUNG',
      districtName: 'BANDUNG',
      subdistrictName: 'BANDUNG',
      zipCode: '40111',
    ),
    LocationModel(
      id: 900008,
      label: 'SURABAYA, SURABAYA, JAWA TIMUR',
      provinceName: 'JAWA TIMUR',
      cityName: 'SURABAYA',
      districtName: 'SURABAYA',
      subdistrictName: 'SURABAYA',
      zipCode: '60111',
    ),
    LocationModel(
      id: 900009,
      label: 'MAGELANG, MAGELANG, JAWA TENGAH',
      provinceName: 'JAWA TENGAH',
      cityName: 'MAGELANG',
      districtName: 'MAGELANG',
      subdistrictName: 'MAGELANG',
      zipCode: '56111',
    ),
    LocationModel(
      id: 900010,
      label: 'BOYOLALI, BOYOLALI, JAWA TENGAH',
      provinceName: 'JAWA TENGAH',
      cityName: 'BOYOLALI',
      districtName: 'BOYOLALI',
      subdistrictName: 'BOYOLALI',
      zipCode: '57311',
    ),
    LocationModel(
      id: 900011,
      label: 'KUDUS, KUDUS, JAWA TENGAH',
      provinceName: 'JAWA TENGAH',
      cityName: 'KUDUS',
      districtName: 'KUDUS',
      subdistrictName: 'KUDUS',
      zipCode: '59311',
    ),
    LocationModel(
      id: 900012,
      label: 'PURWOKERTO, BANYUMAS, JAWA TENGAH',
      provinceName: 'JAWA TENGAH',
      cityName: 'BANYUMAS',
      districtName: 'BANYUMAS',
      subdistrictName: 'PURWOKERTO',
      zipCode: '53111',
    ),
  ];

  // =========================================================
  // PENCARIAN LOKASI LOKAL - TANPA API
  // =========================================================

  Future<Either<String, List<LocationModel>>> getLocation(
    String search,
  ) async {
    try {
      final keyword = search.trim().toLowerCase();

      if (keyword.isEmpty) {
        return const Right([]);
      }

      final results = _localLocations.where((location) {
        final label = location.label.toString().toLowerCase();
        final province =
            location.provinceName.toString().toLowerCase();
        final city = location.cityName.toString().toLowerCase();
        final district =
            location.districtName.toString().toLowerCase();
        final subdistrict =
            location.subdistrictName.toString().toLowerCase();

        return label.contains(keyword) ||
            province.contains(keyword) ||
            city.contains(keyword) ||
            district.contains(keyword) ||
            subdistrict.contains(keyword);
      }).toList();

      return Right(results);
    } catch (e) {
      return Left('Gagal mencari lokasi: $e');
    }
  }

  // =========================================================
  // ONGKIR SIMULASI LOKAL - TANPA API RAJAONGKIR
  // =========================================================

  Future<Either<String, List<ShippingCostModel>>> getShippingCost(
    int destination,
    int weight,
    String courier,
  ) async {
    final courierCode = courier.toLowerCase().trim();

    switch (courierCode) {
      case 'jnt':
      case 'j&t':
      case 'j&t express':
        return Right([
          ShippingCostModel(
            name: 'J&T Express',
            code: 'jnt',
            service: 'EZ',
            description: 'J&T Express EZ (Simulasi)',
            cost: 15000,
            etd: '2-4 hari',
          ),
        ]);

      case 'jne':
      case 'jnee':
        return Right([
          ShippingCostModel(
            name: 'JNE',
            code: 'jne',
            service: 'REG',
            description: 'JNE Reguler (Simulasi)',
            cost: 18000,
            etd: '2-3 hari',
          ),
        ]);

      case 'sicepat':
      case 'si cepat':
      case 'sicepat express':
        return Right([
          ShippingCostModel(
            name: 'SiCepat',
            code: 'sicepat',
            service: 'REG',
            description: 'SiCepat Reguler (Simulasi)',
            cost: 14000,
            etd: '2-4 hari',
          ),
        ]);

      case 'pos':
      case 'pos indonesia':
      case 'posindonesia':
        return Right([
          ShippingCostModel(
            name: 'POS Indonesia',
            code: 'pos',
            service: 'Pos Reguler',
            description: 'Pos Reguler (Simulasi)',
            cost: 12000,
            etd: '3-6 hari',
          ),
        ]);

      default:
        return Right([
          ShippingCostModel(
            name: courier.toUpperCase(),
            code: courierCode,
            service: 'REG',
            description: 'Layanan Reguler (Simulasi)',
            cost: 15000,
            etd: '2-4 hari',
          ),
        ]);
    }
  }

  // =========================================================
  // CHECKOUT
  // =========================================================

  Future<Either<String, String>> checkOut(
    CheckoutModel checkout,
  ) async {
    try {
      final zipCode = (checkout.zipCode ?? '').trim().isNotEmpty
          ? checkout.zipCode!.trim()
          : '00000';

      final response = await dio.post(
        'public/checkout',
        data: {
          'province_name': checkout.provinceName,
          'city_name': checkout.cityName,
          'district_name': checkout.districtName,
          'subdistrict_name': checkout.subdistrictName,
          'zip_code': zipCode,
          'full_address': checkout.fullAddress,
          'weight': checkout.weight,
          'shipping_courier': checkout.shippingCourier,
          'shipping_service': checkout.shippingService,
          'shipping_cost': checkout.shippingCost,
          'total': checkout.total,
        },
      );

      // DEBUG: RESPONS ASLI DARI LARAVEL
      print('========== CHECKOUT DEBUG ==========');
      print('STATUS CODE: ${response.statusCode}');
      print('RESPONSE DATA: ${response.data}');
      print('=================================');

      final data = response.data;

      String? snapToken;

      if (data is Map) {
        // Format respons Laravel: data.snap_token
        if (data['data'] is Map) {
          snapToken = data['data']['snap_token']?.toString();
        }

        // Format alternatif: snap_token di root
        snapToken ??= data['snap_token']?.toString();
      }

      // Token harus benar-benar tersedia
      if (snapToken != null && snapToken.trim().isNotEmpty) {
        print('SNAP TOKEN BERHASIL DIBUAT');
        return Right(snapToken.trim());
      }

      // Token kosong dianggap gagal
      String errorMessage = 'Snap Token kosong dari server';

      if (data is Map) {
        errorMessage = data['message']?.toString() ??
            data['error']?.toString() ??
            errorMessage;
      }

      print('CHECKOUT GAGAL: $errorMessage');

      return Left(errorMessage);
    } on DioException catch (e) {
      print('========== DIO CHECKOUT ERROR ==========');
      print('STATUS: ${e.response?.statusCode}');
      print('DATA: ${e.response?.data}');
      print('ERROR: ${e.message}');
      print('======================================');

      final errorData = e.response?.data;

      if (errorData is Map) {
        return Left(
          errorData['message']?.toString() ??
              errorData['error']?.toString() ??
              e.message ??
              'Checkout gagal',
        );
      }

      return Left(
        errorData?.toString() ??
            e.message ??
            'Checkout gagal',
      );
    } catch (e) {
      print('CHECKOUT EXCEPTION: $e');
      return Left('Terjadi kesalahan checkout: $e');
    }
  }
}