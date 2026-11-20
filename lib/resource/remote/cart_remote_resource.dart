import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_application/resource/model/cart_response_model.dart';

class CartRemoteResource {
  final Dio dio;

  CartRemoteResource(this.dio);

  Future<Either<String, CartResponseModel>> fetchCart() async {
    try {
      final response = await dio.get('public/carts');
      final result = CartResponseModel.fromMap(
        response.data is Map<String, dynamic> && response.data['data'] != null
            ? response.data['data'] as Map<String, dynamic>
            : response.data as Map<String, dynamic>,
      );
      return Right(result);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return Left(e.response?.statusCode?.toString() ?? '401');
      }
      return Left(e.response?.data?['message']?.toString() ?? e.toString());
    }
  }

  Future<Either<String, String>> cartStore(int productId, int qty) async {
    try {
      final response = await dio.post(
        'public/carts',
        data: {
          'product_id': productId.toString(),
          'qty': qty.toString(),
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(
          response.data?['message']?.toString() ?? 'Added to cart',
        );
      }
      return Left(response.data?['message']?.toString() ?? 'Failed');
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return Left(e.response?.statusCode?.toString() ?? '401');
      }
      return Left(e.response?.data?['message']?.toString() ?? e.toString());
    }
  }

  Future<Either<String, String>> incrementCart(
    int productId,
    int cartId,
  ) async {
    try {
      final response = await dio.post(
        'public/carts/increment',
        data: {
          'product_id': productId.toString(),
          'cart_id': cartId.toString(),
        },
      );
      if (response.statusCode == 200) {
        return Right(response.data?['message']?.toString() ?? 'Updated');
      }
      return Left(response.data?['message']?.toString() ?? 'Failed');
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return Left(e.response?.statusCode?.toString() ?? '401');
      }
      return Left(e.response?.data?['message']?.toString() ?? e.toString());
    }
  }

  Future<Either<String, String>> decrementCart(
    int productId,
    int cartId,
  ) async {
    try {
      final response = await dio.post(
        'public/carts/decrement',
        data: {
          'product_id': productId.toString(),
          'cart_id': cartId.toString(),
        },
      );
      if (response.statusCode == 200) {
        return Right(response.data?['message']?.toString() ?? 'Updated');
      }
      return Left(response.data?['message']?.toString() ?? 'Failed');
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return Left(e.response?.statusCode?.toString() ?? '401');
      }
      return Left(e.response?.data?['message']?.toString() ?? e.toString());
    }
  }

  Future<Either<String, String>> removeCart(int cartId) async {
    try {
      final response = await dio.delete('public/carts/$cartId');
      if (response.statusCode == 200) {
        return Right(response.data?['message']?.toString() ?? 'Removed');
      }
      return Left(response.data?['message']?.toString() ?? 'Failed');
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return Left(e.response?.statusCode?.toString() ?? '401');
      }
      return Left(e.response?.data?['message']?.toString() ?? e.toString());
    }
  }
}