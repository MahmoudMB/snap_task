import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:task_web/core/utils/use_case.dart';

import '../../../../../core/di/injection_container.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/utils/enums/bloc_status.dart';
import '../../../home_exports.dart'
    show
        AddSegment,
        AddSegmentUsers,
        GetSegments,
        GetUsersSegments,
        SegmentRequest,
        SegmentUserRequest,
        UpdateSegment;
import 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  final AddSegmentUsers _addSegmentUsers;
  final AddSegment _addSegment;
  final UpdateSegment _updateSegment;
  final GetSegments _getSegment;
  final GetUsersSegments _getUsersSegments;

  HomeBloc()
      : _addSegmentUsers = AddSegmentUsers(repository: sl()),
        _addSegment = AddSegment(repository: sl()),
        _updateSegment = UpdateSegment(repository: sl()),
        _getSegment = GetSegments(repository: sl()),
        _getUsersSegments = GetUsersSegments(repository: sl()),
        super(const HomeState()) {
    getSegments();
  }

  Future<void> getSegments() async {
    emit(state.copyWith(
      segmentsStatus: BlocStatus.loading,
    ));
    final failureOrSuccess = await _getSegment(NoParams());

    failureOrSuccess.fold((l) {
      print("fail");
      print(l);
      emit(
        state.copyWith(
            segmentsStatus: BlocStatus.failure,
            errorMessage: (l as ServerFailure).errorMessage),
      );
    }, (r) {
      emit(state.copyWith(
        segmentsStatus: BlocStatus.success,
        segments: r.result,
        errorMessage: "",
      ));
    });
  }

  Future<void> addSegments(String name, String desc, String sourceType) async {
    emit(state.copyWith(
      status: BlocStatus.loading,
    ));
    final failureOrSuccess = await _addSegment(
        SegmentRequest(name: name, description: desc, sourceType: sourceType));

    failureOrSuccess.fold((l) {
      emit(
        state.copyWith(
            status: BlocStatus.failure,
            errorMessage: (l as ServerFailure).errorMessage),
      );
    }, (r) {
      emit(state.copyWith(
        status: BlocStatus.success,
        errorMessage: "",
      ));
      getSegments();
    });
  }

  Future<void> updateSegment(String id, String name, String desc) async {
    emit(state.copyWith(
      status: BlocStatus.loading,
    ));
    final failureOrSuccess = await _updateSegment(
        SegmentRequest(id: id, name: name, description: desc));

    failureOrSuccess.fold((l) {
      emit(
        state.copyWith(
            status: BlocStatus.failure,
            errorMessage: (l as ServerFailure).errorMessage),
      );
    }, (r) {
      emit(state.copyWith(
        status: BlocStatus.success,
        errorMessage: "",
      ));
      getSegments();
    });
  }

  Future<void> addUsersToSegments(
      String segmentId, String userSchemaType, List<String> userIds) async {
    emit(state.copyWith(
      status: BlocStatus.loading,
    ));
    final failureOrSuccess = await _addSegmentUsers(SegmentUserRequest(
        segmentId: segmentId, userIds: userIds, idType: userSchemaType));

    failureOrSuccess.fold((l) {
      emit(
        state.copyWith(
            status: BlocStatus.failure,
            errorMessage: (l as ServerFailure).errorMessage),
      );
    }, (r) {
      emit(state.copyWith(
        status: BlocStatus.success,
        errorMessage: "",
      ));
      getSegments();
    });
  }

  Future<void> getUsersSegments(String segmentId) async {
    emit(state.copyWith(status: BlocStatus.loading, segmentUsers: []));
    final failureOrSuccess = await _getUsersSegments(segmentId);

    failureOrSuccess.fold((l) {
      print("fail");
      print(l);
      emit(
        state.copyWith(
            status: BlocStatus.failure,
            errorMessage: (l as ServerFailure).errorMessage),
      );
    }, (r) {
      emit(state.copyWith(
        status: BlocStatus.success,
        segmentUsers: r.result?.users,
        errorMessage: "",
      ));
    });
  }
}
