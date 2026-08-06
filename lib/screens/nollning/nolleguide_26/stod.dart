import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide_26/infoContent.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide_26/infoScreen.dart';

class StodPage extends StatefulWidget {
  @override
  _StodPageState createState() => _StodPageState();
}

class _StodPageState extends State<StodPage> {
  static const path = "assets/data/nollning_26/nolleguide";
  static const stud_karin = "$path/stud_karin.jpg";
  static const stud_freja = "$path/stud_freja.jpeg";
  static const stud_petra = "$path/stud_petra.png";

  String? jsonString;

  Future<void> _loadJson() async {
    final jsonString = await rootBundle.loadString("$path/data_stod.json");
    setState(() {
      this.jsonString = jsonString;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadJson();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!.localeName;
    if (jsonString == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    final List<dynamic> data = jsonDecode(jsonString!);

    return InfoScreen(blocks: [
      for(final item in data) ..._buildItemWidgets(item, t)
    ]);
  }

  static List<ContentBlock> _buildItemWidgets(dynamic item, String locale) {
    final result = <ContentBlock>[];
    if(item["type"] == "title") {
      result.add(ContentBlock.title(item["title"][locale]));
    }else if(item["type"] == "subheading"){
      result.add(ContentBlock.subheading(item["title"][locale]));
    }else if(item["type"] == "stud") {
      // I am sorry for this, but I cannot be arsed to code a proper parser for image embed in json
      result.add(ContentBlock.subheading(item["title"][locale]));
      result.add(ContentBlock.clickableText(item["texts"][locale][0]));
      result.add(ContentBlock.image(stud_petra));
      result.add(ContentBlock.clickableText(item["texts"][locale][1]));
      result.add(ContentBlock.image(stud_freja));
      result.add(ContentBlock.clickableText(item["texts"][locale][2]));
      result.add(ContentBlock.image(stud_karin));
      return result;
    }

    if(item["text"] != ""){
      result.add(ContentBlock.clickableText(item["text"][locale]));
    }
    return result;
  }
}