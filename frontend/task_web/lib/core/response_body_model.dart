class ResponseData<T> {
  bool? success;
  String? message;
  T? result;

  ResponseData({this.success, this.message, this.result});

  factory ResponseData.fromMap(Map<String, dynamic> json, {T? parsedResult}) =>
      ResponseData(
          success: json["success"],
          message: json["message"],
          result: parsedResult ?? json["result"]);
}
