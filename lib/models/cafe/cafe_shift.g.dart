// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cafe_shift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CafeShift _$CafeShiftFromJson(Map<String, dynamic> json) {
  return CafeShift()
    ..id = json['id'] as int?
    ..start =
        json['start'] == null ? null : DateTime.parse(json['start'] as String)
    ..duration = json['duration'] as String?
    ..isme = json['isme'] as bool?
    ..councils = json['councils'] == null
        ? null
        : Councils.fromJson(json['councils'] as Map<String, dynamic>)
    ..group = json['group'] as String?;
}

Map<String, dynamic> _$CafeShiftToJson(CafeShift instance) => <String, dynamic>{
      'id': instance.id,
      'start': instance.start?.toIso8601String(),
      'duration': instance.duration,
      'isme': instance.isme,
      'councils': instance.councils,
      'group': instance.group,
    };
