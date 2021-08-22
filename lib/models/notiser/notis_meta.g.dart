// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notis_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotisMeta _$NotisMetaFromJson(Map<String, dynamic> json) {
  return NotisMeta()
    ..current_page = json['current_page'] as int?
    ..next_page = json['next_page'] as int?
    ..prev_page = json['prev_page'] as int?
    ..total_pages = json['total_pages'] as int?
    ..total_count = json['total_count'] as int?
    ..unread = json['unread'] as int?;
}

Map<String, dynamic> _$NotisMetaToJson(NotisMeta instance) => <String, dynamic>{
      'current_page': instance.current_page,
      'next_page': instance.next_page,
      'prev_page': instance.prev_page,
      'total_pages': instance.total_pages,
      'total_count': instance.total_count,
      'unread': instance.unread,
    };
