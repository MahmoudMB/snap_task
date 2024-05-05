class APIUrls {
  static const String BaseUrl = "";

  static const String segment = "/segment";
  static String updateSegment(String id) => "/segment/$id";
  static String segmentUsers(String id) => "/segment/$id/user";
}
