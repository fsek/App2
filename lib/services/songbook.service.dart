import 'package:fsek_mobile/models/songbook/songbookEntry.dart';

import 'package:fsek_mobile/services/abstract.service.dart';

class SongbookService extends AbstractService {
  Future<List<SongbookEntry>> getSongbook() async {
    Map json = await AbstractService.get("/songs"); 
    List<SongbookEntry> result = 
        (json['songs'] as List).map((data) => SongbookEntry.fromJson(data)).toList();
    return result; 
  }
  Future<List<SongbookEntry>> getChantbook() async {
    Map json = await AbstractService.get("/songs/chants");
    List<SongbookEntry> result =
    (json['songs'] as List).map((data) => SongbookEntry.fromJson(data)).toList();
    return result;
  }
}
