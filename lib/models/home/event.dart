import 'package:json_annotation/json_annotation.dart';
import 'eventuser.dart';
import 'eventsignup.dart';
part 'event.g.dart';

@JsonSerializable()
class Event {
  int? id;
  String? title;
  String? content;
  DateTime? start;
  DateTime? end;
  String? description;
  String? location;
  bool? allday;
  bool? has_signup;
  bool? signup_not_opened_yet;
  bool? recurring;
  String? url;
  String? textColor;
  String? dot;
  EventSignup? event_signup;
  EventUser? event_user;

  List<String>? categories;

  Event();

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}
