import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/response_body_model.dart';
import '../../../../core/utils/use_case.dart';
import '../../home_exports.dart' show HomeRepository, SegmentsResponse;

class GetSegments extends UseCase<ResponseData<SegmentsResponse>, NoParams> {
  final HomeRepository repository;

  GetSegments({required this.repository});

  @override
  Future<Either<Failure, ResponseData<SegmentsResponse>>> call(
      NoParams params) async {
    return await repository.getSegments();
  }
}
