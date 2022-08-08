import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/nollning/nolleguide/article.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import '../article_page.dart';

class MannersPage extends StatefulWidget {
  @override
  _MannersPageState createState() => _MannersPageState();
}

class _MannersPageState extends State<MannersPage> {
  @override
  List<Article> articles = [];

  _MannersPageState() {
    _loadArticles().then(
      (value) => setState(
        () {
          this.articles = value;
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
              Image.asset(a.image!),
              const SizedBox(height: 10),
            ],
          ),
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
        title: Text("Vett & Etikett"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              children: [
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
