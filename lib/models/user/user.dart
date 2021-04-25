import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart'; //generated JSON file

@JsonSerializable()
class User {
  String userId;
  String name;
  String role;
  List<String> licenseRoles;
  String customStyle;
  String mainLicense;
  
  User(this.userId);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}