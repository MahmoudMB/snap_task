import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/response_body_model.dart';
import '../../../../core/utils/use_case.dart';
import '../../home_exports.dart' show HomeRepository, UserResponse;

class GetUsersSegments extends UseCase<ResponseData<UserResponse>, String> {
  final HomeRepository repository;

  GetUsersSegments({required this.repository});

  @override
  Future<Either<Failure, ResponseData<UserResponse>>> call(
      String params) async {
    return await repository.getSegmentUsers(params: params);
  }
}
