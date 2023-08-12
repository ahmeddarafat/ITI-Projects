import 'package:dio/dio.dart';

const String baseUrl = "https://jsonplaceholder.typicode.com";

class EndPoints {
  EndPoints._();

  static const String todos = "/todos";

}

class ApiService {
  final Dio _dio;

  ApiService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            receiveDataWhenStatusError: true,
            connectTimeout: const Duration(milliseconds: 3600),
            receiveTimeout: const Duration(milliseconds: 3600),
          ),
        );

  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    return await _dio.get(
      endPoint,
      queryParameters: query,
    );
  }

  Future<Response> postData({
    required String endPoint,
    required Map<String, dynamic> body,
    Map<String, dynamic>? query,
  }) async {
    return await _dio.post(
      endPoint,
      data: body,
      queryParameters: query,
    );
  }
}
