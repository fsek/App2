import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  int? id;
  bool? by_admin;
  DateTime? update_at;
  String? image_url;
  Map? image_details;
  String? text;
  String? name;
  String? day;
  String? time;
  int? user_id;
  String? avatar;

  Message();

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
