import 'package:json_annotation/json_annotation.dart';

part 'newsuser.g.dart'; //generated JSON file

@JsonSerializable()

class NewsUser {
  String? name;

  NewsUser();

  factory NewsUser.fromJson(Map<String, dynamic> json) => _$NewsUserFromJson(json);

  Map<String, dynamic> toJson() => _$NewsUserToJson(this);
}