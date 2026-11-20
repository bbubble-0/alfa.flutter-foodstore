import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_application/resource/model/api_response.dart';
import 'package:flutter_application/resource/model/category_model.dart';
import 'package:flutter_application/resource/model/paging_model.dart';
import 'package:flutter_application/resource/model/product_model.dart';
import 'package:flutter_application/resource/model/slider_model.dart';

class HomeRemoteResource {
  final Dio dio;

  HomeRemoteResource(this.dio);

  Future<Either<String, List<SliderModel>>> fetchSliders() async {
    try {
      final response = await dio.get('public/sliders');
      if (response.statusCode == 200) {
        final apiResponse = ApiResponse<List<SliderModel>>.fromJson(
          response.data,
          (data) => (data as List<dynamic>)
              .map((x) => SliderModel.fromMap(x as Map<String, dynamic>))
              .toList(),
        );
        return Right(apiResponse.data ?? []);
      }
      return const Left('Failed to fetch sliders');
    } on DioException catch (e) {
      return Left(e.response?.data?['message']?.toString() ?? e.toString());
    }
  }

  Future<Either<String, List<CategoryModel>>> fetchCategories() async {
    try {
      final response = await dio.get('public/categories');
      if (response.statusCode == 200) {
        final apiResponse = ApiResponse<List<CategoryModel>>.fromJson(
          response.data,
          (data) => (data as List<dynamic>)
              .map((x) => CategoryModel.fromMap(x as Map<String, dynamic>))
              .toList(),
        );
        return Right(apiResponse.data ?? []);
      }
      return const Left('Failed to fetch categories');
    } on DioException catch (e) {
      return Left(e.response?.data?['message']?.toString() ?? e.toString());
    }
  }

  Future<Either<String, CategoryModel>> fetchCategoryBySlug(String slug) async {
    try {
      final response = await dio.get('public/categories/$slug');
      if (response.statusCode == 200) {
        final apiResponse = ApiResponse<CategoryModel>.fromJson(
          response.data,
          (data) => CategoryModel.fromMap(data as Map<String, dynamic>),
        );
        if (apiResponse.data != null) {
          return Right(apiResponse.data!);
        }
      }
      return const Left('Failed to fetch category');
    } on DioException catch (e) {
      return Left(e.response?.data?['message']?.toString() ?? e.toString());
    }
  }

  Future<Either<String, PagingModel<ProductModel>>> fetchProducts({
    int page = 1,
    String query = '',
  }) async {
    try {
      final response = await dio.get(
        'public/products',
        queryParameters: {
          'page': page,
          if (query.isNotEmpty) 'search': query,
        },
      );
      if (response.statusCode == 200) {
        final paging = PagingModel<ProductModel>.fromMap(
          response.data['data'] is Map<String, dynamic>
              ? response.data['data'] as Map<String, dynamic>
              : response.data as Map<String, dynamic>,
          (item) => ProductModel.fromMap(item),
        );
        return Right(paging);
      }
      return const Left('Failed to fetch products');
    } on DioException catch (e) {
      return Left(e.response?.data?['message']?.toString() ?? e.toString());
    }
  }

  Future<Either<String, List<ProductModel>>> fetchProductsPopular() async {
    try {
      final response = await dio.get('public/products-popular');
      if (response.statusCode == 200) {
        final apiResponse = ApiResponse<List<ProductModel>>.fromJson(
          response.data,
          (data) => (data as List<dynamic>)
              .map((x) => ProductModel.fromMap(x as Map<String, dynamic>))
              .toList(),
        );
        return Right(apiResponse.data ?? []);
      }
      return const Left('Failed to fetch popular products');
    } on DioException catch (e) {
      return Left(e.response?.data?['message']?.toString() ?? e.toString());
    }
  }

  Future<Either<String, ProductModel>> detailProduct(String slug) async {
    try {
      final response = await dio.get('public/products/$slug');
      if (response.statusCode == 200) {
        final apiResponse = ApiResponse<ProductModel>.fromJson(
          response.data,
          (data) => ProductModel.fromMap(data as Map<String, dynamic>),
        );
        if (apiResponse.data != null) {
          return Right(apiResponse.data!);
        }
      }
      return const Left('Failed to fetch product detail');
    } on DioException catch (e) {
      return Left(e.response?.data?['message']?.toString() ?? e.toString());
    }
  }
}