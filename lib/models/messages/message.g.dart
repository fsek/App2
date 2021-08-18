// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message()
    ..id = json['id'] as int?
    ..by_admin = json['by_admin'] as bool?
    ..update_at = json['update_at'] == null
        ? null
        : DateTime.parse(json['update_at'] as String)
    ..image_url = json['image_url'] as String?
    ..image_details = json['image_details'] as Map<String, dynamic>?
    ..text = json['text'] as String?
    ..name = json['name'] as String?
    ..day = json['day'] as String?
    ..time = json['time'] as String?
    ..user_id = json['user_id'] as int?
    ..avatar = json['avatar'] as String?;
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'by_admin': instance.by_admin,
      'update_at': instance.update_at?.toIso8601String(),
      'image_url': instance.image_url,
      'image_details': instance.image_details,
      'text': instance.text,
      'name': instance.name,
      'day': instance.day,
      'time': instance.time,
      'user_id': instance.user_id,
      'avatar': instance.avatar,
    };
