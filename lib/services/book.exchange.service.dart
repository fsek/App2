import 'package:fsek_mobile/models/exchangebook/exchangebookEntry.dart';

import 'package:fsek_mobile/services/abstract.service.dart';

class BookService extends AbstractService {
  Future<List<BookEntry>> getBooks() async {
    Map json = await AbstractService.get("/books");
    List<BookEntry> result = (json['books'] as List)
        .map((data) => BookEntry.fromJson(data))
        .toList();
    return result;
  }
}
