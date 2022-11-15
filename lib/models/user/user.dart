import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart'; //generated JSON file

@JsonSerializable()
class User {
  int? id;
  String? email;
  String? firstname;
  String? lastname;
  int? start_year;
  String? provider;
  List<String>? food_preferences;
  String? avatar_file_name;
  String? uid;
  String? phone;
  String? first_post_id;
  String? avatar_content_type;
  String? avatar_file_size;
  String? avatar_updated_at;
  String? program;
  String? member_at;
  String? food_custom;
  String? student_id;
  bool? display_phone;
  int? notifications_count;
  bool? notify_event_users;
  bool? notify_messages;
  bool? notify_event_closing;
  int? terms_version;
  bool? notify_event_open;
  int? game_highscore;

  User();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
