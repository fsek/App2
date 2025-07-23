import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for GroupsApi
void main() {
  final instance = ApiClient().getGroupsApi();

  group(GroupsApi, () {
    // Add User To Group
    //
    //Future<GroupRead> groupsAddUserToGroup(int id, GroupAddUser groupAddUser) async
    test('test groupsAddUserToGroup', () async {
      // TODO
    });

    // Get Groups
    //
    //Future<BuiltList<GroupRead>> groupsGetGroups({ String groupType }) async
    test('test groupsGetGroups', () async {
      // TODO
    });

    // Get Single Group
    //
    //Future<GroupRead> groupsGetSingleGroup(int id) async
    test('test groupsGetSingleGroup', () async {
      // TODO
    });

    // Patch Group
    //
    //Future<GroupRead> groupsPatchGroup(int id, GroupCreate groupCreate) async
    test('test groupsPatchGroup', () async {
      // TODO
    });

    // Remove Group
    //
    //Future<GroupRead> groupsRemoveGroup(int id) async
    test('test groupsRemoveGroup', () async {
      // TODO
    });

    // Remove User From Group
    //
    //Future<GroupRead> groupsRemoveUserFromGroup(int id, GroupRemoveUser groupRemoveUser) async
    test('test groupsRemoveUserFromGroup', () async {
      // TODO
    });

    // Upload Group
    //
    //Future<GroupRead> groupsUploadGroup(GroupCreate groupCreate) async
    test('test groupsUploadGroup', () async {
      // TODO
    });

  });
}
