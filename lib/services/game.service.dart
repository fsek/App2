import 'package:fsek_mobile/services/abstract.service.dart';
import 'package:fsek_mobile/models/game/game_score_entry.dart';

class GameScoreService extends AbstractService {
  Future<List<GameScoreEntry>> getScores() async {
    Map json = await AbstractService.get("/game_scores");

    List<GameScoreEntry> result = (json['game_scores'] as List)
        .map((data) => GameScoreEntry.fromJson(data))
        .toList();
    return result;
  }
  Future<Map> postScore({ score: int }) {
    return AbstractService.post("/game_scores", mapBody: {
      score: score
    });
  }
}