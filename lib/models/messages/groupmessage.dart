import 'package:json_annotation/json_annotation.dart';

part 'groupmessage.g.dart';

@JsonSerializable()
class GroupMessage {
  String? content;
  Map? user; // has 1 property, "name"

  GroupMessage();

  factory GroupMessage.fromJson(Map<String, dynamic> json) => _$GroupMessageFromJson(json);

  Map<String, dynamic> toJson() => _$GroupMessageToJson(this);
}
