import 'dart:convert';

import 'server_request.dart';

class ServerResponse<T> {
  int code;
  dynamic result;
  ServerRequest<T> request;
  int duration;
  String message;
  bool encrypted;

  ServerResponse({
    required this.code,
    required this.message,
    required this.request,
    this.result,
    this.duration = 0,
    this.encrypted = false,
  });

  ServerResponse.fromJson({
    required this.request,
    required dynamic json,
  })  : code = json['code'] as int,
        message = json['message'] as String? ?? '',
        result = json['result'],
        duration = json['duration'] as int? ?? 1000,
        encrypted = json['encrypted'] as bool? ?? false;

  ServerResponse.error({
    required this.code,
    required this.message,
    required this.request,
  })  : result = <String, dynamic>{},
        duration = 1000,
        encrypted = false;

  bool get success => code == request.successCode;

  Future<T?> responseData() async => await request.resultParser(result);

  @override
  String toString() {
    return jsonEncode(<String, dynamic>{
      'code': code,
      'result': result,
      'duration': duration,
      'message': message,
      'encrypted': encrypted,
      'request': <String, dynamic>{
        'url': request.url,
      },
    });
  }
}
