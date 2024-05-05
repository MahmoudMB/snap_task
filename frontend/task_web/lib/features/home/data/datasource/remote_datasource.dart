import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:task_web/core/utils/api_urls.dart';

import '../../../../core/errors/errors_exports.dart';
import '../../../../core/response_body_model.dart';
import '../../../../core/services/remote/web_service.dart';
import '../../home_exports.dart'
    show
        SegmentRequest,
        SegmentUserRequest,
        SegmentsResponseModel,
        UsersResponseModel;

abstract class HomeRemoteDataSource {
  Future<ResponseData<SegmentsResponseModel>> getSegments();

  Future<ResponseData<dynamic>> addSegment({required SegmentRequest params});
  Future<ResponseData<dynamic>> updateSegment({required SegmentRequest params});
  Future<ResponseData<dynamic>> addSegmentUser(
      {required SegmentUserRequest params});

  Future<ResponseData<UsersResponseModel>> getSegmentUsers(
      {required String params});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final WebService webService;
  HomeRemoteDataSourceImpl({required this.webService});

  @override
  Future<ResponseData<dynamic>> addSegment(
      {required SegmentRequest params}) async {
    var response;

    try {
      print(params.toMap());
      response =
          await webService.dio.post(APIUrls.segment, data: params.toMap());
      final data = response.data;
      print("success ${data['message']}");

      final result = ResponseData<dynamic>.fromMap(data);

      return result;
    } on DioError catch (error) {
      print("err");

      print(error);
      throw ServerException(
        error.toString(),
        statusCode: error.response?.statusCode,
        dioError: error,
      );
    } catch (ex) {
      print("err 1");

      print(ex);

      if (ex is ServerException) {
        rethrow;
      } else {
        throw ServerException("Error Occured",
            exception: APIException(
              errorMessage: ex.toString(),
            ),
            response: response);
      }
    }
  }

  @override
  Future<ResponseData> updateSegment({required SegmentRequest params}) async {
    var response;

    try {
      print(params.toMap());

      response = await webService.dio
          .put(APIUrls.updateSegment(params.id!), data: params.toMap());
      final data = response.data;
      print("success ${data['message']}");

      final result = ResponseData<dynamic>.fromMap(data);

      return result;
    } on DioError catch (error) {
      print("err");

      print(error);
      throw ServerException(
        error.toString(),
        statusCode: error.response?.statusCode,
        dioError: error,
      );
    } catch (ex) {
      print("err 1");

      print(ex);

      if (ex is ServerException) {
        rethrow;
      } else {
        throw ServerException("Error Occured",
            exception: APIException(
              errorMessage: ex.toString(),
            ),
            response: response);
      }
    }
  }

  @override
  Future<ResponseData> addSegmentUser(
      {required SegmentUserRequest params}) async {
    var response;
    print(params.toMap());

    try {
      response = await webService.dio.post(
          APIUrls.segmentUsers(params.segmentId),
          queryParameters: {"user_type": params.idType},
          data: jsonEncode(params.userIds));
      final data = response.data;
      print("success ${data['message']}");

      final result = ResponseData<dynamic>.fromMap(data);

      return result;
    } on DioError catch (error) {
      print("err");
      print(error.requestOptions.data);
      print(error);
      throw ServerException(
        error.toString(),
        statusCode: error.response?.statusCode,
        dioError: error,
      );
    } catch (ex) {
      print("err 1");

      print(ex);

      if (ex is ServerException) {
        rethrow;
      } else {
        throw ServerException("Error Occured",
            exception: APIException(
              errorMessage: ex.toString(),
            ),
            response: response);
      }
    }
  }

  @override
  Future<ResponseData<SegmentsResponseModel>> getSegments() async {
    var response;

    try {
      response = await webService.dio.get(APIUrls.segment);
      final data = response.data;
      print("success ${data}");

      final result = ResponseData<SegmentsResponseModel>.fromMap(data,
          parsedResult: SegmentsResponseModel.fromJson(data["result"]));

      return result;
    } on DioError catch (error) {
      print("err");

      print(error);
      throw ServerException(
        error.toString(),
        statusCode: error.response?.statusCode,
        dioError: error,
      );
    } catch (ex) {
      print("err 1");

      print(ex);

      if (ex is ServerException) {
        rethrow;
      } else {
        throw ServerException("Error Occured",
            exception: APIException(
              errorMessage: ex.toString(),
            ),
            response: response);
      }
    }
  }

  @override
  Future<ResponseData<UsersResponseModel>> getSegmentUsers(
      {required String params}) async {
    var response;

    try {
      response = await webService.dio.get(APIUrls.segmentUsers(params));
      final data = response.data;
      print("success ${data}");

      final result = ResponseData<UsersResponseModel>.fromMap(data,
          parsedResult: UsersResponseModel.fromJson(data));

      return result;
    } on DioError catch (error) {
      print("err");

      print(error);
      throw ServerException(
        error.toString(),
        statusCode: error.response?.statusCode,
        dioError: error,
      );
    } catch (ex) {
      print("err 1");

      print(ex);

      if (ex is ServerException) {
        rethrow;
      } else {
        throw ServerException("Error Occured",
            exception: APIException(
              errorMessage: ex.toString(),
            ),
            response: response);
      }
    }
  }
}
