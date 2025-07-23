import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for CandidatesApi
void main() {
  final instance = ApiClient().getCandidatesApi();

  group(CandidatesApi, () {
    // Create Candidation
    //
    //Future<CandidateRead> candidatesCreateCandidation(int electionId, int postId) async
    test('test candidatesCreateCandidation', () async {
      // TODO
    });

    // Create Candidations
    //
    //Future<CandidateRead> candidatesCreateCandidations(int electionId, CandidateElectionCreate candidateElectionCreate) async
    test('test candidatesCreateCandidations', () async {
      // TODO
    });

    // Get All Candidations
    //
    //Future<BuiltList<CandidateRead>> candidatesGetAllCandidations(int electionId) async
    test('test candidatesGetAllCandidations', () async {
      // TODO
    });

  });
}
