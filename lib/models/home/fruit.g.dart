// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fruit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fruit _$FruitFromJson(Map<String, dynamic> json) {
  return Fruit()
    ..id = json['id'] as int?
    ..name = json['name'] as String?
    ..is_moldy = json['is_moldy'] as bool?
    ..user = json['user'] == null
        ? null
        : FruitUser.fromJson(json['user'] as Map<String, dynamic>);
}

Map<String, dynamic> _$FruitToJson(Fruit instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'is_moldy': instance.is_moldy,
      'user': instance.user,
    };
