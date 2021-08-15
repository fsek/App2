import 'package:fsek_mobile/models/nollning/adventure_mission.dart';
import 'package:fsek_mobile/models/nollning/adventure_mission_week.dart';
import 'package:fsek_mobile/models/nollning/nollning_group.dart';
import 'package:fsek_mobile/services/abstract.service.dart';

class NollningService extends AbstractService {
  Future<List<NollningGroup>> getNollningGroups() async {
    Map json = await AbstractService.get("/adventure_mission_groups");
    List<NollningGroup> result = (json['groups'] as List).map((data) => NollningGroup.fromJson(data)).toList();
    return result;
  }

  List<AdventureMission> parseAdventureMissions(adventureWeek) {
    return (adventureWeek['adventures']['adventures'] as List).map((data) => AdventureMission.fromJson(data)).toList();
  }

  Future<AdventureMissionWeek> getCurrentAdventureWeek() async {
    Map json = await AbstractService.get("/adventures");
    return AdventureMissionWeek.fromJson(json['adventures']['adventures']);
  }

  void testGetThings() async {
    print("TEST /adventures:");
    Map json = await AbstractService.get("/adventures");
    print("");
  }
}
