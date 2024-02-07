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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(w.value![locale]!, style: TextStyle(fontSize: 18)),
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
    return Scaffold(
      appBar: AppBar(
        title: Text(t.nolleguideWordlist),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: ListView(
          children: [
            Column(
              children: [
                ...wordlist.map(
                  (Word w) => _createWordCard(w),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
