import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for AccessServeApi
void main() {
  final instance = ApiClient().getAccessServeApi();

  group(AccessServeApi, () {
    // Get All Access Ids
    //
    // Get all STIL IDs that have access to a specific door.  This endpoint allows the serving of LU's servers by providing STIL IDs for door systems. Access can be granted through: 1. Direct user door access assignments 2. Post (group) memberships that include door access  The actual serving is done on the frontend. TODO: Ideally we should communicate with LU to get them some better non-public API.
    //
    //Future<BuiltList<String>> accessServeGetAllAccessIds(String door) async
    test('test accessServeGetAllAccessIds', () async {
      // TODO
    });

  });
}
