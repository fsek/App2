import 'package:json_annotation/json_annotation.dart';


part 'game_score_entry.g.dart';

@JsonSerializable()
class GameScoreEntry {
  int? score;
  String? name;

  GameScoreEntry();

  factory GameScoreEntry.fromJson(Map<String, dynamic> json) =>
      _$GameScoreEntryFromJson(json);
  Map<String, dynamic> toJson() => _$GameScoreEntryToJson(this);
}
