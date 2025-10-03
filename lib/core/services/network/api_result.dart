
import 'package:dio/dio.dart';

abstract class BaseRepository {
  Future<ApiResult<T>> callApi<T>(Future<T> Function() request) async {
    try {
      final result = await request();
      return ApiSuccess(result);
    } on DioException catch (e) {
      final failure = AppFailure(
        e.error?.toString() ?? 'Request failed',
        statusCode: e.response?.statusCode,
      );
      return ApiFailure(failure);
    } catch (e) { 
      return ApiFailure(
        AppFailure('Unexpected error: ${e.toString()}'),
      );
    }
  }
}

sealed class ApiResult<T> {
  const ApiResult();

  bool get isSuccess => this is ApiSuccess<T>;
  bool get isFailure => this is ApiFailure<T>;

  T? get data => this is ApiSuccess<T> ? (this as ApiSuccess<T>).value : null;
  AppFailure? get failure =>
      this is ApiFailure<T> ? (this as ApiFailure<T>).error : null;
}

class ApiSuccess<T> extends ApiResult<T> {
  final T value;
  const ApiSuccess(this.value);
}

class ApiFailure<T> extends ApiResult<T> {
  final AppFailure error;
  const ApiFailure(this.error);
}

class AppFailure{
  final String message;
  final int? statusCode;
  const AppFailure(this.message, {this.statusCode});
}




// sealed class ApiResult<T> {
//   const ApiResult();
//   R when<R>({required R Function(T data) success, required R Function(AppFailure failure) failure});
// }

// class ApiSuccess<T> extends ApiResult<T> {
//   final T data;
//   const ApiSuccess(this.data);

//   @override
//   R when<R>({required R Function(T data) success, required R Function(AppFailure failure) failure}) {
//     return success(data);
//   }
// }

// class ApiFailure<T> extends ApiResult<T> {
//   final AppFailure error;
//   const ApiFailure(this.error);



//   @override
//   R when<R>({required R Function(T data) success, required R Function(AppFailure failure) failure}) {
//     return failure(error);
//   }
// }