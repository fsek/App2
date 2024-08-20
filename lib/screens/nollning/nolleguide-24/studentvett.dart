import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:fsek_mobile/models/nollning/nolleguide/article.dart';

class StudentvettScreenPage extends StatefulWidget {
  @override
  _StudentvettScreenState createState() => _StudentvettScreenState();
}

class _StudentvettScreenState extends State<StudentvettScreenPage> {
  List<Article> articles = [];

  _StudentvettScreenState() {
    _loadArticles().then(
      (value) => setState(
        () {
          this.articles = value;
        },
      ),
    );
  }

  Future<List<Article>> _loadArticles() async {
    final String raw = await rootBundle.loadString('assets/data/nolleguide_2024/studentvett.json');
    Map<String, dynamic> jsonRaw = await json.decode(raw);
    List<Article> out = (jsonRaw['articles'] as List).map((data) => Article.fromJson(data)).toList();
    return out;
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    String superBackgroundPaperPath = "assets/img/nollning-24/nolleguide/superlong_paper_background.png";
    String superBackgroundWoodPath = "assets/img/nollning-24/nolleguide/superlong_wood_background.png";

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          scrolledUnderElevation: 0.0,
        ),
        body: articles.isEmpty
            ? Center(child: CircularProgressIndicator())
            : InteractiveViewer(
                child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Positioned.fill(child: Image.asset(superBackgroundWoodPath, fit: BoxFit.fill)),
                    Positioned.fill(
                        child: Image.asset(
                      superBackgroundPaperPath,
                      fit: BoxFit.fill,
                    )),
                    Container(
                        margin: EdgeInsets.only(top: 100, left: 50, right: 50, bottom: 60),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(child: Text(articles[0].title![t.localeName]!, style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Testament", fontSize: screenWidth / 18, color: Color(0xFF540909)))),
                            SizedBox(height: 20),
                            Text(
                              articles[1].title![t.localeName]!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth / 25,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              articles[1].content![t.localeName]!,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: screenWidth / 29,
                              ),
                            ),
                            SizedBox(height: 30),
                            Text(
                              articles[2].title![t.localeName]!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth / 25,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              articles[2].content![t.localeName]!,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: screenWidth / 29,
                              ),
                            ),
                            SizedBox(height: 30),
                            Text(
                              articles[3].title![t.localeName]!,
                              style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Testament", fontSize: screenWidth / 18, color: Color(0xFF540909)),
                            ),
                            SizedBox(height: 10),
                            Text(
                              articles[3].content![t.localeName]!,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: screenWidth / 29,
                              ),
                            ),
                            SizedBox(height: 30),
                            Text(
                              articles[4].title![t.localeName]!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth / 25,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              articles[4].content![t.localeName]!,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: screenWidth / 29,
                              ),
                            ),
                            SizedBox(height: 30),
                            Text(
                              articles[5].title![t.localeName]!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth / 25,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              articles[5].content![t.localeName]!,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: screenWidth / 29,
                              ),
                            ),
                            SizedBox(height: 30),
                            Text(
                              articles[6].title![t.localeName]!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth / 25,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              articles[6].content![t.localeName]!,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: screenWidth / 29,
                              ),
                            ),
                            SizedBox(height: 30),
                            Text(
                              articles[7].title![t.localeName]!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth / 25,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              articles[7].content![t.localeName]!,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: screenWidth / 29,
                              ),
                            ),
                            SizedBox(height: 30),
                            Text(
                              articles[8].title![t.localeName]!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth / 25,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              articles[8].content![t.localeName]!,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: screenWidth / 29,
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              )));
  }
}
