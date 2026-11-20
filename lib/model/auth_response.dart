import 'package:flutter_application/model/user_model.dart';

class AuthResponse {
  final String? token;
  final UserModel? user;
  final String? message;

  const AuthResponse({
    this.token,
    this.user,
    this.message,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] is Map<String, dynamic>
        ? json['data'] as Map<String, dynamic>
        : json;

    return AuthResponse(
      token: (data['token'] ?? json['token']) as String?,
      user: data['user'] is Map<String, dynamic>
          ? UserModel.fromJson(data['user'] as Map<String, dynamic>)
          : null,
      message: json['message'] as String?,
    );
  }
}