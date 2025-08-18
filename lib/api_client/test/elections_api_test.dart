import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for ElectionsApi
void main() {
  final instance = ApiClient().getElectionsApi();

  group(ElectionsApi, () {
    // Add Post To Election
    //
    //Future<ElectionRead> electionsAddPostToElection(int electionId, ElectionAddPosts electionAddPosts) async
    test('test electionsAddPostToElection', () async {
      // TODO
    });

    // Create Election
    //
    //Future<ElectionRead> electionsCreateElection(ElectionCreate electionCreate) async
    test('test electionsCreateElection', () async {
      // TODO
    });

    // Delete Election
    //
    //Future<ElectionRead> electionsDeleteElection(int electionId) async
    test('test electionsDeleteElection', () async {
      // TODO
    });

    // Get All Elections
    //
    //Future<BuiltList<ElectionRead>> electionsGetAllElections() async
    test('test electionsGetAllElections', () async {
      // TODO
    });

    // Get Election
    //
    //Future<ElectionRead> electionsGetElection(int electionId) async
    test('test electionsGetElection', () async {
      // TODO
    });

  });
}
