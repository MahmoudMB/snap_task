import '../../home_exports.dart' show UserResponse, User;

class UsersResponseModel extends UserResponse {
  UsersResponseModel({
    super.users,
  });

  factory UsersResponseModel.fromJson(Map<String, dynamic> json) =>
      UsersResponseModel(
        users: json["result"] == null
            ? []
            : List<UserModel>.from(
                json["result"]!.map((x) => UserModel.fromJson(x))),
      );
}

class UserModel extends User {
  UserModel({super.schemaType, super.segmentId, super.userId});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      schemaType: json["schemaType"],
      segmentId: json["segmentId"],
      userId: json["userId"]);
}
