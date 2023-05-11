// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      mobile: json['mobile'] as String?,
      token: json['token'] as String,
      userId: json['userId'] as int,
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'mobile': instance.mobile,
      'token': instance.token,
      'userId': instance.userId,
    };
