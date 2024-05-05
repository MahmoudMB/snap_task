import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/response_body_model.dart';
import '../../../../core/utils/use_case.dart';
import '../../home_exports.dart' show SegmentRequest, HomeRepository;

class UpdateSegment extends UseCase<ResponseData<dynamic>, SegmentRequest> {
  final HomeRepository repository;

  UpdateSegment({required this.repository});

  @override
  Future<Either<Failure, ResponseData<dynamic>>> call(
      SegmentRequest params) async {
    return await repository.updateSegment(params: params);
  }
}
