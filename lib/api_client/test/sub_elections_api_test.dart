import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for SubElectionsApi
void main() {
  final instance = ApiClient().getSubElectionsApi();

  group(SubElectionsApi, () {
    // Create Sub Election
    //
    //Future<SubElectionRead> subElectionsCreateSubElection(SubElectionCreate subElectionCreate) async
    test('test subElectionsCreateSubElection', () async {
      // TODO
    });

    // Delete Sub Election
    //
    //Future<SubElectionRead> subElectionsDeleteSubElection(int subElectionId) async
    test('test subElectionsDeleteSubElection', () async {
      // TODO
    });

    // Get Sub Election
    //
    //Future<SubElectionRead> subElectionsGetSubElection(int subElectionId) async
    test('test subElectionsGetSubElection', () async {
      // TODO
    });

    // Move Election Post
    //
    //Future<SubElectionRead> subElectionsMoveElectionPost(int subElectionId, MovePostRequest movePostRequest) async
    test('test subElectionsMoveElectionPost', () async {
      // TODO
    });

    // Update Sub Election
    //
    //Future<SubElectionRead> subElectionsUpdateSubElection(int subElectionId, SubElectionUpdate subElectionUpdate) async
    test('test subElectionsUpdateSubElection', () async {
      // TODO
    });

  });
}
