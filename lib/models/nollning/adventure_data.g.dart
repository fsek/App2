// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adventure_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdventureData _$AdventureDataFromJson(Map<String, dynamic> json) {
  return AdventureData()
    ..group_name = json['group_name'] as String?
    ..is_mentor = json['is_mentor'] as bool?
    ..total_group_points = json['total_group_points'] as int?
    ..adventures = (json['adventures'] as List<dynamic>?)
        ?.map((e) => AdventureMissionWeek.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$AdventureDataToJson(AdventureData instance) =>
    <String, dynamic>{
      'group_name': instance.group_name,
      'is_mentor': instance.is_mentor,
      'total_group_points': instance.total_group_points,
      'adventures': instance.adventures,
    };
