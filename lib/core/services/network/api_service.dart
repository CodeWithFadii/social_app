import 'package:dio/dio.dart';
import '../../config/app_config.dart';
import 'interceptors.dart';

typedef Json = Map<String, dynamic>;

class ApiService {
  final Dio _dio;
  ApiService([Dio? dio]) : _dio = dio ?? Dio() {
    _dio.options
      ..baseUrl = AppConfig.apiBaseUrl
      ..connectTimeout = const Duration(seconds: 30)
      ..receiveTimeout = const Duration(seconds: 30)
      ..headers = {'Accept': 'application/json', 'Content-Type': 'application/json'};
    if (dio != null) {
      return;
    }
    _dio.interceptors.addAll([ApiInterceptors()]);
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    String? baseUrl,
    bool? cancelAuthToken,
  }) {
    var dio = _dio;
    // if (baseUrl != null) {
    //   dio.options.baseUrl = baseUrl;
    // }
    return dio.get(
      path,
      queryParameters: params,
      options: Options(headers: headers),
      cancelToken: cancelAuthToken == true ? CancelToken() : null,
    );
  }

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    bool? cancelAuthToken,
  }) {
    return _dio.post(
      path,
      data: data,
      queryParameters: queryParams,
      options: Options(headers: headers),
      cancelToken: cancelAuthToken == true ? CancelToken() : null,
    );
  }

  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? headers,
    bool? cancelAuthToken,
  }) {
    return _dio.put(
      path,
      data: data,
      options: Options(headers: headers),
      cancelToken: cancelAuthToken == true ? CancelToken() : null,
    );
  }

  Future<Response> delete(String path, {Map<String, dynamic>? headers}) {
    return _dio.delete(path, options: Options(headers: headers));
  }
}
