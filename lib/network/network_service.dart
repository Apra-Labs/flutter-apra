import 'package:dio/dio.dart';
import 'package:flutter_apra/network/response.dart';

String _baseUrl = '';

class NetworkService {
  static final NetworkService _networkService = NetworkService._();

  factory NetworkService() => _networkService;

  static NetworkService get instance => NetworkService();
  Dio _dio;

  Dio get dio => _dio;

  NetworkService._() {
    final BaseOptions _options = BaseOptions(baseUrl: _baseUrl);
    _dio = Dio(_options);
  }

  Future<APIResponse> post(
    String urlPath, {
    Map<String, dynamic> data,
    Map<String, dynamic> queryParameters,
    Options options,
  }) async {
    final response = await dio.post(urlPath,
        data: data, queryParameters: queryParameters, options: options);
    return APIResponse(
        code: response.statusCode,
        data: response.data,
        message: response.statusMessage);
  }

  Future<APIResponse> get(
    String urlPath, {
    Map<String, dynamic> queryParameters,
    Options options,
  }) async {
    final response = await dio.get(urlPath,
        queryParameters: queryParameters, options: options);
    return APIResponse(
        code: response.statusCode,
        data: response.data,
        message: response.statusMessage);
  }

  Future<APIResponse> put(
    String urlPath, {
    Map<String, dynamic> data,
    Map<String, dynamic> queryParameters,
    Options options,
  }) async {
    final response = await dio.put(urlPath,
        data: data, queryParameters: queryParameters, options: options);
    return APIResponse(
        code: response.statusCode,
        data: response.data,
        message: response.statusMessage);
  }

  Future<APIResponse> delete(
    String urlPath, {
    Map<String, dynamic> data,
    Map<String, dynamic> queryParameters,
    Options options,
  }) async {
    final response = await dio.delete(urlPath,
        data: data, queryParameters: queryParameters, options: options);
    return APIResponse(
        code: response.statusCode,
        data: response.data,
        message: response.statusMessage);
  }

  Future<APIResponse> postFormData(
    String urlPath, {
    FormData data,
    Map<String, dynamic> queryParameters,
    Options options,
  }) async {
    final response = await dio.post(urlPath,
        data: data, queryParameters: queryParameters, options: options);
    return APIResponse(
        code: response.statusCode,
        data: response.data,
        message: response.statusMessage);
  }

  Future download(
    String urlPath,
    String savePath, {
    Map<String, dynamic> data,
    Map<String, dynamic> queryParameters,
    Options options,
  }) async {
    final response = await dio.download(urlPath, savePath,
        data: data, queryParameters: queryParameters, options: options);
    return APIResponse(
        code: response.statusCode,
        data: response.data,
        message: response.statusMessage);
  }
}
