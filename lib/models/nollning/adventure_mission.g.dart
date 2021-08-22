// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adventure_mission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdventureMission _$AdventureMissionFromJson(Map<String, dynamic> json) {
  return AdventureMission()
    ..id = json['id'] as int?
    ..title = json['title'] as String?
    ..max_points = json['max_points'] as int?
    ..index = json['index'] as int?
    ..variable_points = json['variable_points'] as bool?
    ..locked = json['locked'] as bool?
    ..require_acceptance = json['require_acceptance'] as bool?
    ..is_accepted = json['is_accepted'] as bool?
    ..is_pending = json['is_pending'] as bool?;
}

Map<String, dynamic> _$AdventureMissionToJson(AdventureMission instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'max_points': instance.max_points,
      'index': instance.index,
      'variable_points': instance.variable_points,
      'locked': instance.locked,
      'require_acceptance': instance.require_acceptance,
      'is_accepted': instance.is_accepted,
      'is_pending': instance.is_pending,
    };
