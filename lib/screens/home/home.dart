import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/home/news.dart';
import 'package:fsek_mobile/screens/news/news.dart';
import 'package:fsek_mobile/services/home.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PagingController<int, News> _pagingController = PagingController(firstPageKey: 1);

  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      loadMoreNews(pageKey);
    });
    super.initState();
  }

  Future<void> _onRefresh() async {
    _pagingController.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return createNewsCard();
  }

  Widget createNewsCard() {
    return RefreshIndicator(
        onRefresh: () => _onRefresh(),
        child: Container(
          child: PagedListView<int, News>(
            pagingController: _pagingController,
            shrinkWrap: true,
            builderDelegate: PagedChildBuilderDelegate<News>(itemBuilder: (context, news, index) {
              if (news.title == null) return Container();

              return Card(
                  child: InkWell(
                      onTap: () => openNews(news),
                      child: ListTile(
                        title: Text(news.title!),
                        subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(news.user!.name!),
                          SizedBox(height: 6),
                          Text(
                            news.created_at.toString().substring(0, 16),
                            style: TextStyle(fontSize: 12),
                          )
                        ]),
                        isThreeLine: true,
                      )));
            }, noItemsFoundIndicatorBuilder: (context) {
              return Container(height: 400, child: Center(child: Text("Inga nyheter tillgängliga", style: Theme.of(context).textTheme.headline6)));
            }),
          ),
        ));
  }

  void openNews(News news) {
    //redirect to other page and shit
    Navigator.push(context, MaterialPageRoute(builder: (context) => NewsPage(news: news)));
  }

  void loadMoreNews(int page) {
    locator<HomeService>().getMoreNews(page).then((value) {
      if (value.meta?.next_page == null) {
        _pagingController.appendLastPage(value.news ?? []);
      } else if (page == 1) {
        locator<HomeService>().getPinnedNews().then((pinned) {
          _pagingController.appendPage((pinned.news ?? []) + (value.news ?? []), page + 1);
        });
      } else {
        _pagingController.appendPage(value.news ?? [], page + 1);
      }
    });
  }
}
