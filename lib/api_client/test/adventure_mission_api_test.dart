import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for AdventureMissionApi
void main() {
  final instance = ApiClient().getAdventureMissionApi();

  group(AdventureMissionApi, () {
    // Delete Adventure Mission
    //
    //Future<AdventureMissionRead> adventureMissionDeleteAdventureMission(int id) async
    test('test adventureMissionDeleteAdventureMission', () async {
      // TODO
    });

    // Get Adventure Mission
    //
    //Future<AdventureMissionRead> adventureMissionGetAdventureMission(int id) async
    test('test adventureMissionGetAdventureMission', () async {
      // TODO
    });

    // Get All Adventure Missions
    //
    //Future<BuiltList<AdventureMissionRead>> adventureMissionGetAllAdventureMissions() async
    test('test adventureMissionGetAllAdventureMissions', () async {
      // TODO
    });

    // Patch Adventure Mission
    //
    //Future<AdventureMissionRead> adventureMissionPatchAdventureMission(int id, AdventureMissionCreate adventureMissionCreate) async
    test('test adventureMissionPatchAdventureMission', () async {
      // TODO
    });

    // Post Adventure Mission
    //
    //Future<AdventureMissionRead> adventureMissionPostAdventureMission(AdventureMissionCreate adventureMissionCreate) async
    test('test adventureMissionPostAdventureMission', () async {
      // TODO
    });

  });
}
