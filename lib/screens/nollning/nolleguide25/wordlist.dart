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
    final String raw = await rootBundle.loadString('assets/data/nollning_25/nolleguide/wordlist.json');
    Map<String, dynamic> jsonRaw = await json.decode(raw);
    List<Word> out = (jsonRaw['words'] as List).map((data) => Word.fromJson(data)).toList();
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth / 24),
                ),
                Text(w.value![locale]!, style: TextStyle(fontSize: screenWidth / 28, fontWeight: FontWeight.w500))
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

    String long_marble = "assets/data/nollning_25/nolleguide/long_marble.png";
    String short_marble = "assets/data/nollning_25/nolleguide/short_marble.png";
    String background = "assets/data/nollning_25/nolleguide/landskap_bakgrund.png";

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
        panEnabled: true,
        child: Container(
          height: screenHeight,
          width: screenWidth,
          child: Stack(
            children: [
              Positioned.fill(child: Image.asset(background, fit: BoxFit.fill)),
              SingleChildScrollView(
                child: Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 80),
                    Container(
                      height: screenHeight,
                      width: screenWidth/1.2,
                      child: Stack(
                        children: [
                          Positioned.fill(child: Image.asset(long_marble, fit: BoxFit.fill)),
                          Container(
                            margin: EdgeInsets.only(top: 20, left: 40, right: 40, bottom: 0),
                            child: Column(children: [
                            Text(t.nolleguideWordlist, 
                            style: TextStyle(
                              fontWeight: FontWeight.w900, 
                              fontFamily: "MinionPro", 
                              fontSize: screenWidth / 9, 
                              color: const Color.fromARGB(255, 83, 81, 81))),
                              ...wordlist.take(10).map(
                              (Word w) => _createWordCard(w),
                              ),
                            ])),
                        ],
                      ),
                    ),
                    SizedBox(height: 80),
                    Container(
                      height: screenHeight,
                      width: screenWidth/1.2,
                      child: Stack(
                        children: [
                          Positioned.fill(child: Image.asset(long_marble, fit: BoxFit.fill)),
                          Container(
                            margin: EdgeInsets.only(top: 60, left: 40, right: 40, bottom: 0),
                            child: Column(children: [
                            ...wordlist.skip(10).take(9).map(
                              (Word w) => _createWordCard(w),
                              ),
                            ])),
                        ],
                      ),
                    ),
                    SizedBox(height: 80),
                    Container(
                      height: screenHeight,
                      width: screenWidth/1.2,
                      child: Stack(
                        children: [
                          Positioned.fill(child: Image.asset(long_marble, fit: BoxFit.fill)),
                          Container(
                            margin: EdgeInsets.only(top: 60, left: 40, right: 40, bottom: 0),
                            child: Column(children: [
                            ...wordlist.skip(19).take(6).map(
                              (Word w) => _createWordCard(w),
                              ),
                            ])),
                        ],
                      ),
                    ),
                    SizedBox(height: 80),
                    Container(
                      height: screenHeight,
                      width: screenWidth/1.2,
                      child: Stack(
                        children: [
                          Positioned.fill(child: Image.asset(long_marble, fit: BoxFit.fill)),
                          Container(
                            margin: EdgeInsets.only(top: 60, left: 40, right: 40, bottom: 0),
                            child: Column(children: [
                            ...wordlist.skip(25).take(7).map(
                              (Word w) => _createWordCard(w),
                              ),
                            ])),
                        ],
                      ),
                    ),
                    SizedBox(height: 80),
                    Container(
                      height: screenHeight,
                      width: screenWidth/1.2,
                      child: Stack(
                        children: [
                          Positioned.fill(child: Image.asset(long_marble, fit: BoxFit.fill)),
                          Container(
                            margin: EdgeInsets.only(top: 60, left: 40, right: 40, bottom: 0),
                            child: Column(children: [
                            ...wordlist.skip(32).take(7).map(
                              (Word w) => _createWordCard(w),
                              ),
                            ])),
                        ],
                      ),
                    ),
                    SizedBox(height: 80),
                    Container(
                      height: screenHeight,
                      width: screenWidth/1.2,
                      child: Stack(
                        children: [
                          Positioned.fill(child: Image.asset(long_marble, fit: BoxFit.fill)),
                          Container(
                            margin: EdgeInsets.only(top: 60, left: 40, right: 40, bottom: 0),
                            child: Column(children: [
                            ...wordlist.skip(39).take(7).map(
                              (Word w) => _createWordCard(w),
                              ),
                            ])),
                        ],
                      ),
                    ),
                    SizedBox(height: 80),
                    Container(
                      height: screenHeight,
                      width: screenWidth/1.2,
                      child: Stack(
                        children: [
                          Positioned.fill(child: Image.asset(long_marble, fit: BoxFit.fill)),
                          Container(
                            margin: EdgeInsets.only(top: 60, left: 40, right: 40, bottom: 0),
                            child: Column(children: [
                            ...wordlist.skip(46).take(8).map(
                              (Word w) => _createWordCard(w),
                              ),
                            ])),
                        ],
                      ),
                    ),
                    SizedBox(height: 80),
                    Container(
                      height: screenHeight/1.5,
                      width: screenWidth/1.2,
                      child: Stack(
                        children: [
                          Positioned.fill(child: Image.asset(long_marble, fit: BoxFit.fill)),
                          Container(
                            margin: EdgeInsets.only(top: 60, left: 40, right: 40, bottom: 0),
                            child: Column(children: [
                            ...wordlist.skip(54).take(5).map(
                              (Word w) => _createWordCard(w),
                              ),
                            ])),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        )),
    );
  }
}
