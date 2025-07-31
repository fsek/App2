import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for AdsApi
void main() {
  final instance = ApiClient().getAdsApi();

  group(AdsApi, () {
    // Create Ad
    //
    //Future<AdRead> adsCreateAd(AdCreate adCreate) async
    test('test adsCreateAd', () async {
      // TODO
    });

    // Get Ad By Id
    //
    //Future<AdRead> adsGetAdById(int id) async
    test('test adsGetAdById', () async {
      // TODO
    });

    // Get Ad By User
    //
    //Future<BuiltList<AdRead>> adsGetAdByUser(String username) async
    test('test adsGetAdByUser', () async {
      // TODO
    });

    // Get All Ads
    //
    //Future<BuiltList<AdRead>> adsGetAllAds() async
    test('test adsGetAllAds', () async {
      // TODO
    });

    // Get Book Ad By Author
    //
    //Future<BuiltList<AdRead>> adsGetBookAdByAuthor(String authorname) async
    test('test adsGetBookAdByAuthor', () async {
      // TODO
    });

    // Get Book Ad By Title
    //
    //Future<BuiltList<AdRead>> adsGetBookAdByTitle(String stitle) async
    test('test adsGetBookAdByTitle', () async {
      // TODO
    });

    // Remove Ad
    //
    //Future<AdRead> adsRemoveAd(int id) async
    test('test adsRemoveAd', () async {
      // TODO
    });

    // Remove Ad Super User
    //
    //Future<AdRead> adsRemoveAdSuperUser(int id) async
    test('test adsRemoveAdSuperUser', () async {
      // TODO
    });

    // Update Ad
    //
    //Future<AdRead> adsUpdateAd(int id, AdUpdate adUpdate) async
    test('test adsUpdateAd', () async {
      // TODO
    });

  });
}
