import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for DefaultApi
void main() {
  final instance = ApiClient().getDefaultApi();

  group(DefaultApi, () {
    // Hello Route
    //
    //Future<JsonObject> helloRoute() async
    test('test helloRoute', () async {
      // TODO
    });

    // Permission Route
    //
    //Future<JsonObject> manageEventOnlypermissionRoute() async
    test('test manageEventOnlypermissionRoute', () async {
      // TODO
    });

    // Member Only
    //
    //Future<JsonObject> memberOnlymemberOnly() async
    test('test memberOnlymemberOnly', () async {
      // TODO
    });

    // User Only
    //
    //Future<JsonObject> userOnlyuserOnly() async
    test('test userOnlyuserOnly', () async {
      // TODO
    });

  });
}
