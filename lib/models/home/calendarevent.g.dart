// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendarevent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarEvent _$CalendarEventFromJson(Map<String, dynamic> json) {
  return CalendarEvent()
    ..id = json['id'] as int?
    ..title = json['title'] as String?
    ..content = json['content'] as String?
    ..start =
        json['start'] == null ? null : DateTime.parse(json['start'] as String)
    ..end = json['end'] == null ? null : DateTime.parse(json['end'] as String)
    ..description = json['description'] as String?
    ..location = json['location'] as String?
    ..allday = json['allday'] as bool?
    ..has_signup = json['has_signup'] as bool?
    ..signup_not_opened_yet = json['signup_not_opened_yet'] as bool?
    ..recurring = json['recurring'] as bool?
    ..url = json['url'] as String?
    ..textColor = json['textColor'] as String?
    ..dot = json['dot'] as String?
    ..event_signup = json['event_signup'] == null
        ? null
        : EventSignup.fromJson(json['event_signup'] as Map<String, dynamic>)
    ..event_user = json['event_user'] == null
        ? null
        : EventUser.fromJson(json['event_user'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CalendarEventToJson(CalendarEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'description': instance.description,
      'location': instance.location,
      'allday': instance.allday,
      'has_signup': instance.has_signup,
      'signup_not_opened_yet': instance.signup_not_opened_yet,
      'recurring': instance.recurring,
      'url': instance.url,
      'textColor': instance.textColor,
      'dot': instance.dot,
      'event_signup': instance.event_signup,
      'event_user': instance.event_user,
    };
