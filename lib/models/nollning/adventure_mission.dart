import 'package:json_annotation/json_annotation.dart';

part 'adventure_mission.g.dart'; //generated JSON file

@JsonSerializable()
class AdventureMission {
  int? id;
  String? title;
  int? max_points;
  int? index;
  bool? variable_points;
  bool? locked;
  bool? require_acceptance;
  bool? is_accepted;
  bool? is_pending;

  AdventureMission();

  factory AdventureMission.fromJson(Map<String, dynamic> json) =>
      _$AdventureMissionFromJson(json);
  Map<String, dynamic> toJson() => _$AdventureMissionToJson(this);
}
