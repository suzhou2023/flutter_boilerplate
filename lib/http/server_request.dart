import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

import 'server_reponse.dart';

enum RequestMethod { get, post, put, delete }

String _methodName(RequestMethod method) {
  switch (method) {
    case RequestMethod.get:
      return 'GET';
    case RequestMethod.post:
      return 'POST';
    case RequestMethod.put:
      return 'PUT';
    case RequestMethod.delete:
      return 'DELETE';
    default:
      return 'GET';
  }
}

typedef ResultParser<T> = Future<T?> Function(dynamic);
typedef PrograssCallback = void Function(int count, int total);
typedef ResponseParser = dynamic Function(dynamic jsonData);

Map<String, dynamic> get httpHeaders {
  return <String, dynamic>{
    'X-App-Version': '1.0.0',
  };
}

class ServerRequest<T> {
  String url;
  RequestMethod method;
  int successCode;
  Options options;
  Map? headers;
  ResultParser<T> resultParser;
  ResponseParser? responseParser;
  CachePolicy? cachePolicy;
  dynamic data;
  bool? showLoading;

  ServerRequest({
    required this.url,
    required this.method,
    required this.data,
    required this.resultParser,
    this.headers,
    this.successCode = 200,
    this.responseParser,
    this.cachePolicy,
    Options? options,
    this.showLoading = true,
  }) : options = options != null
            ? options.copyWith(
                method: _methodName(method),
              )
            : Options(
                method: _methodName(method),
                headers: {
                  ...httpHeaders,
                  ...?headers,
                },
              );

  dynamic get httpData {
    if (method == RequestMethod.get || data == null) {
      return null;
    }
    if (data is Map) {
      final map = data as Map;
      return Map<dynamic, dynamic>.fromEntries(map.entries.where((e) => e.value != null));
    }
    return data;
  }

  Map<String, dynamic>? get queryParameters {
    if (method == RequestMethod.get) {
      return data as Map<String, dynamic>?;
    } else {
      return null;
    }
  }

  ServerResponse<T> parseResponse(dynamic httpResponseData) {
    return ServerResponse.fromJson(request: this, json: httpResponseData);
  }
}
