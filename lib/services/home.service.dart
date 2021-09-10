import 'package:fsek_mobile/models/home/news_wrapper.dart';

import 'abstract.service.dart';

class HomeService extends AbstractService {
  Future<NewsWrapper> getMoreNews(int page) async {
    Map json = await AbstractService.get("/news?page=$page");
    NewsWrapper result = NewsWrapper.fromJson(json as Map<String, dynamic>);
    return result;
  }

  Future<NewsWrapper> getPinnedNews() async {
    Map json = await AbstractService.get("/start");
    NewsWrapper result = NewsWrapper.fromJson(json["pinned"] as Map<String, dynamic>);
    return result;
  }
}
