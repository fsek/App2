import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide_26/infoContent.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide_26/infoScreen.dart';

class EtiquettePage extends StatefulWidget{
  @override
  _EtiquettePageState createState() => _EtiquettePageState();
}

class _EtiquettePageState extends State<EtiquettePage> {
  static const path = "assets/data/nollning_26/nolleguide";
  String? jsonString;

  @override
  void initState() {
    super.initState();
    _loadJson();
  }

  Future<void> _loadJson() async {
    final jsonString = await rootBundle.loadString("$path/data_etiquette.json");
    setState(() {
      this.jsonString = jsonString;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(this.jsonString == null) {
      return Center(child: const CircularProgressIndicator());
    }

    final t = AppLocalizations.of(context)!;
    final List<dynamic> data = jsonDecode(jsonString!);

    return InfoScreen(blocks: [
      ContentBlock.title(t.nolleguideEtiquette),
      for(final item in data) ..._generateContent(item, t.localeName)
    ]);
  }

  List<ContentBlock> _generateContent(dynamic item, String locale) {
    final result = <ContentBlock>[];
    result.add(ContentBlock.title(item["title"][locale]));
    final content = item["content"][locale];
    for(final subItem in content) {
      if(subItem["heading"] != "") result.add(ContentBlock.subheading(subItem["heading"]));
      result.add(ContentBlock.text(subItem["paragraph"]));
    }

    return result;
  }
}