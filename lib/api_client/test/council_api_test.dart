import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for CouncilApi
void main() {
  final instance = ApiClient().getCouncilApi();

  group(CouncilApi, () {
    // Create Council
    //
    //Future<CouncilRead> councilCreateCouncil(CouncilCreate councilCreate) async
    test('test councilCreateCouncil', () async {
      // TODO
    });

    // Get All Councils
    //
    //Future<BuiltList<CouncilRead>> councilGetAllCouncils() async
    test('test councilGetAllCouncils', () async {
      // TODO
    });

    // Get Council
    //
    //Future<CouncilRead> councilGetCouncil(int councilId) async
    test('test councilGetCouncil', () async {
      // TODO
    });

  });
}
