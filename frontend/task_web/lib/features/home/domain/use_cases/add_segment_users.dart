import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/response_body_model.dart';
import '../../../../core/utils/use_case.dart';
import '../../home_exports.dart' show SegmentUserRequest, HomeRepository;

class AddSegmentUsers
    extends UseCase<ResponseData<dynamic>, SegmentUserRequest> {
  final HomeRepository repository;

  AddSegmentUsers({required this.repository});

  @override
  Future<Either<Failure, ResponseData<dynamic>>> call(
      SegmentUserRequest params) async {
    return await repository.addSegmentUser(params: params);
  }
}
