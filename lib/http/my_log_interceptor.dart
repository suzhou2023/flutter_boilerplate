import 'package:dio/dio.dart';
import 'package:pretty_json/pretty_json.dart';

import '../utils/log.dart';

class MyLogInterceptor extends InterceptorsWrapper {
  MyLogInterceptor(
    this.debug,
  );

  final bool debug;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (debug) {
      try {
        final dynamic printData =
            options.data is FormData ? options.data : prettyJson(options.data);

        final message = '''
request: 
url: ${options.uri} 
headers: ${prettyJson(options.headers)} 
queryParameters: ${prettyJson(options.queryParameters)}
data: $printData
''';
        Log.d(message);
      } catch (e) {
        Log.e(e);
      }
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (debug) {
      try {
        final dynamic printData =
            response.data is FormData ? response.data : prettyJson(response.data);

        final message = '''
response:
url: ${response.requestOptions.uri}
header: ${prettyJson(response.headers.map)}
data: $printData
''';
        Log.d(message);
      } catch (e) {
        Log.e(e);
      }
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (debug) {
      try {
        final message = '''
network error:
error: $err
httpResponse: ${err.response}
      ''';
        Log.d(message);
      } catch (e) {
        Log.d(e);
      }
    }
    super.onError(err, handler);
  }
}
