import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for AlbumsApi
void main() {
  final instance = ApiClient().getAlbumsApi();

  group(AlbumsApi, () {
    // Create Album
    //
    //Future<BuiltMap<String, String>> albumsCreateAlbum(AlbumCreate albumCreate) async
    test('test albumsCreateAlbum', () async {
      // TODO
    });

    // Delete One Album
    //
    //Future<BuiltMap<String, String>> albumsDeleteOneAlbum(int id) async
    test('test albumsDeleteOneAlbum', () async {
      // TODO
    });

    // Get Albums
    //
    //Future<BuiltList<AlbumRead>> albumsGetAlbums() async
    test('test albumsGetAlbums', () async {
      // TODO
    });

    // Get One Album
    //
    //Future<AlbumRead> albumsGetOneAlbum(int id) async
    test('test albumsGetOneAlbum', () async {
      // TODO
    });

  });
}
