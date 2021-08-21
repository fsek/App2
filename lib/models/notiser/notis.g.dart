// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notis _$NotisFromJson(Map<String, dynamic> json) {
  return Notis()
    ..id = json['id'] as int?
    ..created_at = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..seen = json['seen'] as bool?
    ..visited = json['visited'] as bool?
    ..data = (json['data'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String?),
    )
    ..event_id = json['event_id'] as int?;
}

Map<String, dynamic> _$NotisToJson(Notis instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.created_at?.toIso8601String(),
      'seen': instance.seen,
      'visited': instance.visited,
      'data': instance.data,
      'event_id': instance.event_id,
    };
