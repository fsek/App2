// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobileAPIToken.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MobileAPIToken _$MobileAPITokenFromJson(Map<String, dynamic> json) {
  return MobileAPIToken(
    accessToken: json['accessToken'] as String,
    refreshToken: json['refreshToken'] as String,
    expires: json['expires'] == null
        ? null
        : DateTime.parse(json['expires'] as String),
  );
}

Map<String, dynamic> _$MobileAPITokenToJson(MobileAPIToken instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'expires': instance.expires?.toIso8601String(),
    };
