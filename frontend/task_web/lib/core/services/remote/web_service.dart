import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../errors/errors_exports.dart';

// Please using any technique to create singleton WebService (GetIt)
class WebService {
  final Dio dio;

  WebService({required this.dio}) {
    dio.options.baseUrl = "http://127.0.0.1:8000";
    dio.options.connectTimeout = const Duration(seconds: 60);
    dio.options.receiveTimeout = const Duration(seconds: 60);
    dio.options.sendTimeout = const Duration(seconds: 60);
    //dio.options.headers = {"Content-Type": "application/json"};
    //  dio.options.headers['Access-Control-Allow-Origin'] = '*';

    dio.interceptors.add(AppInterceptors());
  }

  WebService.newDio({
    required this.dio,
  });
}

class AppInterceptors extends Interceptor {
  AppInterceptors() {}

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String url = options.uri.toString();
    print(url);
    final method = options.method;

    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(err);
    switch (err.type) {
      // case DioErrorType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions, err.response);

          case 202:
            throw BadRequestException(err.requestOptions, err.response);
          case 401:
            throw UnAuthorizedException(err.requestOptions, err.response);
          case 404:
            throw RequestNotFoundException(err.requestOptions, err.response);
          case 405:
            throw MethodNotAllowedException(err.requestOptions, err.response);
          case 409:
            throw ConflictException(err.requestOptions, err.response);
          case 500:
            throw InternalServerErrorException(
              err.requestOptions,
              err.response,
            );
          default:
            throw BadRequestException(err.requestOptions, err.response);
        }
        break;
      case DioExceptionType.cancel:
        break;
        // case DioErrorType.badCertificate:
        break;
        // case DioErrorType.connectionError:
        throw NoInternetConnectionException(err.requestOptions);
        break;
      case DioExceptionType.unknown:
        throw BadRequestException(err.requestOptions, err.response);

      default:
        throw BadRequestException(err.requestOptions, err.response);
    }
    throw BadRequestException(err.requestOptions, err.response);

    return handler.next(err);
  }

  String get languageCode => "ar";

  bool get mounted => true;
}

class ApiHeaders {
  static const authorization = "authorization";
}
