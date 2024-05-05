import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/response_body_model.dart';
import '../../home_exports.dart'
    show SegmentRequest, SegmentUserRequest, SegmentsResponse, UserResponse;

abstract class HomeRepository {
  Future<Either<Failure, ResponseData<dynamic>>> addSegment(
      {required SegmentRequest params});
  Future<Either<Failure, ResponseData<SegmentsResponse>>> getSegments();
  Future<Either<Failure, ResponseData<dynamic>>> addSegmentUser(
      {required SegmentUserRequest params});
  Future<Either<Failure, ResponseData<dynamic>>> updateSegment(
      {required SegmentRequest params});

  Future<Either<Failure, ResponseData<UserResponse>>> getSegmentUsers(
      {required String params});
}
