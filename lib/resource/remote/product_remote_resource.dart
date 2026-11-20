import 'package:dio/dio.dart';

class ProductRemoteResource {
  final Dio _dio;

  ProductRemoteResource(this._dio);

  Future<Response> getProducts() async {
    return await _dio.get('products');
  }

  Future<Response> getProductDetail(int id) async {
    return await _dio.get('products/$id');
  }
}