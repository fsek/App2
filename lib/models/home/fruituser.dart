import 'package:json_annotation/json_annotation.dart';

part 'fruituser.g.dart';

@JsonSerializable()
class FruitUser {
  int? id;
  String? firstname;
  String? lastname;

  FruitUser();

  factory FruitUser.fromJson(Map<String, dynamic> json) =>
      _$FruitUserFromJson(json);

  Map<String, dynamic> toJson() => _$FruitUserToJson(this);
}
