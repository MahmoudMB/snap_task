import 'package:dartz/dartz.dart';
import 'package:task_web/features/home/domain/entities/segment_user_request.dart';
import 'package:task_web/features/home/domain/entities/segments_response.dart';

import '../../../../core/errors/errors_exports.dart';
import '../../../../core/response_body_model.dart';
import '../../home_exports.dart'
    show HomeRemoteDataSource, HomeRepository, SegmentRequest, UserResponse;

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ResponseData<dynamic>>> addSegment(
      {required SegmentRequest params}) async {
    try {
      final data = await remoteDataSource.addSegment(params: params);
      return Right(data);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage,
          statusCode: error.statusCode, errorCode: error.errorCode));
    }
  }

  @override
  Future<Either<Failure, ResponseData>> updateSegment(
      {required SegmentRequest params}) async {
    try {
      final data = await remoteDataSource.updateSegment(params: params);
      return Right(data);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage,
          statusCode: error.statusCode, errorCode: error.errorCode));
    }
  }

  @override
  Future<Either<Failure, ResponseData>> addSegmentUser(
      {required SegmentUserRequest params}) async {
    try {
      final data = await remoteDataSource.addSegmentUser(params: params);
      return Right(data);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage,
          statusCode: error.statusCode, errorCode: error.errorCode));
    }
  }

  @override
  Future<Either<Failure, ResponseData<SegmentsResponse>>> getSegments() async {
    try {
      final data = await remoteDataSource.getSegments();
      return Right(data);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage,
          statusCode: error.statusCode, errorCode: error.errorCode));
    }
  }

  @override
  Future<Either<Failure, ResponseData<UserResponse>>> getSegmentUsers(
      {required String params}) async {
    try {
      final data = await remoteDataSource.getSegmentUsers(params: params);
      return Right(data);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage,
          statusCode: error.statusCode, errorCode: error.errorCode));
    }
  }
}
