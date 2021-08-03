import 'package:fsek_mobile/models/gallery/album.dart';
import 'package:fsek_mobile/models/gallery/album.dart';
import 'package:fsek_mobile/services/abstract.service.dart';

class AlbumService extends AbstractService{
  Future<Album> getAlbum(int id) async{
    String uri = "/album/${id}"; 
    Map json = await AbstractService.get(uri);
    Album result = Album.fromJson(json['album']);
    return result; 
  }
}