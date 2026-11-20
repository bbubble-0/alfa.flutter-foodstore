
import 'package:dio/dio.dart';
import 'package:flutter_application/resource/local/auth_local_resource.dart';

class AuthInterceptor extends Interceptor {
  String? _token;

  void setToken(String? token) {
    _token = token;
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Ambil token login yang tersimpan
    _token = await AuthLocalResource.getToken();

    // Kirim token ke Laravel
    if (_token != null && _token!.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $_token';
    }

    options.headers['Accept'] = 'application/json';

    handler.next(options);
  }
}
