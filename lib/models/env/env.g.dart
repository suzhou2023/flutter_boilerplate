// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Env _$EnvFromJson(Map<String, dynamic> json) => Env(
      name: json['name'] as String,
      apiHost: json['apiHost'] as String,
      webHost: json['webHost'] as String,
    );

Map<String, dynamic> _$EnvToJson(Env instance) => <String, dynamic>{
      'name': instance.name,
      'apiHost': instance.apiHost,
      'webHost': instance.webHost,
    };
