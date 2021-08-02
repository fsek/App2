import 'package:fsek_mobile/models/gallery/gallery.dart';

import 'abstract.service.dart';

class GalleryService extends AbstractService {
  Future<List<Gallery>> getGalleries() async {
    Map json = await AbstractService.get("/gallery");
    List<Gallery> result = (json['gallery'] as List)
        .map((data) => Gallery.fromJson(data))
        .toList();
    return result;
  }
}
