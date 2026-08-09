import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide_26/infoContent.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide_26/infoScreen.dart';

class LundPage extends StatefulWidget {
  @override
  _LundPageState createState() => _LundPageState();
}

class _LundPageState extends State<LundPage> {
  static const path = "assets/data/nollning_26/nolleguide/studentlife/lund";
  static const spex1 = "$path/spexbild1.jpg";
  static const spex2 = "$path/spexbild2.jpg";

  String? jsonString;

  Future<void> _loadJson() async {
    final jsonString = await rootBundle.loadString("$path/data_lund.json");
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
    final locale = AppLocalizations.of(context)!.localeName;

    if(this.jsonString == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    final Map<String, dynamic> data = jsonDecode(this.jsonString!);

    return InfoScreen(blocks: [
          ContentBlock.title("Lund"),
          ContentBlock.subheading(data["spex"]["title"][locale]),
          ContentBlock.text(data["spex"]["text"][locale]),
          ContentBlock.image(spex1),
          ContentBlock.image(spex2),
          ContentBlock.spacer(),
          ContentBlock.subheading(data["sektion"]["title"][locale]),
          ContentBlock.text(data["sektion"]["text"][locale]),
          ContentBlock.spacer(),
          ContentBlock.subheading(data["nation"]["title"][locale]),
          ContentBlock.clickableText(data["nation"]["text"][locale])
      ]
    );
  }
}