import 'package:fsek_mobile/models/nollning/adventure_mission.dart';
import 'package:json_annotation/json_annotation.dart';

part 'adventure_mission_week.g.dart'; //generated JSON file

@JsonSerializable()
class AdventureMissionWeek {
  String? title;
  int? week_number;
  String? video;
  int? missions_accepted;
  List<AdventureMission>? adventure_missions;

  AdventureMissionWeek();

  factory AdventureMissionWeek.fromJson(Map<String, dynamic> json) => _$AdventureMissionWeekFromJson(json);
  Map<String, dynamic> toJson() => _$AdventureMissionWeekToJson(this);
}
