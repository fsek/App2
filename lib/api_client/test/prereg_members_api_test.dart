import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for PreregMembersApi
void main() {
  final instance = ApiClient().getPreregMembersApi();

  group(PreregMembersApi, () {
    // Create Multiple Prereg Members
    //
    //Future<BuiltList<PreregMemberRead>> preregMembersCreateMultiplePreregMembers(BuiltList<PreregMemberCreate> preregMemberCreate) async
    test('test preregMembersCreateMultiplePreregMembers', () async {
      // TODO
    });

    // Create Prereg Member
    //
    //Future<PreregMemberRead> preregMembersCreatePreregMember(PreregMemberCreate preregMemberCreate) async
    test('test preregMembersCreatePreregMember', () async {
      // TODO
    });

    // Delete Multiple Prereg Members
    //
    //Future<BuiltList<PreregMemberRead>> preregMembersDeleteMultiplePreregMembers(BuiltList<int> requestBody) async
    test('test preregMembersDeleteMultiplePreregMembers', () async {
      // TODO
    });

    // Delete Prereg Member
    //
    //Future<PreregMemberRead> preregMembersDeletePreregMember(int preregMemberId) async
    test('test preregMembersDeletePreregMember', () async {
      // TODO
    });

    // Get All Prereg Member Info
    //
    //Future<BuiltList<PreregMemberRead>> preregMembersGetAllPreregMemberInfo() async
    test('test preregMembersGetAllPreregMemberInfo', () async {
      // TODO
    });

    // Get Prereg Member Info
    //
    //Future<PreregMemberRead> preregMembersGetPreregMemberInfo(int preregMemberId) async
    test('test preregMembersGetPreregMemberInfo', () async {
      // TODO
    });

    // Update Prereg Member
    //
    //Future<PreregMemberRead> preregMembersUpdatePreregMember(int preregMemberId, PreregMemberUpdate preregMemberUpdate) async
    test('test preregMembersUpdatePreregMember', () async {
      // TODO
    });

  });
}
