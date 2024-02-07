import 'package:fsek_mobile/models/nollning/adventure_mission_week.dart';
import 'package:json_annotation/json_annotation.dart';

part 'adventure_data.g.dart'; //generated JSON file

@JsonSerializable()
class AdventureData {
  String? group_name;
  bool? is_mentor;
  int? total_group_points;
  Map<String, List<AdventureMissionWeek>>? adventures;

  AdventureData();

  factory AdventureData.fromJson(Map<String, dynamic> json) =>
      _$AdventureDataFromJson(json);
  Map<String, dynamic> toJson() => _$AdventureDataToJson(this);
}
