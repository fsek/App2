// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eventuser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventUser _$EventUserFromJson(Map<String, dynamic> json) {
  return EventUser(
    json['answer'] as String?,
    json['group_id'] as int?,
    json['group_custom'] as String?,
    json['user_type'] as String?,
  )
    ..id = json['id'] as int?
    ..reserve = json['reserve'] as bool?;
}

Map<String, dynamic> _$EventUserToJson(EventUser instance) => <String, dynamic>{
      'id': instance.id,
      'answer': instance.answer,
      'user_type': instance.user_type,
      'group_id': instance.group_id,
      'group_custom': instance.group_custom,
      'reserve': instance.reserve,
    };
