import 'package:fsek_mobile/models/gallery/gallery.dart';

import 'abstract.service.dart';

class GalleryService extends AbstractService {
  Future<List<Gallery>> getGalleries({String year = ""}) async {
    String uri;
    uri = year == "" ? "/gallery" : "/gallery?year=" + year;
    Map json = await AbstractService.get(uri);
    List<Gallery> result =
        (json['albums'] as List).map((data) => Gallery.fromJson(data)).toList();
    return result;
  }
}
