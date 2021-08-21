// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groupmessage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupMessage _$GroupMessageFromJson(Map<String, dynamic> json) {
  return GroupMessage()
    ..content = json['content'] as String?
    ..user = json['user'] as Map<String, dynamic>?;
}

Map<String, dynamic> _$GroupMessageToJson(GroupMessage instance) =>
    <String, dynamic>{
      'content': instance.content,
      'user': instance.user,
    };
