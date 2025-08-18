import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for SongsCategoryApi
void main() {
  final instance = ApiClient().getSongsCategoryApi();

  group(SongsCategoryApi, () {
    // Create Song Category
    //
    //Future<SongCategoryRead> songsCategoryCreateSongCategory(SongCategoryCreate songCategoryCreate) async
    test('test songsCategoryCreateSongCategory', () async {
      // TODO
    });

    // Delete Song Category
    //
    //Future<SongCategoryRead> songsCategoryDeleteSongCategory(int categoryId) async
    test('test songsCategoryDeleteSongCategory', () async {
      // TODO
    });

    // Get All Song Categories
    //
    //Future<BuiltList<SongCategoryRead>> songsCategoryGetAllSongCategories() async
    test('test songsCategoryGetAllSongCategories', () async {
      // TODO
    });

    // Get Song Category
    //
    //Future<SongCategoryRead> songsCategoryGetSongCategory(int categoryId) async
    test('test songsCategoryGetSongCategory', () async {
      // TODO
    });

    // Update Song Category
    //
    //Future<SongCategoryRead> songsCategoryUpdateSongCategory(int categoryId, SongCategoryCreate songCategoryCreate) async
    test('test songsCategoryUpdateSongCategory', () async {
      // TODO
    });

  });
}
