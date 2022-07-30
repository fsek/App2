import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart'; //generated JSON file

@JsonSerializable()
class Person {
  String? image;
  Map<String, String>? name;
  Map<String, String>? position;
  Map<String, String>? text;
  Person();

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
