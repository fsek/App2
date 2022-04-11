// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'councils.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Councils _$CouncilsFromJson(Map<String, dynamic> json) {
  return Councils()
    ..chosen = (json['chosen'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as int),
    )
    ..available = (json['available'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as int),
    );
}

Map<String, dynamic> _$CouncilsToJson(Councils instance) => <String, dynamic>{
      'chosen': instance.chosen,
      'available': instance.available,
    };
