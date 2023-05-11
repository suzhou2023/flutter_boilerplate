import 'package:json_annotation/json_annotation.dart';

part 'http_result.g.dart';

@JsonSerializable()
class HttpResult {
  int code;
  String? message;
  Object? result;

  HttpResult({required this.code, this.message, this.result});

  factory HttpResult.fromJson(Map<String, dynamic> json) => _$HttpResultFromJson(json);
  Map<String, dynamic> toJson() => _$HttpResultToJson(this);
}
