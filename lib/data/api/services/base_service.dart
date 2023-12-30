import 'package:dio/dio.dart' as dio;

import '../models/response/api_response.dart';
import '../rest_client.dart';

abstract class BaseService {
  Future<dynamic> getWithCustomUrl(String customUrl, String path,
      {Map<String, dynamic>? params}) async {
    final response = await RestClient.getDio(customUrl: customUrl)
        .get(path, queryParameters: params);
    return response.data;
  }

  Future<dynamic> getWithCustomUrlPost(String customUrl, String path,
      {Map<String, dynamic>? data}) async {
    final response =
        await RestClient.getDio(customUrl: customUrl).post(path, data: data);
    return response.data;
  }

  Future<ApiResponse> get(String path, {Map<String, dynamic>? params}) async {
    final response =
        await RestClient.getDio().get(path, queryParameters: params);
    return _handleResponse(response);
  }

  Future<ApiResponse> post(String path,
      {data, bool enableCache = false}) async {
    final response = await RestClient.getDio().post(path, data: data);
    return _handleResponse(response);
  }

  Future<ApiResponse> put(String path, {data}) async {
    final response = await RestClient.getDio().put(path, data: data);
    return _handleResponse(response);
  }

  Future<ApiResponse> delete(String path, {data}) async {
    final response = await RestClient.getDio().delete(path, data: data);
    return _handleResponse(response);
  }

  Future<ApiResponse> postUpload(String path, {data}) async {
    final response = await RestClient.getDio().post(path, data: data);
    return _handleResponse(response);
  }

  ApiResponse _handleResponse(dio.Response response) {
    final apiResponse = ApiResponse.fromJson(response.data);
    print('_handleResponse:result::' + apiResponse.toString());
    if (apiResponse.result == true) {
      print('_handleResponse:ok::' + apiResponse.toString());
      return apiResponse;
    } else {
      print('_handleResponse:fail::' + apiResponse.toString());
      return throw apiResponse;
    }
  }
}
