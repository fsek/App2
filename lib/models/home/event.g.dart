// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event()
    ..id = json['id'] as int?
    ..title = json['title'] as String?
    ..content = json['content'] as String?
    ..starts_at = json['starts_at'] == null
        ? null
        : DateTime.parse(json['starts_at'] as String)
    ..ends_at = json['ends_at'] == null
        ? null
        : DateTime.parse(json['ends_at'] as String)
    ..description = json['description'] as String?
    ..location = json['location'] as String?
    ..allday = json['allday'] as bool?
    ..has_signup = json['has_signup'] as bool?
    ..signup_not_opened_yet = json['signup_not_opened_yet'] as bool?
    ..recurring = json['recurring'] as bool?
    ..drink = json['drink'] as bool?
    ..food = json['food'] as bool?
    ..cash = json['cash'] as bool?
    ..closed = json['closed'] as bool?
<<<<<<< HEAD
    ..can_signup = json['can_signup'] as bool?
=======
>>>>>>> e0b99a5b0c4dda9bb88a06e5f91c018af696e538
    ..price = json['price'] as int?
    ..dress_code =
        (json['dress_code'] as List<dynamic>?)?.map((e) => e as String).toList()
    ..event_user_count = json['event_user_count'] as int?
    ..short = json['short'] as String?
    ..user_types = (json['user_types'] as List<dynamic>?)
        ?.map((e) => (e as List<dynamic>).map((e) => e as String).toList())
        .toList()
    ..contacts = json['contacts'] as Map<String, dynamic>?
    ..slots = json['slots'] as int?
    ..question = json['question'] as String?
    ..url = json['url'] as String?
    ..textColor = json['textColor'] as String?
    ..dot = json['dot'] as String?
    ..event_signup = json['event_signup'] == null
        ? null
        : EventSignup.fromJson(json['event_signup'] as Map<String, dynamic>)
    ..event_user = json['event_user'] == null
        ? null
        : EventUser.fromJson(json['event_user'] as Map<String, dynamic>)
    ..groups = (json['groups'] as List<dynamic>?)
        ?.map((e) => Group.fromJson(e as Map<String, dynamic>))
        .toList()
    ..categories = (json['categories'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList();
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'starts_at': instance.starts_at?.toIso8601String(),
      'ends_at': instance.ends_at?.toIso8601String(),
      'description': instance.description,
      'location': instance.location,
      'allday': instance.allday,
      'has_signup': instance.has_signup,
      'signup_not_opened_yet': instance.signup_not_opened_yet,
      'recurring': instance.recurring,
      'drink': instance.drink,
      'food': instance.food,
      'cash': instance.cash,
      'closed': instance.closed,
<<<<<<< HEAD
      'can_signup': instance.can_signup,
=======
>>>>>>> e0b99a5b0c4dda9bb88a06e5f91c018af696e538
      'price': instance.price,
      'dress_code': instance.dress_code,
      'event_user_count': instance.event_user_count,
      'short': instance.short,
      'user_types': instance.user_types,
      'contacts': instance.contacts,
      'slots': instance.slots,
      'question': instance.question,
      'url': instance.url,
      'textColor': instance.textColor,
      'dot': instance.dot,
      'event_signup': instance.event_signup,
      'event_user': instance.event_user,
      'groups': instance.groups,
      'categories': instance.categories,
    };
