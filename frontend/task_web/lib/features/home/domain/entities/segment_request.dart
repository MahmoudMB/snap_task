// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SegmentRequest {
  String? id;
  String name;
  String description;
  String? sourceType;
  SegmentRequest({
    this.id,
    required this.name,
    required this.description,
    this.sourceType,
  });

  SegmentRequest copyWith({
    String? id,
    String? name,
    String? description,
    String? sourceType,
  }) {
    return SegmentRequest(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      sourceType: sourceType ?? this.sourceType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      if (sourceType != null) 'source_type': sourceType,
    };
  }

  factory SegmentRequest.fromMap(Map<String, dynamic> map) {
    return SegmentRequest(
      name: map['name'] as String,
      description: map['description'] as String,
      sourceType: map['sourceType'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SegmentRequest.fromJson(String source) =>
      SegmentRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SegmentRequest(name: $name, description: $description, sourceType: $sourceType)';
}
