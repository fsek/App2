// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..id = json['id'] as int?
    ..email = json['email'] as String?
    ..firstname = json['firstname'] as String?
    ..lastname = json['lastname'] as String?
    ..start_year = json['start_year'] as int?
    ..provider = json['provider'] as String?
    ..food_preferences = (json['food_preferences'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList()
    ..avatar_file_name = json['avatar_file_name'] as String?
    ..uid = json['uid'] as String?
    ..phone = json['phone'] as String?
    ..first_post_id = json['first_post_id'] as String?
    ..avatar_content_type = json['avatar_content_type'] as String?
    ..avatar_file_size = json['avatar_file_size'] as String?
    ..avatar_updated_at = json['avatar_updated_at'] as String?
    ..program = json['program'] as String?
    ..member_at = json['member_at'] as String?
    ..food_custom = json['food_custom'] as String?
    ..student_id = json['student_id'] as String?
    ..display_phone = json['display_phone'] as bool?
    ..notifications_count = json['notifications_count'] as int?
    ..notify_event_users = json['notify_event_users'] as bool?
    ..notify_messages = json['notify_messages'] as bool?
    ..notify_event_closing = json['notify_event_closing'] as bool?
    ..terms_version = json['terms_version'] as int?
    ..notify_event_open = json['notify_event_open'] as bool?;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'start_year': instance.start_year,
      'provider': instance.provider,
      'food_preferences': instance.food_preferences,
      'avatar_file_name': instance.avatar_file_name,
      'uid': instance.uid,
      'phone': instance.phone,
      'first_post_id': instance.first_post_id,
      'avatar_content_type': instance.avatar_content_type,
      'avatar_file_size': instance.avatar_file_size,
      'avatar_updated_at': instance.avatar_updated_at,
      'program': instance.program,
      'member_at': instance.member_at,
      'food_custom': instance.food_custom,
      'student_id': instance.student_id,
      'display_phone': instance.display_phone,
      'notifications_count': instance.notifications_count,
      'notify_event_users': instance.notify_event_users,
      'notify_messages': instance.notify_messages,
      'notify_event_closing': instance.notify_event_closing,
      'terms_version': instance.terms_version,
      'notify_event_open': instance.notify_event_open,
    };
