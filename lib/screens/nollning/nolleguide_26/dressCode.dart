import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide_26/infoContent.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide_26/infoScreen.dart';

class DressCodePage extends StatefulWidget {
  @override
  _DressCodePageState createState() => _DressCodePageState();
}

class _DressCodePageState extends State<DressCodePage> {
  static const path = "assets/data/nollning_26/nolleguide/dresscode";
  String? jsonString;

  @override
  void initState() {
    super.initState();
    _loadJson();
  }

  Future<void> _loadJson() async {
    final jsonString = await rootBundle.loadString("$path/data_klad.json");
    setState(() {
      this.jsonString = jsonString;
    });
}

  @override
  Widget build(BuildContext context) {
    if(this.jsonString == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    final Map<String, dynamic> data = jsonDecode(jsonString!);
    final t = AppLocalizations.of(context)!.localeName;
    String imagePath(String image) => "$path/$image.png";

    final sections = data["sections"];

    return InfoScreen(blocks: [
      ContentBlock.title(data["title"][t]),

      ContentBlock.text(data["content"][t]),

      ContentBlock.title(sections[0]["title"][t]),

      ContentBlock.subheading(sections[0]["subsections"][0]["title"][t]), //Frack
      ContentBlock.clickableText(sections[0]["subsections"][0]["content"][t]),
      ContentBlock.image(imagePath(sections[0]["subsections"][0]["image"])),

      ContentBlock.subheading(sections[0]["subsections"][1]["title"][t]), // Full dress
      ContentBlock.text(sections[0]["subsections"][1]["content"][t]),

      ContentBlock.subheading(sections[0]["subsections"][2]["title"][t]), // Accessories
      ContentBlock.text(sections[0]["subsections"][2]["content"][t]),

      ContentBlock.title(sections[1]["title"][t]), //Formal
      ContentBlock.subheading(sections[1]["subsections"][0]["title"][t]),
      ContentBlock.text(sections[1]["subsections"][0]["content"][t]),
      ContentBlock.subheading(sections[1]["subsections"][1]["title"][t]),
      ContentBlock.text(sections[1]["subsections"][1]["content"][t]),
      ContentBlock.image(imagePath(sections[1]["image"])),

      ContentBlock.title(sections[2]["title"][t]), // Smart Casual
      ContentBlock.text(sections[2]["content"][t]),
      ContentBlock.image(imagePath(sections[2]["image"])),

      ContentBlock.title(sections[3]["title"][t]), // Ovve
      ContentBlock.text(sections[3]["content"][t]),
      ContentBlock.image(imagePath(sections[3]["image"])),

      ContentBlock.title(sections[4]["title"][t]), // Ovve+Theme
      ContentBlock.text(sections[4]["content"][t]),

      ContentBlock.title(sections[5]["title"][t]), // Technologist cap
      ContentBlock.text(sections[5]["content"][t]),
      ContentBlock.image(imagePath(sections[5]["image"])),

      ContentBlock.title(sections[6]["title"][t]), // Tassel
      ContentBlock.text(sections[6]["content"][t]),

      ContentBlock.title(sections[7]["title"][t]), // Medal
      ContentBlock.text(sections[7]["content"][t]),
      ContentBlock.image(imagePath(sections[7]["image"])),

      ContentBlock.title(sections[8]["title"][t]),
      ContentBlock.text(sections[8]["content"][t])
    ]);
  }
}