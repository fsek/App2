// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messaging_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessagingGroup _$MessagingGroupFromJson(Map<String, dynamic> json) {
  return MessagingGroup()
    ..id = json['id'] as int?
    ..name = json['name'] as String?
    ..group_type = json['group_type'] as String?
    ..group_user = json['group_user'] == null
        ? null
        : MessagingGroupUser.fromJson(
            json['group_user'] as Map<String, dynamic>)
    ..messages = (json['messages'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : GroupMessage.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$MessagingGroupToJson(MessagingGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'group_type': instance.group_type,
      'group_user': instance.group_user,
      'messages': instance.messages,
    };
