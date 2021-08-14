import 'package:json_annotation/json_annotation.dart';

part 'eventuser.g.dart';

@JsonSerializable()
class EventUser {
  int? id;
  String? answer;
  String? user_type;
  int? group_id;
  String? group_custom;
  bool? reserve;

  EventUser(this.answer, this.group_id, this.group_custom, this.user_type);

  factory EventUser.fromJson(Map<String, dynamic> json) =>
      _$EventUserFromJson(json);

  Map<String, dynamic> toJson() => _$EventUserToJson(this);
}
