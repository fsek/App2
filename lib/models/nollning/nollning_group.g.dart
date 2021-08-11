// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nollning_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NollningGroup _$NollningGroupFromJson(Map<String, dynamic> json) {
  return NollningGroup()
    ..name = json['name'] as String?
    ..total_points = json['total_points'] as int?
    ..finished_missions = json['finished_missions'] as int?;
}

Map<String, dynamic> _$NollningGroupToJson(NollningGroup instance) =>
    <String, dynamic>{
      'name': instance.name,
      'total_points': instance.total_points,
      'finished_missions': instance.finished_missions,
    };
