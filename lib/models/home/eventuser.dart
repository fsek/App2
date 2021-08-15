import 'package:json_annotation/json_annotation.dart';

part 'eventuser.g.dart';

@JsonSerializable()
class EventUser {
  String? name;

  EventUser();

  factory EventUser.fromJson(Map<String, dynamic> json) =>
      _$EventUserFromJson(json);

  Map<String, dynamic> toJson() => _$EventUserToJson(this);
}
