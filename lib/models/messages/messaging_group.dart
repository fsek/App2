import 'package:json_annotation/json_annotation.dart';

import 'groupmessage.dart';
import 'messaging_group_user.dart';

part 'messaging_group.g.dart';

@JsonSerializable()
class MessagingGroup {
  int? id;
  String? name;
  String? group_type;
  MessagingGroupUser? group_user;
  List<GroupMessage?>? messages;

  MessagingGroup();

  factory MessagingGroup.fromJson(Map<String, dynamic> json) => _$MessagingGroupFromJson(json);

  Map<String, dynamic> toJson() => _$MessagingGroupToJson(this);
}
