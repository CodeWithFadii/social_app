import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/response/response.dart' hide Response;
import 'package:get/route_manager.dart';

import '../../config/app_config.dart';
import '../../di/service_locator.dart';
import '../../routes/app_routes.dart';
import '../secure_storage/secure_storage_service.dart';
import 'api_result.dart';
import 'app_logger.dart';

class ApiInterceptors extends Interceptor {
  Future<String> getToken() async {
    final storage = getIt<SecureStorageService>();
    final token = await storage.getString(AppConfig.authTokenKey) ?? '';
    return token;
  }

  AppFailure toFailure(DioException e) {
    final message = e.response?.data is Map<String, dynamic>
        ? (e.response?.data['message'] as String?) ?? 'Request failed'
        : e.message ?? 'Request failed';
    return AppFailure(message, statusCode: e.response?.statusCode);
  }

  Future<AppFailure> handleError(DioException error) async {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return AppFailure(
          'Connection timeout. Please check your internet connection.',
          statusCode: null,
        );

      case DioExceptionType.badResponse:
        return _handleBadResponse(error);

      case DioExceptionType.cancel:
        return AppFailure('Request was cancelled', statusCode: null);

      case DioExceptionType.unknown:
      default:
        return AppFailure('An unexpected error occurred. Please try again.', statusCode: null);
    }
  }

  Future<AppFailure> _handleBadResponse(DioException error) async {
    final statusCode = error.response?.statusCode;
    final responseData = error.response?.data;

    switch (statusCode) {
      case 400:
        return AppFailure(_extractMessage(responseData, 'Bad request'), statusCode: statusCode);

      case 401:
        return await _handleUnauthorized(error);

      case 403:
        return AppFailure(
          _extractMessage(responseData, 'Access forbidden'),
          statusCode: statusCode,
        );

      case 404:
        return AppFailure(
          _extractMessage(responseData, 'Resource not found'),
          statusCode: statusCode,
        );

      case 422:
        return AppFailure(
          _extractMessage(responseData, 'Validation error'),
          statusCode: statusCode,
        );

      case 429:
        return AppFailure(
          _extractMessage(responseData, 'Too many requests. Please try again later.'),
          statusCode: statusCode,
        );

      case 500:
        return AppFailure(
          _extractMessage(responseData, 'Internal server error. Please try again later.'),
          statusCode: statusCode,
        );

      case 502:
        return AppFailure(
          _extractMessage(responseData, 'Bad gateway. Please try again later.'),
          statusCode: statusCode,
        );

      case 503:
        return AppFailure(
          _extractMessage(responseData, 'Service unavailable. Please try again later.'),
          statusCode: statusCode,
        );

      case 504:
        return AppFailure(
          _extractMessage(responseData, 'Gateway timeout. Please try again later.'),
          statusCode: statusCode,
        );

      default:
        return AppFailure(_extractMessage(responseData, 'Request failed'), statusCode: statusCode);
    }
  }

  String _extractMessage(dynamic responseData, String defaultMessage) {
    if (responseData is Map<String, dynamic>) {
      return (responseData['message'] as String?) ??
          (responseData['error'] as String?) ??
          defaultMessage;
    }
    return defaultMessage;
  }

  Future<AppFailure> _handleUnauthorized(DioException error) async {
    final responseData = error.response?.data;
    final storage = getIt<SecureStorageService>();
    await storage.clear();
    Get.offAllNamed(AppRoutes.signInScreen);
    return AppFailure(
      _extractMessage(responseData, 'Session Expired. Please login again.'),
      statusCode: 401,
    );
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final jwtToken = await getToken();
    if (jwtToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $jwtToken';
    }
    AppLogger.info('REQUEST[${options.method}] => PATH: ${options.uri}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    AppLogger.debug('RESPONSE[${response.statusCode}] => ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final failure = handleError(err);

    AppLogger.error('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.uri}');
    AppLogger.debug('Error Data: ${err.response?.data}');
    AppLogger.error('Stack Trace: ${err.stackTrace}');
    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: failure,
      ),
    );
  }
}
