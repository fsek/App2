import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fsek_mobile/models/nollning/nolleguide/person.dart';
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
    final String raw =
        await rootBundle.loadString('assets/data/nolleguide_2024/studentvett.json');
    Map<String, dynamic> jsonRaw = await json.decode(raw);
    List<Article> out = (jsonRaw['articles'] as List)
        .map((data) => Article.fromJson(data))
        .toList();
    return out;
  }


  @override
  Widget build(BuildContext context){
    var t = AppLocalizations.of(context)!;

    String backgroundPaperPath = "assets/img/nollning-24/nolleguide/nolleguide_paper.png";
    String backgroundWoodPath = "assets/img/nollning-24/nolleguide/wood_background.png";

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
      ),
      body:  articles.isEmpty
          ? Center(child: CircularProgressIndicator()) :
      InteractiveViewer(child: SingleChildScrollView(
        child:
            Stack(
              children: [
                Positioned.fill(child: Image.asset(backgroundWoodPath, fit: BoxFit.fill)),
                Positioned.fill(child: Image.asset(backgroundPaperPath, fit: BoxFit.fill,)),
                Container(
                  margin: EdgeInsets.only(top: 100, left: 50, right: 50),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 80),
                      Center(child:
                      Text(
                        articles[0].title![t.localeName]!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Testament",
                            fontSize: screenWidth/18,
                            color: Color(0xFF540909)
                        )
                      )
                    ),
                    SizedBox(height: 20),
                    Text(
                      articles[0].content![t.localeName]!,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        //fontStyle: FontStyle.italic,
                        fontSize: screenWidth/32,
                        ),
                    ),
                    SizedBox(height: 50),
                    Center(child:
                      Text(
                        articles[1].title![t.localeName]!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Testament",
                            fontSize: screenWidth/15,
                            color: Color(0xFF540909)
                        )
                      )
                    ),
                    SizedBox(height: 20),
                    Text(
                      articles[1].content![t.localeName]!,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        //fontStyle: FontStyle.italic,
                        fontSize: screenWidth/32,
                        ),
                    ),
                    SizedBox(height: 180),
                  ],
                )
                )
              ],
            ),
        )
      )
    );
  }




}