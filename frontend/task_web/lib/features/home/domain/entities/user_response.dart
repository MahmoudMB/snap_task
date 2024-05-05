// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserResponse {
  final List<User>? users;

  UserResponse({
    this.users,
  });

  UserResponse copyWith({
    List<User>? users,
  }) =>
      UserResponse(
        users: users ?? this.users,
      );
}

class User {
  final String? schemaType;
  final String? segmentId;
  final String? userId;
  User({
    this.schemaType,
    this.segmentId,
    this.userId,
  });

  User copyWith({
    String? schemaType,
    String? segmentId,
    String? userId,
  }) {
    return User(
      schemaType: schemaType ?? this.schemaType,
      segmentId: segmentId ?? this.segmentId,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'schemaType': schemaType,
      'segmentId': segmentId,
      'userId': userId,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      schemaType:
          map['schemaType'] != null ? map['schemaType'] as String : null,
      segmentId: map['segmentId'] != null ? map['segmentId'] as String : null,
      userId: map['userId'] != null ? map['userId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'User(schemaType: $schemaType, segmentId: $segmentId, userId: $userId)';
}
