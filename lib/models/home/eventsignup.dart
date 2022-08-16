import 'package:json_annotation/json_annotation.dart';
part 'eventsignup.g.dart';

@JsonSerializable()
class EventSignup {
  int? id;
  int? event_id;
  bool? for_members;
  bool? lottery;
  int? slots;
  DateTime? closes;
  DateTime? opens;
  int? novice;
  int? mentor;
  int? custom;
  bool? open;
  bool? closed;
  String? custom_name;
  DateTime? deleted_at;
  DateTime? created_at;
  DateTime? updated_at;
  List<String>? group_types;
  DateTime? sent_reminder;
  DateTime? sent_postion;
  DateTime? sent_closing;
  DateTime? sent_open;
  String? question;
  String? notification_message;
  EventSignup();

  factory EventSignup.fromJson(Map<String, dynamic> json) =>
      _$EventSignupFromJson(json);

  Map<String, dynamic> toJson() => _$EventSignupToJson(this);
}
