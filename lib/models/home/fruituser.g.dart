// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fruituser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FruitUser _$FruitUserFromJson(Map<String, dynamic> json) {
  return FruitUser()
    ..id = json['id'] as int?
    ..firstname = json['firstname'] as String?
    ..lastname = json['lastname'] as String?;
}

Map<String, dynamic> _$FruitUserToJson(FruitUser instance) => <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
    };
