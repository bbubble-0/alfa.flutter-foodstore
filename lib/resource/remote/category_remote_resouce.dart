import 'package:dio/dio.dart';

class CategoryRemoteResource {
  final Dio _dio;

  CategoryRemoteResource(this._dio);

  Future<Response> getCategories() async {
    return await _dio.get('categories');
  }
}