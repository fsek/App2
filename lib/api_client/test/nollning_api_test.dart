import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for NollningApi
void main() {
  final instance = ApiClient().getNollningApi();

  group(NollningApi, () {
    // Add Completed Mission
    //
    //Future<GroupMissionRead> nollningAddCompletedMission(int id, GroupMissionCreate groupMissionCreate) async
    test('test nollningAddCompletedMission', () async {
      // TODO
    });

    // Add Group To Nollning
    //
    //Future<NollningRead> nollningAddGroupToNollning(int id, NollningAddGroup nollningAddGroup) async
    test('test nollningAddGroupToNollning', () async {
      // TODO
    });

    // Delete Group Mission
    //
    //Future<NollningDeleteMission> nollningDeleteGroupMission(int id, NollningDeleteMission nollningDeleteMission) async
    test('test nollningDeleteGroupMission', () async {
      // TODO
    });

    // Delete Nollning
    //
    //Future<BuiltMap<String, String>> nollningDeleteNollning(int id) async
    test('test nollningDeleteNollning', () async {
      // TODO
    });

    // Edit Completed Mission
    //
    //Future<GroupMissionRead> nollningEditCompletedMission(int id, GroupMissionEdit groupMissionEdit) async
    test('test nollningEditCompletedMission', () async {
      // TODO
    });

    // Get All Nollning
    //
    //Future<BuiltList<NollningRead>> nollningGetAllNollning() async
    test('test nollningGetAllNollning', () async {
      // TODO
    });

    // Get Completed Missions
    //
    //Future<BuiltList<GroupMissionRead>> nollningGetCompletedMissions(int nollningId) async
    test('test nollningGetCompletedMissions', () async {
      // TODO
    });

    // Patch Nollning
    //
    //Future<NollningRead> nollningPatchNollning(int id, NollningCreate nollningCreate) async
    test('test nollningPatchNollning', () async {
      // TODO
    });

    // Post Nollning
    //
    //Future<NollningRead> nollningPostNollning(NollningCreate nollningCreate) async
    test('test nollningPostNollning', () async {
      // TODO
    });

  });
}
