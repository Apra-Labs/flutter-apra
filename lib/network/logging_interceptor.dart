import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  DateTime _startTime;
  DateTime _endTime;
  @override
  Future onRequest(RequestOptions options) {
    _startTime = DateTime.now();
    if (options.queryParameters.isEmpty) {
      print('RequestUrl: ' + options.baseUrl + options.path);
    } else {
      print('RequestUrl: ' +
          options.baseUrl +
          options.path +
          '?' +
          Transformer.urlEncodeMap(options.queryParameters));
    }
    print('RequestMethod: ' + options.method);
    print('RequestHeaders:' + options.headers.toString());
    print('RequestContentType: ${options.contentType}');
    print('RequestData: ${options.data.toString()}');
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    _endTime = DateTime.now();
    final int duration = _endTime.difference(_startTime).inMilliseconds;
    print('ResponseCode: ${response.statusCode}');
    print('Response: ${response.data.toString()}');
    print('Time: $duration ms');
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    print("Error");
    return super.onError(err);
  }
}
