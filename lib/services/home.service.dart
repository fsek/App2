import 'package:fsek_mobile/models/home/news.dart';

import 'abstract.service.dart';

class HomeService extends AbstractService {
  Future<List<News>> getNews() async {
    Map json = await AbstractService.get("/news");
    List<News> result = (json['news'] as List).map((data) => News.fromJson(data)).toList();
    return result;
  }
}