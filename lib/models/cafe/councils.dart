import 'package:json_annotation/json_annotation.dart';

part 'councils.g.dart'; //generated JSON file

@JsonSerializable()
class Councils {
  Map<String, int>? chosen;
  Map<String, int>? available;

  Councils();

  factory Councils.fromJson(Map<String, dynamic> json) =>
      _$CouncilsFromJson(json);
  Map<String, dynamic> toJson() => _$CouncilsToJson(this);
}
