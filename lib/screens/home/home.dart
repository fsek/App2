import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/home/news.dart';
import 'package:fsek_mobile/screens/news/news.dart';
import 'package:fsek_mobile/services/home.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<News> news = [];
  void initState() {
    locator<HomeService>().getNews().then((value) => setState(() {
          this.news = value;
        }));
    super.initState();
  }

  void _onRefresh() async {
    locator<HomeService>()
        .getNews()
        .then(
          (value) => setState(
            () {
              this.news = value;
              _refreshController.refreshCompleted();
            },
          ),
        )
        .catchError(
      (e) {
        _refreshController.refreshFailed();
      },
    );
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    List<Widget> newsItems = news.map((e) => createNewsCard(e)).toList();
    return SmartRefresher(
      controller: _refreshController,
      enablePullDown: true,
      onRefresh: _onRefresh,
      child: Column(
        children: newsItems,
      ),
    );
  }

  Widget createNewsCard(News news) {
    return Card(
        child: InkWell(
            onTap: () => openNews(news),
            child: ListTile(
              title: Text(news.title!),
              subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(news.user!.name!),
                    SizedBox(height: 6),
                    Text(
                      news.created_at.toString(),
                      style: TextStyle(fontSize: 12),
                    )
                  ]),
              isThreeLine: true,
            )));
  }

  void openNews(News news) {
    //redirect to other page and shit
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NewsPage(news: news)));
  }
}
