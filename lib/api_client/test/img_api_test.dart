import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for ImgApi
void main() {
  final instance = ApiClient().getImgApi();

  group(ImgApi, () {
    // Delete Image
    //
    //Future<BuiltMap<String, String>> imgDeleteImage(int id) async
    test('test imgDeleteImage', () async {
      // TODO
    });

    // Get Image
    //
    //Future<JsonObject> imgGetImage(int id) async
    test('test imgGetImage', () async {
      // TODO
    });

    // Upload Image
    //
    //Future<BuiltMap<String, String>> imgUploadImage(int albumId, MultipartFile file) async
    test('test imgUploadImage', () async {
      // TODO
    });

  });
}
