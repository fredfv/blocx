import 'package:dio/dio.dart';

import '../http_errors.dart';

class DioClientError extends HttpClientError implements DioException {
  DioClientError({
    super.data,
    required super.message,
    required super.statusCode,
    super.error,
    super.stackTrace,
    super.requestOptions,
    super.response,
    super.type,
  });
  @override
  StackTrace get stackTrace => super.stackTrace!;

  @override
  RequestOptions get requestOptions => super.requestOptions!;

  @override
  Response<dynamic>? get response => super.response!;

  @override
  DioExceptionType get type => super.type!;

  @override
  DioException copyWith({
    RequestOptions? requestOptions,
    Response? response,
    DioExceptionType? type,
    Object? error,
    StackTrace? stackTrace,
    String? message,
  }) {
    return DioClientError(
      data: data ?? data,
      message: message ?? this.message,
      statusCode: statusCode ?? statusCode,
      error: error ?? this.error,
      stackTrace: stackTrace ?? this.stackTrace,
      requestOptions: requestOptions ?? this.requestOptions,
      response: response ?? this.response,
      type: type ?? this.type,
    );
  }
}
