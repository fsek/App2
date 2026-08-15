import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide_26/infoContent.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide_26/infoScreen.dart';

class WordListPage extends StatefulWidget{
  @override
  _WordListState createState() => _WordListState();
}

class _WordListState extends State<WordListPage> {
  static const path = "assets/data/nollning_26/nolleguide";
  String? jsonString;
  @override
  void initState() {
    super.initState();
    _loadJson();
  }

  Future<void> _loadJson() async {
    final jsonString = await rootBundle.loadString("$path/data_wordlist.json");
    setState(() {
      this.jsonString = jsonString;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(this.jsonString == null){
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    final t = AppLocalizations.of(context)!;
    final List<dynamic> data = jsonDecode(this.jsonString!);
    return InfoScreen(blocks: [
      ContentBlock.title(t.nolleguideWordlist),
      for(final item in data) ...[
        ContentBlock.uncenteredSubheading(item["key"][t.localeName]),
        ContentBlock.text(item["value"][t.localeName])
      ]
    ]);
  }
}