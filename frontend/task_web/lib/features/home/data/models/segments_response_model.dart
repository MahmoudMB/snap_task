import '../../home_exports.dart' show SegmentsResponse, SegmentElement, Segment;

class SegmentsResponseModel extends SegmentsResponse {
  SegmentsResponseModel({
    super.segments,
  });

  factory SegmentsResponseModel.fromJson(Map<String, dynamic> json) =>
      SegmentsResponseModel(
        segments: json["segments"] == null
            ? []
            : List<SegmentElement>.from(
                json["segments"]!.map((x) => SegmentElementModel.fromJson(x))),
      );
}

class SegmentElementModel extends SegmentElement {
  SegmentElementModel({
    super.subRequestStatus,
    super.segment,
  });

  factory SegmentElementModel.fromJson(Map<String, dynamic> json) =>
      SegmentElementModel(
        subRequestStatus: json["sub_request_status"],
        segment: json["segment"] == null
            ? null
            : SegmentModel.fromJson(json["segment"]),
      );
}

class SegmentModel extends Segment {
  SegmentModel({
    super.id,
    super.updatedAt,
    super.createdAt,
    super.name,
    super.adAccountId,
    super.organizationId,
    super.description,
    super.status,
    super.targetableStatus,
    super.uploadStatus,
    super.sourceType,
    super.retentionInDays,
    super.approximateNumberUsers,
    super.visibleTo,
  });

  factory SegmentModel.fromJson(Map<String, dynamic> json) => SegmentModel(
        id: json["id"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        name: json["name"],
        adAccountId: json["ad_account_id"],
        organizationId: json["organization_id"],
        description: json["description"],
        status: json["status"],
        targetableStatus: json["targetable_status"],
        uploadStatus: json["upload_status"],
        sourceType: json["source_type"],
        retentionInDays: json["retention_in_days"],
        approximateNumberUsers: json["approximate_number_users"],
        visibleTo: json["visible_to"] == null
            ? []
            : List<String>.from(json["visible_to"]!.map((x) => x)),
      );
}
