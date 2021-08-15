// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devise_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviseToken _$DeviseTokenFromJson(Map<String, dynamic> json) {
  return DeviseToken(
    accessToken: json['accessToken'] as String?,
    uid: json['uid'] as String?,
    client: json['client'] as String?,
    expires: json['expires'] == null
        ? null
        : DateTime.parse(json['expires'] as String),
    error: json['error'] as String?,
  );
}

Map<String, dynamic> _$DeviseTokenToJson(DeviseToken instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'uid': instance.uid,
      'client': instance.client,
      'expires': instance.expires?.toIso8601String(),
      'error': instance.error,
    };
