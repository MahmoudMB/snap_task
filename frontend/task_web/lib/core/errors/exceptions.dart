import 'package:dio/dio.dart' show DioError, RequestOptions, Response;

// Global Exceptions
class ServerException implements Exception {
  final String errorMessage;
  final int? statusCode;
  final String? statusMessage;
  final DioError? dioError;
  final Response? response;
  final dynamic errorCode;
  final Exception? exception;

  ServerException(this.errorMessage,
      {this.statusCode,
      this.statusMessage,
      this.dioError,
      this.response,
      this.errorCode,
      this.exception}) {}
}

class APIException implements Exception {
  final String? errorMessage;

  APIException({
    this.errorMessage,
  }) {}
}

class CacheException implements Exception {}

class CannotGoToSystemException implements Exception {}

class AuthNotFoundedException implements Exception {}

class CannotPrintBillException implements Exception {}

class CannotDrawAppBarTitleWidgetException implements Exception {}

/* ------------ Web Services Exceptions ------------ */
class DeadlineExceededException extends DioError {
  DeadlineExceededException(RequestOptions requestOptions)
      : super(requestOptions: requestOptions);

  @override
  String toString() => "DeadlineExceededException";
}

class BadRequestException extends DioError {
  BadRequestException(
    RequestOptions requestOptions,
    Response? response,
  ) : super(requestOptions: requestOptions, response: response);

  @override
  // String toString() => ApiResponseI.badRequest.getErrorMessage(response);
  String toString() => "";
}

class NoDataFoundException extends DioError {
  NoDataFoundException(
    RequestOptions requestOptions,
    Response? response,
  ) : super(requestOptions: requestOptions, response: response);
  @override
  String toString() => "";
}

class UnAuthorizedException extends DioError {
  UnAuthorizedException(
    RequestOptions requestOptions,
    Response? response,
  ) : super(requestOptions: requestOptions, response: response);

  @override
  String toString() => "";
}

class RequestNotFoundException extends DioError {
  RequestNotFoundException(
    RequestOptions requestOptions,
    Response? response,
  ) : super(requestOptions: requestOptions, response: response);

  @override
  String toString() => "";
}

class MethodNotAllowedException extends DioError {
  MethodNotAllowedException(
    RequestOptions requestOptions,
    Response? response,
  ) : super(requestOptions: requestOptions, response: response);

  @override
  String toString() => "";
}

class ConflictException extends DioError {
  ConflictException(
    RequestOptions requestOptions,
    Response? response,
  ) : super(requestOptions: requestOptions, response: response);

  @override
  String toString() => "";
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(
    RequestOptions requestOptions,
    Response? response,
  ) : super(requestOptions: requestOptions, response: response);

  @override
  String toString() => "";
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions requestOptions)
      : super(requestOptions: requestOptions);

  @override
  String toString() => "";
}
