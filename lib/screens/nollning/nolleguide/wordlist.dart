import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fsek_mobile/models/nollning/nolleguide/word.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

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
                  w.key!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(w.value!, style: TextStyle(fontSize: 18))
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Ordlista"),
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
