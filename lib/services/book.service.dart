import 'package:fsek_mobile/models/exchangebook/onebook.dart';

import 'abstractPython.service.dart';

class OneBookService extends AbstractServicePython {
  Future<OneBook> getOneBook(int id) async {
    Map json = await AbstractServicePython.get('/books/$id');
    OneBook result = OneBook.fromJson(json['book']);
    return result;
  }
}
