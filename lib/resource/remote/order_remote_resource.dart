import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_application/resource/model/order_model.dart';
import 'package:flutter_application/resource/model/paging_model.dart';

class OrderRemoteResource {
  final Dio dio;

  OrderRemoteResource(this.dio);

  Future<Either<String, PagingModel<OrderModel>>> fetchOrders(
      {int page = 1}) async {
    try {
      final response = await dio.get('customer/my-orders?page=$page');
      if (response.statusCode == 200) {
        final result = PagingModel<OrderModel>.fromMap(
          response.data,
          (item) => OrderModel.fromMap(item),
        );
        return Right(result);
      }
      return const Left('Failed to fetch orders');
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return Left(e.response?.statusCode.toString() ?? '401');
      }
      return Left(e.response?.data?['message']?.toString() ?? e.toString());
    }
  }

  Future<Either<String, dynamic>> detailOrder(String snapToken) async {
    try {
      final response = await dio.get('customer/my-orders/$snapToken');
      if (response.statusCode == 200) {
        return Right(response.data);
      }
      return const Left('Failed to fetch order detail');
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return Left(e.response?.statusCode.toString() ?? '401');
      }
      return Left(e.response?.data?['message']?.toString() ?? e.toString());
    }
  }

  Future<Either<String, String>> reviewProduct({
    required int transactionDetailId,
    required int productId,
    required int rating,
    required String review,
  }) async {
    try {
      final response = await dio.post(
        'customer/ratings',
        data: {
          'transaction_detail_id': transactionDetailId,
          'product_id': productId,
          'rating': rating,
          'review': review,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(response.data['message']?.toString() ?? 'Review submitted');
      }
      return Left(response.data['message']?.toString() ?? 'Failed to submit review');
    } on DioException catch (e) {
      return Left(
        e.response?.data?['message']?.toString() ?? e.toString(),
      );
    }
  }
}