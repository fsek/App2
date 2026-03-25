import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for NominationsApi
void main() {
  final instance = ApiClient().getNominationsApi();

  group(NominationsApi, () {
    // Create Nomination
    //
    //Future<JsonObject> nominationsCreateNomination(int subElectionId, NominationCreate nominationCreate) async
    test('test nominationsCreateNomination', () async {
      // TODO
    });

    // Delete Nomination
    //
    //Future nominationsDeleteNomination(int nominationId) async
    test('test nominationsDeleteNomination', () async {
      // TODO
    });

    // Get All Election Nominations
    //
    //Future<BuiltList<NominationRead>> nominationsGetAllElectionNominations(int electionId) async
    test('test nominationsGetAllElectionNominations', () async {
      // TODO
    });

    // Get All Sub Election Nominations
    //
    //Future<BuiltList<NominationRead>> nominationsGetAllSubElectionNominations(int subElectionId) async
    test('test nominationsGetAllSubElectionNominations', () async {
      // TODO
    });

  });
}
