import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for UserDoorAccessApi
void main() {
  final instance = ApiClient().getUserDoorAccessApi();

  group(UserDoorAccessApi, () {
    // Delete User Access
    //
    //Future userDoorAccessDeleteUserAccess(int accessId) async
    test('test userDoorAccessDeleteUserAccess', () async {
      // TODO
    });

    // Get All User Accesses
    //
    //Future<BuiltList<UserAccessRead>> userDoorAccessGetAllUserAccesses() async
    test('test userDoorAccessGetAllUserAccesses', () async {
      // TODO
    });

    // Post User Access
    //
    //Future<UserAccessRead> userDoorAccessPostUserAccess(UserAccessCreate userAccessCreate) async
    test('test userDoorAccessPostUserAccess', () async {
      // TODO
    });

    // Update User Access
    //
    //Future<UserAccessRead> userDoorAccessUpdateUserAccess(UserAccessUpdate userAccessUpdate) async
    test('test userDoorAccessUpdateUserAccess', () async {
      // TODO
    });

  });
}
