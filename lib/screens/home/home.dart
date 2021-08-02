import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/home/news.dart';
import 'package:fsek_mobile/services/home.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';

class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<News> news = [];
  void initState() {
    locator<HomeService>().getAlbums();
    locator<HomeService>().getNews().then((value) => setState(() {this.news = value;}));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> newsItems = news.map((e) => createNewsCard(e)).toList();
    return Column(
      children: newsItems,
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
              Text(news.created_at.toString(), style: TextStyle(fontSize: 12),)
            ]),
          isThreeLine: true,
        )
      )
    );
  }

  void openNews(News news) {
    //redirect to other page and shit
  }
}