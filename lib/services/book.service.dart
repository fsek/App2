import 'package:fsek_mobile/models/exchangebook/onebook.dart';

import 'abstract.service.dart';

class OneBookService extends AbstractService {
  Future<OneBook> getOneBook(int id) async {
    Map json = await AbstractService.get('/books/$id');
    OneBook result = OneBook.fromJson(json['book']);
    return result;
  }
}
