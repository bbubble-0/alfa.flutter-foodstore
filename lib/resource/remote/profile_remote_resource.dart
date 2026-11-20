import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_application/resource/model/customer_model.dart';

class ProfileRemoteResource {
  final Dio dio;

  ProfileRemoteResource(this.dio);

  Future<Either<String, CustomerModel>> fetchProfile() async {
    try {
      final response = await dio.get('customer/profile');
      if (response.statusCode == 200) {
        return Right(CustomerModel.fromMap(response.data['customer']));
      }
      return const Left('Failed to fetch profile');
    } on DioException catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<dynamic, String>> updateProfile({
    required String name,
    required String email,
    File? image,
    String? password,
    String? passwordConfirmation,
  }) async {
    try {
      final formData = FormData.fromMap({
        'name': name,
        'email': email,
        if (image != null)
          'image': await MultipartFile.fromFile(
            image.path,
            filename: image.path.split('/').last,
          ),
        if (password != null && password.isNotEmpty) 'password': password,
        if (passwordConfirmation != null && passwordConfirmation.isNotEmpty)
          'password_confirmation': passwordConfirmation,
      });

      final response = await dio.post(
        'customer/profile',
        data: formData,
        options: Options(
          headers: {
            'content-type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 200) {
        return Right(response.data['message'] ?? 'Profile updated');
      } else {
        return Left(response.data['message'] ?? 'Failed to update profile');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 422) {
        return Left(e.response?.data);
      }
      return Left(e.toString());
    }
  }
}