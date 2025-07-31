import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for SongsApi
void main() {
  final instance = ApiClient().getSongsApi();

  group(SongsApi, () {
    // Create Song
    //
    //Future<SongRead> songsCreateSong(SongCreate songCreate) async
    test('test songsCreateSong', () async {
      // TODO
    });

    // Delete Song
    //
    //Future<SongRead> songsDeleteSong(int songId) async
    test('test songsDeleteSong', () async {
      // TODO
    });

    // Get All Songs
    //
    //Future<BuiltList<SongRead>> songsGetAllSongs() async
    test('test songsGetAllSongs', () async {
      // TODO
    });

    // Get Song
    //
    //Future<SongRead> songsGetSong(int songId) async
    test('test songsGetSong', () async {
      // TODO
    });

    // Update Song
    //
    //Future<SongRead> songsUpdateSong(int songId, SongCreate songCreate) async
    test('test songsUpdateSong', () async {
      // TODO
    });

  });
}
