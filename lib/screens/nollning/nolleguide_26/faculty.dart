import 'package:flutter/material.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide_26/portraitFactory.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide_26/wallFactory.dart';

class FacultyPage extends StatefulWidget {
  @override
  _FacultyPageState createState() => _FacultyPageState();
}

class _FacultyPageState extends State<FacultyPage> {
  static const path = "assets/data/nollning_26/nolleguide/studentlife/faculty";

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: new Color.fromRGBO(41, 171, 226, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
      ),
      body: WallFactory.generateWall(
          children: generateWallContent(locale: t.localeName),
          screenHeight: screenHeight)
    );
  }

  List<Widget> generateWallContent({
    required String locale
  }) {
    final String title = "$path/title_${locale}.png";
    final String frame = "$path/frame.png";
    final String president = "$path/president_${locale}.png";
    final String officers = "$path/officers_${locale}.png";
    final String nollu = "$path/nollu.png";


    return PortraitFactory.addSpacing(space: 24, items: [
      Image.asset(title),
      PortraitFactory.generatePortrait(imagePath: president, size: 5),
      PortraitFactory.generatePortrait(imagePath: officers, size: 2),
      PortraitFactory.generatePortrait(imagePath: frame, size: 5), //TODO: Nollegeneral Norea
      PortraitFactory.generatePortrait(imagePath: nollu, size: 2),
    ]);

  }
}