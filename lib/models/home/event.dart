import 'package:json_annotation/json_annotation.dart';
import 'eventuser.dart';
import 'group.dart';
import 'eventsignup.dart';
part 'event.g.dart';

@JsonSerializable()
class Event {
  int? id;
  String? title;
  String? content;
  DateTime? starts_at;
  DateTime? ends_at;
  String? description;
  String? location;
  bool? allday;
  bool? has_signup;
  bool? signup_not_opened_yet;
  bool? recurring;
  bool? drink;
  bool? food;
  bool? cash;
  bool? closed;
<<<<<<< HEAD
  bool? can_signup;
=======
>>>>>>> e0b99a5b0c4dda9bb88a06e5f91c018af696e538
  int? price;
  List<String>? dress_code;
  int? event_user_count;
  String? short;
  List<List<String>>? user_types;
  Map<String, dynamic>? contacts;
  int? slots;
  String? question;
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
