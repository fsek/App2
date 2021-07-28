import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/home/news.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key, required this.news}) : super(key: key);

  final News news;

  String _handleContent(String content) {
    //This might not be needed here. Maybe fix in the serializer(?) DEees
    int fwdIndex = 0;
    int backIndex = content.length - 1;
    while (content[fwdIndex] != ">") {
      fwdIndex++;
    }
    while (content[backIndex] != "<") {
      backIndex--;
    }
    return content.substring(fwdIndex + 1, backIndex);
  }

  @override
  Widget build(BuildContext context) {
    //make it look not terrible
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  news.title!,
                ),
              ),
              alignment: Alignment.center),
          Divider(
            thickness: 4,
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0),
              child: Text(_handleContent(news.content!)),
            ),
            alignment: Alignment.topLeft, //Alignment acting kinda sus )^:
          ), //clean up weird divs from content, helper or actually fix xd
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    news.user!.name!,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                      news.created_at!.toString())) //fix disgusting timestamps
            ],
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
}
