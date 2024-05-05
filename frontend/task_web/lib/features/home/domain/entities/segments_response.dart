class SegmentsResponse {
  final List<SegmentElement>? segments;

  SegmentsResponse({
    this.segments,
  });

  SegmentsResponse copyWith({
    List<SegmentElement>? segments,
  }) =>
      SegmentsResponse(
        segments: segments ?? this.segments,
      );
}

class SegmentElement {
  final String? subRequestStatus;
  final Segment? segment;

  SegmentElement({
    this.subRequestStatus,
    this.segment,
  });

  SegmentElement copyWith({
    String? subRequestStatus,
    Segment? segment,
  }) =>
      SegmentElement(
        subRequestStatus: subRequestStatus ?? this.subRequestStatus,
        segment: segment ?? this.segment,
      );
}

class Segment {
  final String? id;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final String? name;
  final String? adAccountId;
  final String? organizationId;
  final String? description;
  final String? status;
  final String? targetableStatus;
  final String? uploadStatus;
  final String? sourceType;
  final int? retentionInDays;
  final int? approximateNumberUsers;
  final List<String>? visibleTo;

  Segment({
    this.id,
    this.updatedAt,
    this.createdAt,
    this.name,
    this.adAccountId,
    this.organizationId,
    this.description,
    this.status,
    this.targetableStatus,
    this.uploadStatus,
    this.sourceType,
    this.retentionInDays,
    this.approximateNumberUsers,
    this.visibleTo,
  });

  Segment copyWith({
    String? id,
    DateTime? updatedAt,
    DateTime? createdAt,
    String? name,
    String? adAccountId,
    String? organizationId,
    String? description,
    String? status,
    String? targetableStatus,
    String? uploadStatus,
    String? sourceType,
    int? retentionInDays,
    int? approximateNumberUsers,
    List<String>? visibleTo,
  }) =>
      Segment(
        id: id ?? this.id,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
        adAccountId: adAccountId ?? this.adAccountId,
        organizationId: organizationId ?? this.organizationId,
        description: description ?? this.description,
        status: status ?? this.status,
        targetableStatus: targetableStatus ?? this.targetableStatus,
        uploadStatus: uploadStatus ?? this.uploadStatus,
        sourceType: sourceType ?? this.sourceType,
        retentionInDays: retentionInDays ?? this.retentionInDays,
        approximateNumberUsers:
            approximateNumberUsers ?? this.approximateNumberUsers,
        visibleTo: visibleTo ?? this.visibleTo,
      );
}
