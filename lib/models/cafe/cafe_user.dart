import 'package:json_annotation/json_annotation.dart';

part 'cafe_user.g.dart'; //generated JSON file

@JsonSerializable()
class CafeUser {
  int? id;
  String? name;
  String? avatar;

  CafeUser();

  factory CafeUser.fromJson(Map<String, dynamic> json) => _$CafeUserFromJson(json);
  Map<String, dynamic> toJson() => _$CafeUserToJson(this);
}
