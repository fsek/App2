import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/nollning/nolleguide/word.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WordListPage extends StatefulWidget {
  @override
  _WordListState createState() => _WordListState();
}

class _WordListState extends State<WordListPage> {
  List<Word> wordlist = [];

  _WordListState() {
    _loadWordList().then(
      (value) => setState(
        () {
          this.wordlist = value;
        },
      ),
    );
  }

  Future<List<Word>> _loadWordList() async {
    final String raw =
        await rootBundle.loadString('assets/data/guide/wordlist.json');
    Map<String, dynamic> jsonRaw = await json.decode(raw);
    List<Word> out =
        (jsonRaw['words'] as List).map((data) => Word.fromJson(data)).toList();
    return out;
  }

  Widget _createWordCard(Word w) {
    String locale = Localizations.localeOf(context).toString();
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  w.key![locale]!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth/24),
                ),
                Text(w.value![locale]!, style: TextStyle(fontSize: screenWidth/28, fontWeight: FontWeight.w500))
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    String superBackgroundPaperPath = "assets/img/nollning-24/nolleguide/superlong_paper_background.png";
    String superBackgroundWoodPath = "assets/img/nollning-24/nolleguide/superlong_wood_background.png";

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
      ),
      body: InteractiveViewer(
        child: 
        SingleChildScrollView(
          child: 
            Stack(
              children: [
                Positioned.fill(child: Image.asset(superBackgroundWoodPath, fit: BoxFit.fill)),
                Positioned.fill(child: Image.asset(superBackgroundPaperPath, fit: BoxFit.fill,)),
                Container(
                  margin: EdgeInsets.only(top: 120, left: 40, right: 40, bottom: 60),
                  child: Column(
                    children: [
                      Text(
                        t.nolleguideWordlist,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Testament",
                            fontSize: screenWidth/12,
                            color: Color(0xFF540909)
                        )
                      ),
                      ...wordlist.map(
                      (Word w) => _createWordCard(w),
                    ),
                  ]
                  )
              ),
              ]
              ),
        ),
      ),
    );
  }
}