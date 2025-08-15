import 'package:api_check/core/network/api_constants.dart';
import 'package:dio/dio.dart';

class DioClient {
  late final Dio _dio;

  DioClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        }
      ),
    );

    _dio.interceptors.add(
      LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
  }

  static final DioClient _instance = DioClient._internal();

  static Dio get dio => _instance._dio;
}