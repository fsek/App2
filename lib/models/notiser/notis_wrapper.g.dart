// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notis_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotisWrapper _$NotisWrapperFromJson(Map<String, dynamic> json) {
  return NotisWrapper()
    ..notifications = (json['notifications'] as List<dynamic>?)
        ?.map((e) => Notis.fromJson(e as Map<String, dynamic>))
        .toList()
    ..meta = json['meta'] == null
        ? null
        : NotisMeta.fromJson(json['meta'] as Map<String, dynamic>);
}

Map<String, dynamic> _$NotisWrapperToJson(NotisWrapper instance) =>
    <String, dynamic>{
      'notifications': instance.notifications,
      'meta': instance.meta,
    };
