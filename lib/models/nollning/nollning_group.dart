import 'package:json_annotation/json_annotation.dart';

part 'nollning_group.g.dart'; //generated JSON file

@JsonSerializable()
class NollningGroup {
  NollningGroup();

  factory NollningGroup.fromJson(Map<String, dynamic> json) => _$NollningGroupFromJson(json);
  Map<String, dynamic> toJson() => _$NollningGroupToJson(this);
}
