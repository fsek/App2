import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for KeyvalsApi
void main() {
  final instance = ApiClient().getKeyvalsApi();

  group(KeyvalsApi, () {
    // Delete Keyval
    //
    //Future<KeyvalRead> keyvalsDeleteKeyval(String key) async
    test('test keyvalsDeleteKeyval', () async {
      // TODO
    });

    // Get Keyval
    //
    //Future<KeyvalRead> keyvalsGetKeyval(String key) async
    test('test keyvalsGetKeyval', () async {
      // TODO
    });

    // Get Keyvals
    //
    //Future<BuiltList<KeyvalRead>> keyvalsGetKeyvals() async
    test('test keyvalsGetKeyvals', () async {
      // TODO
    });

    // Post Keyval
    //
    //Future<KeyvalRead> keyvalsPostKeyval(KeyvalCreate keyvalCreate) async
    test('test keyvalsPostKeyval', () async {
      // TODO
    });

    // Update Keyval
    //
    //Future<KeyvalRead> keyvalsUpdateKeyval(String key, KeyvalUpdate keyvalUpdate) async
    test('test keyvalsUpdateKeyval', () async {
      // TODO
    });

  });
}
