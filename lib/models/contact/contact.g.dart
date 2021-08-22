// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return Contact()
    ..id = json['id'] as int?
    ..email = json['email'] as String?
    ..name = json['name'] as String?
    ..text = json['text'] as String?
    ..users =
        (json['users'] as List<dynamic>?)?.map((e) => e as String).toList();
}

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'text': instance.text,
      'users': instance.users,
    };
