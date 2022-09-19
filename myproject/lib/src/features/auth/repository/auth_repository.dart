import 'package:dio/dio.dart';
import 'package:myproject/src/core/networking/api_endpoint.dart';

class AuthRepository {
  AuthRepository(this._dio);
  final Dio _dio;

  Future<String> register(
    String name,
    String password,
  ) async {
    try {
      final resp = await _dio.post(ApiEndPoint.auth(AuthEndpoint.register));
      final token = resp.data?["token"];
      return token;
    } on DioError {
      rethrow;
    }
  }

  Future<String> login(
    String name,
    String password,
  ) async {
    try {
      final resp = await _dio.post(ApiEndPoint.auth(AuthEndpoint.login));
      final token = resp.data?["token"];

      return token;
    } on DioError {
      rethrow;
    }
  }
}
