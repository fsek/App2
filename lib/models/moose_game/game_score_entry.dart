import 'package:fsek_mobile/api_client/lib/api_client.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:fsek_mobile/models/user/user.dart';


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
