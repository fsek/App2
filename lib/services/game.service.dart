import 'package:fsek_mobile/services/abstract.service.dart';
import 'package:fsek_mobile/models/moose_game/game_score_entry.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/services/user.service.dart';

class GameScoreService extends AbstractService {
  Future<List<GameScoreEntry>> getScores() async {
    Map json = await AbstractService.get("/game_scores");

    List<GameScoreEntry> result = (json['game_scores'] as List)
        .map((data) => GameScoreEntry.fromJson(data))
        .toList();
    return result;
  }
  Future<Map> postScore({ score = int }) async {
    return AbstractService.post("/game_scores", mapBody: { 
      "score": score,
      "user": await locator<UserService>().getUser()
    });
  }
  Future<Map> resetScore() async {
    return AbstractService.post("/game_scores", mapBody: { 
      "score": 0,
      "user": await locator<UserService>().getUser()
    });
  }
}