// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adventure_mission_week.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdventureMissionWeek _$AdventureMissionWeekFromJson(Map<String, dynamic> json) {
  return AdventureMissionWeek()
    ..title = json['title'] as String?
    ..week_number = json['week_number'] as int?
    ..video = json['video'] as String?
    ..missions_accepted = json['missions_accepted'] as int?
    ..adventure_missions = json['adventure_missions'] as List<AdventureMission>?;
}

Map<String, dynamic> _$AdventureMissionWeekToJson(AdventureMissionWeek instance) => <String, dynamic>{
      'title': instance.title,
      'week_number': instance.week_number,
      'video': instance.video,
      'missions_accepted': instance.missions_accepted,
      'adventure_missions': instance.adventure_missions,
    };
