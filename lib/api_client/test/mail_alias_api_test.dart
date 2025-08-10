import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for MailAliasApi
void main() {
  final instance = ApiClient().getMailAliasApi();

  group(MailAliasApi, () {
    // Add Member
    //
    //Future<AliasRead> mailAliasAddMember(String aliasEmail, String memberEmail) async
    test('test mailAliasAddMember', () async {
      // TODO
    });

    // Create Alias
    //
    //Future<AliasRead> mailAliasCreateAlias(String alias) async
    test('test mailAliasCreateAlias', () async {
      // TODO
    });

    // Delete Alias
    //
    //Future<BuiltMap<String, String>> mailAliasDeleteAlias(String aliasEmail) async
    test('test mailAliasDeleteAlias', () async {
      // TODO
    });

    // List Aliases
    //
    //Future<BuiltList<AliasRead>> mailAliasListAliases() async
    test('test mailAliasListAliases', () async {
      // TODO
    });

    // Remove Member
    //
    //Future<AliasRead> mailAliasRemoveMember(String aliasEmail, String memberEmail) async
    test('test mailAliasRemoveMember', () async {
      // TODO
    });

  });
}
