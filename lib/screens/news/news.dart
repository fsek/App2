import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fsek_mobile/models/home/news.dart';
import 'package:fsek_mobile/util/time.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key, required this.news}) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {
    //make it look not terrible
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 2),
                  child: Text(news.title!,
                      style: Theme.of(context).textTheme.headline6),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0),
                  child: Html(
                      data: news.content!,
                      style: {"p": Style(lineHeight: LineHeight(1.2))},
                      onLinkTap: (String? url, RenderContext context,
                          Map<String, String> attributes, element) {
                        launchUrl(Uri.parse(url!));
                      }),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Row(children: [
                  Text(
                    news.user!.name!,
                  ),
                  Spacer(),
                  Text(Time.format(news.created_at!, "%d %M %Y %h:%m"))
                ]),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: news.image == null
                    ? SizedBox.shrink()
                    : Image.network(news.image!),
              )
            ],
          ),
        ));
  }

}
