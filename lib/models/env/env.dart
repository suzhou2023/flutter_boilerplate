import 'package:json_annotation/json_annotation.dart';

part 'env.g.dart';

@JsonSerializable()
class Env {
  String name;
  String apiHost;
  String webHost;

  Env({
    required this.name,
    required this.apiHost,
    required this.webHost,
  });

  factory Env.fromJson(Map<String, dynamic> json) => _$EnvFromJson(json);
  Map<String, dynamic> toJson() => _$EnvToJson(this);
}
