import 'package:equatable/equatable.dart';

import '../../../../../core/utils/enums/bloc_status.dart';
import '../../../home_exports.dart' show SegmentsResponse, User;

class HomeState extends Equatable {
  final BlocStatus status;
  final String? errorMessage;
  final BlocStatus segmentsStatus;
  final SegmentsResponse? segments;
  final List<User>? segmentUsers;
  const HomeState(
      {this.errorMessage,
      this.status = BlocStatus.initial,
      this.segmentsStatus = BlocStatus.initial,
      this.segments,
      this.segmentUsers});

  HomeState copyWith(
      {final BlocStatus? status,
      final String? errorMessage,
      final SegmentsResponse? segments,
      final BlocStatus? segmentsStatus,
      final List<User>? segmentUsers}) {
    return HomeState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        segments: segments ?? this.segments,
        segmentsStatus: segmentsStatus ?? this.segmentsStatus,
        segmentUsers: segmentUsers ?? this.segmentUsers);
  }

  @override
  List<Object?> get props => [status, errorMessage, segmentsStatus];
}
