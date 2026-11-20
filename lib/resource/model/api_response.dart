import 'dart:convert';

class ApiResponse<T> {
  final bool? success;
  final String? message;
  final T? data;

  ApiResponse({
    this.success,
    this.message,
    this.data,
  });

  factory ApiResponse.fromJson(
    dynamic source,
    T Function(dynamic) fromJsonT,
  ) {
    final map = source is String
        ? json.decode(source) as Map<String, dynamic>
        : source as Map<String, dynamic>;
    return ApiResponse<T>.fromMap(map, fromJsonT);
  }

  factory ApiResponse.fromMap(
    Map<String, dynamic> map,
    T Function(dynamic) fromJsonT,
  ) {
    return ApiResponse<T>(
      success: map['success'] as bool?,
      message: map['message']?.toString(),
      data: map['data'] == null ? null : fromJsonT(map['data']),
    );
  }
}