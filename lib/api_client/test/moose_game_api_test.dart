import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for MooseGameApi
void main() {
  final instance = ApiClient().getMooseGameApi();

  group(MooseGameApi, () {
    // Get All Scores
    //
    //Future<BuiltList<MooseGameRead>> mooseGameGetAllScores() async
    test('test mooseGameGetAllScores', () async {
      // TODO
    });

    // Remove Mouse Game Score
    //
    //Future<JsonObject> mooseGameRemoveMouseGameScore(int userId) async
    test('test mooseGameRemoveMouseGameScore', () async {
      // TODO
    });

    // Update Mouse Game Score
    //
    //Future<JsonObject> mooseGameUpdateMouseGameScore(int score) async
    test('test mooseGameUpdateMouseGameScore', () async {
      // TODO
    });

  });
}
