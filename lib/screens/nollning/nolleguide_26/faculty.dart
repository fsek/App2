import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide_26/portraitSpacing.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide_26/overlay.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide_26/portraitBuilder.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide_26/wallFactory.dart';

class FacultyPage extends StatefulWidget {
  @override
  _FacultyPageState createState() => _FacultyPageState();
}

class _FacultyPageState extends State<FacultyPage> {
  static const path = "assets/data/nollning_26/nolleguide/studentlife/faculty";

  String? jsonString;

  Future<void> _loadJson() async {
    final jsonString = await rootBundle.loadString("$path/data_faculty.json");
    setState(() {
      this.jsonString = jsonString;
    });
  }

  @override
  void initState(){
    super.initState();
    _loadJson();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    if(this.jsonString == null){
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    final double screenHeight = MediaQuery.of(context).size.height;
    final Map<String, dynamic> data = jsonDecode(this.jsonString!);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: new Color.fromRGBO(41, 171, 226, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
      ),
      body: InteractiveViewer(panEnabled: true,
          child: WallFactory.generateWall(
              children: generateWallContent(locale: t.localeName, data: data),
              screenHeight: screenHeight))
    );
  }

  List<Widget> generateWallContent({
    required String locale,
    required Map<String, dynamic> data
  }) {
    final String title = "$path/title_${locale}.png";
    final String frame = "$path/frame.png";
    final String president = "$path/president_${locale}.png";
    final String officers = "$path/officers_${locale}.png";
    final String nollu = "$path/nollu.png";

    void pushNavigator({required int index, required String imagePath}) =>
        Navigator.push(context, TextOverlayRoute(
            portrait: imagePath,
            text: data["people"][index]["text"][locale]));

    return [
      Image.asset(title),
      PortraitRow(portraits: [
        PortraitData(imagePath: president, flex: 5,
            onTap: () => pushNavigator(index: 0, imagePath: president)),
      ]),
      PortraitRow(portraits: [
        PortraitData(imagePath: officers, flex: 2,
            onTap: () => pushNavigator(index: 1, imagePath: officers)),
      ]),
      PortraitRow(portraits: [
        PortraitData(imagePath: frame, flex: 5,
            onTap: () => pushNavigator(index: 2, imagePath: frame)), //TODO: Nollegeneral Norea
      ]),
      PortraitRow(portraits: [
        PortraitData(imagePath: nollu, flex: 2,
            onTap: () => pushNavigator(index: 3, imagePath: nollu)),
      ]),
    ].withSpacing(24);

  }
}