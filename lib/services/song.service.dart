import 'package:fsek_mobile/models/songbook/song.dart';

import 'abstract.service.dart';

class SongService extends AbstractService {
  Future<Song> getSong(int id) async {
    Map json = await AbstractService.get('/songs/${id}'); 
    Song result = Song.fromJson(json['song']); 
    return result;
  }

}
