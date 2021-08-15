import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/home/news.dart';
import 'package:intl/intl.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key, required this.news}) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {
    //make it look not terrible
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 2),
                child: Text(news.title!,
                  style: Theme.of(context).textTheme.headline6
                ),
              ),
            ),
          Divider(
            thickness: 1,
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0),
              child: 
                Text(news.content!,
                textAlign: TextAlign.left,
                ),
            ),
          ), //clean up weird divs from content, helper or actually fix xd
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Row(
              children: [
                Text(
                  news.user!.name!,
                ),
                Spacer(),
                Text(_generateTimestamp())
              ]
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: news.image == null
                ? SizedBox.shrink()
                : Image.network(news.image!),
          )
        ],
      ),
    );
  }

  String _generateTimestamp(){
    return "${DateFormat.y().format(news.created_at!)}-"
    "${DateFormat.M().format(news.created_at!)}-" 
    "${DateFormat.d().format(news.created_at!)}";
  }
}
