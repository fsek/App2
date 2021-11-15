// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cafe_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CafeUser _$CafeUserFromJson(Map<String, dynamic> json) {
  return CafeUser()
    ..id = json['id'] as int?
    ..name = json['name'] as String?
    ..avatar = json['avatar'] as String?;
}

Map<String, dynamic> _$CafeUserToJson(CafeUser instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
    };
