import 'package:dio/dio.dart';

class ApiService {
  Dio dio = Dio(
    BaseOptions(baseUrl: "https://api.nstack.in/v1"),
  );

  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("Api throw an status code ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> post(
    String path, {
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: body,
      );
      if (response.statusCode.toString().startsWith("2")) {
        return response.data;
      } else {
        throw Exception("Api throw an status code ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> put(
    String path, {
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await dio.put(
        path,
        data: body,
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("Api throw an status code ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }
}
