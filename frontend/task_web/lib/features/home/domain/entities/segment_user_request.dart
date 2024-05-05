// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class SegmentUserRequest {
  String segmentId;
  List<String> userIds;
  String idType;
  SegmentUserRequest({
    required this.segmentId,
    required this.userIds,
    required this.idType,
  });

  SegmentUserRequest copyWith({
    String? segmentId,
    List<String>? userIds,
    String? idType,
  }) {
    return SegmentUserRequest(
      segmentId: segmentId ?? this.segmentId,
      userIds: userIds ?? this.userIds,
      idType: idType ?? this.idType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'segmentId': segmentId,
      'userIds': userIds,
      'idType': idType,
    };
  }

  factory SegmentUserRequest.fromMap(Map<String, dynamic> map) {
    return SegmentUserRequest(
      segmentId: map['segmentId'] as String,
      userIds: List<String>.from((map['userIds'] as List<String>)),
      idType: map['idType'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SegmentUserRequest.fromJson(String source) =>
      SegmentUserRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SegmentUserRequest(segmentId: $segmentId, userIds: $userIds, idType: $idType)';

  @override
  bool operator ==(covariant SegmentUserRequest other) {
    if (identical(this, other)) return true;

    return other.segmentId == segmentId &&
        listEquals(other.userIds, userIds) &&
        other.idType == idType;
  }

  @override
  int get hashCode => segmentId.hashCode ^ userIds.hashCode ^ idType.hashCode;
}
