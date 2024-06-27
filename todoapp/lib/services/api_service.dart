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
}
