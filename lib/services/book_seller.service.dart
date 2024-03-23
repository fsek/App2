import 'package:fsek_mobile/models/book_seller/advertisement.dart';
import 'package:fsek_mobile/services/abstractPython.service.dart';

class BookSellerService extends AbstractServicePython {
  Future<List<Advertisement>> getAll() async {
    Map json = await AbstractServicePython.get('/ad');
    List<Advertisement> result = (json['ads'] as List)
        .map((data) => Advertisement.fromJson(data))
        .toList();
    return result;
  }
}
