import 'package:fsek_mobile/models/nollning/adventure_mission.dart';
import 'package:fsek_mobile/models/nollning/adventure_mission_week.dart';
import 'package:fsek_mobile/models/nollning/nollning_group.dart';
import 'package:fsek_mobile/services/abstract.service.dart';

class NollningService extends AbstractService {
  bool is_mentor = false;

  Future<List<NollningGroup>> getNollningGroups() async {
    Map json = await AbstractService.get("/adventure_mission_groups");
    List<NollningGroup> result = (json['groups'] as List).map((data) => NollningGroup.fromJson(data)).toList();
    return result;
  }

  Future<List<AdventureMissionWeek>> getAdventureWeeks() async {
    Map json = await AbstractService.get("/adventures");
    is_mentor = json['is_mentor'] ?? false; // ugly hack don't judge
    List<AdventureMissionWeek> result = (json['adventures']['adventures'] as List).map((data) => AdventureMissionWeek.fromJson(data)).toList();
    return result;
  }

  Future<Map> finishAdventureMission(int id, int points) async {
    return AbstractService.post(
      '/adventure_missions/finish_adventure_mission',
      mapBody: {
        "adventure_mission_id": id,
        "points": points,
      },
    );
  }

  Future<Map> resetAdventureMission(int id) {
    return AbstractService.delete(
      "/adventure_missions/reset_adventure_mission",
      mapBody: {
        "adventure_mission_id": id,
      },
    );
  }

  void testGetThings() async {
    print("TEST /adventures:");
    Map json = await AbstractService.get("/adventure_mission_groups");
    print(json);
  }
}
