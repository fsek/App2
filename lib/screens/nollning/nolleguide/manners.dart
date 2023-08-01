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
  List<Article> articles = [];
  Article? welcomeArticle;
  static const List<Color> weekColors = [
    Color(0xFF202C57), // v0
    Color(0xFF4B6357), // v1
    Color(0xFF9B4C52), // v2
    Color(0xFF260F3F), // v3
    Color(0xFF165C7F), // v4
    Color(0xFFf77e14),
  ];

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
    return !(a.intro ?? false)
        ? Container(
            //child: InkWell(
            child: Stack(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.subdirectory_arrow_right_rounded,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(45, 2, 3, 2),
                  child: InkWell(
                    onTap: () => openArticle(a),
                    child: ListTile(
                      tileColor: weekColors[_determineWeek()].withOpacity(0.3),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      title: Text(
                        a.title![locale]!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right_rounded),
                    ),
                  ),
                ),
              ],
            ),
          )
        : Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Card(
              child: Padding(
                padding: EdgeInsets.only(top: 3),
                child: ListTile(
                  title: Text(
                    a.title![locale]!,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Html(
                        data: a.content![locale]!,
                        style: {
                          "body": Style(
                            fontSize: FontSize(15.0),
                          ),
                        },
                      ),
                      SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
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
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(top: 5),
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
                      fontSize: FontSize(16.0),
                    ),
                  },
                ),
                SizedBox(
                  height: 6,
                ),
              ],
            ),
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

int _determineWeek() {
  DateTime now = DateTime.now();
  DateTime v0 = DateTime(2023, 8, 21, 0, 0);
  DateTime v1 = DateTime(2023, 8, 28, 0, 0);
  DateTime v2 = DateTime(2023, 9, 4, 0, 0);
  DateTime v3 = DateTime(2023, 9, 11, 0, 0);
  DateTime v4 = DateTime(2023, 9, 18, 0, 0);

  List<DateTime> weeks = [v0, v1, v2, v3, v4];

  for (int i = 0; i < weeks.length; i++) {
    // If we have gotten to week 4 then end of list so edge-case
    if (i == 4) {
      // if its week 4 and current time is after start time of week 4
      if (now.compareTo(weeks[i]) > 0) {
        return i;
      }
    } else if (now.compareTo(weeks[i]) > 0 && now.compareTo(weeks[i + 1]) < 0) {
      return i;
    }
  }
  return 5; // if before nollning starts, color is set to fsek orange
}
