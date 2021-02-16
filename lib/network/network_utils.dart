import 'package:dio/dio.dart';
import 'package:flutter_apra/controllers/enums.dart';
import 'package:flutter_apra/network/handle_error.dart';
import 'package:flutter_apra/network/logging_interceptor.dart';
import 'package:flutter_apra/network/response.dart';

String _baseUrl = '';
typedef NetSuccessCallback<T> = Function(T data);
typedef NetSuccessListCallback<T> = Function(List<T> data);
typedef NetErrorCallback = Function(int code, String msg);

class NetworkUtils {
  static final NetworkUtils _networkUtils = NetworkUtils._();

  factory NetworkUtils() => _networkUtils;

  static NetworkUtils get instance => NetworkUtils();
  Dio _dio;

  Dio get dio => _dio;

  NetworkUtils._() {
    final BaseOptions _options = BaseOptions(baseUrl: _baseUrl);
    _dio = Dio(_options);
    _dio.interceptors.add(LoggingInterceptor());
  }

  Options _configureOptions(String method, Options options) {
    options ??= Options();
    options.method = method;
    return options;
  }

  Future<APIResponse> _request(String method, String urlPath,
      {dynamic data,
      Map<String, dynamic> queryParameters,
      Options options}) async {
    final Response response = await _dio.request(
      urlPath,
      data: data,
      queryParameters: queryParameters,
      options: _configureOptions(method, options),
    );
    return APIResponse(
        data: response.data,
        code: response.statusCode,
        message: response.statusMessage);
  }

  Future networkRequest<T>(
    Method method,
    String url, {
    NetSuccessCallback<T> onSuccess,
    NetErrorCallback onError,
    dynamic params,
    Map<String, dynamic> queryParameters,
    Options options,
  }) async {
    try {
      final requestResponse = await _request(
        method.value,
        url,
        data: params,
        queryParameters: queryParameters,
        options: options,
      );

      if (requestResponse.code == 200) {
        if (onSuccess != null) onSuccess(requestResponse.data);
      } else {
        _onError(requestResponse.code, requestResponse.message, onError);
      }
    } catch (exception) {
      final NetError error = ExceptionHandle.handleException(exception);
      _onError(error.code, error.msg, onError);
    }
  }

  Future asyncNetworkRequest<T>(
    Method method,
    String url, {
    NetSuccessCallback<T> onSuccess,
    NetErrorCallback onError,
    dynamic params,
    Map<String, dynamic> queryParameters,
    Options options,
  }) async {
    try {
      Stream.fromFuture(_request(
        method.value,
        url,
        data: params,
        queryParameters: queryParameters,
        options: options,
      )).asBroadcastStream().listen((requestResponse) {
        if (requestResponse.code == 200) {
          if (onSuccess != null) onSuccess(requestResponse.data);
        } else {
          _onError(requestResponse.code, requestResponse.message, onError);
        }
      }, onError: (exception) {
        final NetError error = ExceptionHandle.handleException(exception);
        _onError(error.code, error.msg, onError);
      });
    } catch (exception) {
      final NetError error = ExceptionHandle.handleException(exception);
      _onError(error.code, error.msg, onError);
    }
  }

  Future postFormData<T>(
    String urlPath, {
    FormData formData,
    NetSuccessCallback<T> onSuccess,
    NetErrorCallback onError,
    Map<String, dynamic> queryParameters,
    Options options,
  }) async {
    try {
      final requestResponse = await dio.post(urlPath,
          data: formData, queryParameters: queryParameters, options: options);

      if (requestResponse.statusCode == 200) {
        if (onSuccess != null) onSuccess(requestResponse.data);
      } else {
        _onError(
            requestResponse.statusCode, requestResponse.statusMessage, onError);
      }
    } catch (exception) {
      final NetError error = ExceptionHandle.handleException(exception);
      _onError(error.code, error.msg, onError);
    }
  }

  Future download<T>(
    String urlPath,
    String savePath, {
    NetSuccessCallback<T> onSuccess,
    NetErrorCallback onError,
    Map<String, dynamic> data,
    Map<String, dynamic> queryParameters,
    Options options,
  }) async {
    try {
      final requestResponse = await dio.download(urlPath, savePath,
          data: data, queryParameters: queryParameters, options: options);
      if (requestResponse.statusCode == 200) {
        if (onSuccess != null) onSuccess(requestResponse.data);
      } else {
        _onError(
            requestResponse.statusCode, requestResponse.statusMessage, onError);
      }
    } catch (exception) {
      final NetError error = ExceptionHandle.handleException(exception);
      _onError(error.code, error.msg, onError);
    }
  }

  void _onError(int code, String msg, NetErrorCallback onError) {
    if (code == null) {
      code = ExceptionHandle.unknown_error;
      msg = 'Unknown error';
    }
    if (onError != null) {
      onError(code, msg);
    }
  }
}
