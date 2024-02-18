import 'package:json_annotation/json_annotation.dart';

part 'messaging_group_user.g.dart';

@JsonSerializable()
class MessagingGroupUser {
  int? unread_count;

  MessagingGroupUser();

  factory MessagingGroupUser.fromJson(Map<String, dynamic> json) =>
      _$MessagingGroupUserFromJson(json);

  Map<String, dynamic> toJson() => _$MessagingGroupUserToJson(this);
}
