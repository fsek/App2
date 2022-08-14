import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fsek_mobile/models/nollning/nolleguide/article.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import '../article_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MannersPage extends StatefulWidget {
  @override
  _MannersPageState createState() => _MannersPageState();
}

class _MannersPageState extends State<MannersPage> {
  @override
  List<Article> articles = [];
  Article? welcomeArticle;

  _MannersPageState() {
    _loadArticles().then(
      (value) => setState(
        () {
          this.articles = value;
          welcomeArticle = value[0];
          if (welcomeArticle != null) {
            articles.removeAt(0);
          }
        },
      ),
    );
  }

  Future<List<Article>> _loadArticles() async {
    final String raw =
        await rootBundle.loadString('assets/data/guide/articles.json');
    Map<String, dynamic> jsonRaw = await json.decode(raw);
    List<Article> out = (jsonRaw['articles'] as List)
        .map((data) => Article.fromJson(data))
        .toList();
    return out;
  }

  Widget _createArticleCard(Article a) {
    String locale = Localizations.localeOf(context).toString();
    Widget mightBeImage = SizedBox(height: 10);
    if (a.image != "") {
      mightBeImage = Image.asset("assets/img/${a.image!}");
      const SizedBox(height: 10);
    }
    return Card(
      child: InkWell(
        onTap: () => openArticle(a),
        child: ListTile(
          title: Text(
            a.title![locale]!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                a.preamble![locale]!,
              ),
              SizedBox(
                height: 6,
              ),
              mightBeImage,
            ],
          ),
        ),
      ),
    );
  }

  Widget welcomeArticleCard(Article? a) {
    String locale = Localizations.localeOf(context).toString();
    if (a == null) {
      return Container();
    }
    return Card(
      child: ListTile(
        title: Text(
          a.title![locale]!,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Html(
              data: a.content![locale]!,
              style: {
                "body": Style(
                  fontSize: FontSize(14.0),
                ),
              },
            ),
            SizedBox(
              height: 6,
            ),
          ],
        ),
      ),
    );
  }

  void openArticle(Article a) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ArticlePage(
                  a: a,
                )));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.mannersEtiquette),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              children: [
                welcomeArticleCard(welcomeArticle),
                ...articles.map(
                  (Article a) => _createArticleCard(a),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
