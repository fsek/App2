import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/nollning/nolleguide/article.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

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
    return Text(a.title![locale]!);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vett & Etikett"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
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
