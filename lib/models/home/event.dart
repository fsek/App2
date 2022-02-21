import 'package:json_annotation/json_annotation.dart';
import 'eventuser.dart';
import 'group.dart';
import 'eventsignup.dart';
import 'contact.dart';
part 'event.g.dart';

@JsonSerializable()
class Event {
  int? id;
  String? title;
  DateTime? starts_at;
  DateTime? ends_at;
  String? description;
  String? location;
  bool? all_day;
  bool? signup_not_opened_yet;
  bool? recurring;
  bool? drink;
  bool? food;
  bool? cash;
  bool? closed;
  bool? can_signup;
  int? price;
  List<String>? dress_code;
  int? event_user_count;
  String? short;
  List<List<String>>? user_types;
  Contact? contact;
  int? slots;
  String? url;
  String? textColor;
  String? dot;
  EventSignup? event_signup;
  EventUser? event_user;
  List<Group>? groups;

  List<String>? categories;

  Event();

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}
