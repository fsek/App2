import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for UsersApi
void main() {
  final instance = ApiClient().getUsersApi();

  group(UsersApi, () {
    // Get All Users
    //
    //Future<BuiltList<UserRead>> usersGetAllUsers() async
    test('test usersGetAllUsers', () async {
      // TODO
    });

    // Get Me
    //
    //Future<UserRead> usersGetMe() async
    test('test usersGetMe', () async {
      // TODO
    });

    // Update Me
    //
    //Future<UserRead> usersUpdateMe(MeUpdate meUpdate) async
    test('test usersUpdateMe', () async {
      // TODO
    });

    // Update User
    //
    //Future<JsonObject> usersUpdateUser(int userId, UpdateUserMember updateUserMember) async
    test('test usersUpdateUser', () async {
      // TODO
    });

  });
}
