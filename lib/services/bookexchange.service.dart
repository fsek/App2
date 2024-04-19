import 'package:fsek_mobile/models/exchangebook/exchangebookEntry.dart';

import 'package:fsek_mobile/services/abstractPython.service.dart';

class BookService extends AbstractServicePython {
  Future<List<BookEntry>> getBooks() async {
    List json = await AbstractServicePython.get("/books");
    List<BookEntry> result =
        (json).map((data) => BookEntry.fromJson(data)).toList();
    return result;
  }
}
