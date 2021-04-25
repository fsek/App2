// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['userId'] as String,
  )
    ..name = json['name'] as String
    ..role = json['role'] as String
    ..licenseRoles =
        (json['licenseRoles'] as List)?.map((e) => e as String)?.toList()
    ..customStyle = json['customStyle'] as String
    ..mainLicense = json['mainLicense'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'role': instance.role,
      'licenseRoles': instance.licenseRoles,
      'customStyle': instance.customStyle,
      'mainLicense': instance.mainLicense,
    };
