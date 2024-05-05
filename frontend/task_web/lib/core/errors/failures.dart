import 'package:equatable/equatable.dart' show Equatable;

abstract class Failure extends Equatable {
  final List properties;

  const Failure([this.properties = const <Object?>[]]);

  @override
  List<Object?> get props => properties;
}

// Global Failures
class ServerFailure extends Failure {
  final String errorMessage;
  final int? statusCode;
  dynamic errorCode;
  ServerFailure(this.errorMessage, {this.statusCode, this.errorCode})
      : super([errorMessage, statusCode, errorCode]);
}

class CacheFailure extends Failure {}

class AuthNotFoundedFailure extends Failure {}

class CannotPrintBillFailure extends Failure {}

class NoDataFoundFailure extends Failure {}

class NoInternetConnectionFailure extends Failure {
  @override
  String toString() => "NoInternetConnectionFailure";
}
