// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eventsignup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventSignup _$EventSignupFromJson(Map<String, dynamic> json) {
  return EventSignup()
    ..id = json['id'] as int?
    ..event_id = json['event_id'] as int?
    ..for_members = json['for_members'] as bool?
    ..slots = json['slots'] as int?
    ..closes =
        json['closes'] == null ? null : DateTime.parse(json['closes'] as String)
    ..opens =
        json['opens'] == null ? null : DateTime.parse(json['opens'] as String)
    ..novice = json['novice'] as int?
    ..mentor = json['mentor'] as int?
    ..custom = json['custom'] as int?
    ..custom_name = json['custom_name'] as String?
    ..deleted_at = json['deleted_at'] == null
        ? null
        : DateTime.parse(json['deleted_at'] as String)
    ..created_at = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..updated_at = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String)
    ..group_types = (json['group_types'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList()
    ..sent_reminder = json['sent_reminder'] == null
        ? null
        : DateTime.parse(json['sent_reminder'] as String)
    ..sent_postion = json['sent_postion'] == null
        ? null
        : DateTime.parse(json['sent_postion'] as String)
    ..sent_closing = json['sent_closing'] == null
        ? null
        : DateTime.parse(json['sent_closing'] as String)
    ..sent_open = json['sent_open'] == null
        ? null
        : DateTime.parse(json['sent_open'] as String)
    ..question = json['question'] as String?
    ..notification_message = json['notification_message'] as String?;
}

Map<String, dynamic> _$EventSignupToJson(EventSignup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'event_id': instance.event_id,
      'for_members': instance.for_members,
      'slots': instance.slots,
      'closes': instance.closes?.toIso8601String(),
      'opens': instance.opens?.toIso8601String(),
      'novice': instance.novice,
      'mentor': instance.mentor,
      'custom': instance.custom,
      'custom_name': instance.custom_name,
      'deleted_at': instance.deleted_at?.toIso8601String(),
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'group_types': instance.group_types,
      'sent_reminder': instance.sent_reminder?.toIso8601String(),
      'sent_postion': instance.sent_postion?.toIso8601String(),
      'sent_closing': instance.sent_closing?.toIso8601String(),
      'sent_open': instance.sent_open?.toIso8601String(),
      'question': instance.question,
      'notification_message': instance.notification_message,
    };
