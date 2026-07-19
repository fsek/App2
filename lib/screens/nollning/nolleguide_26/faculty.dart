import 'package:flutter/material.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';
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

    const background = "assets/data/nollning_26/homescreen/background.png";


    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
      ),
      body: WallFactory.generateWall(
          children: generateWallContent(locale: t.localeName),
          background: background,
          screenHeight: screenHeight)
    );
  }

  List<Widget> generateWallContent({
    required String locale
  }) {
    final String title = "$path/title_${locale}.png";
    final String frame = "$path/frame_big.png";

    return [
      Image.asset(title),
      const SizedBox(height: 24),
      generatePortrait(locale: locale, imagePath: frame, size: 4),
      generatePortrait(locale: locale, imagePath: frame, size: 4),
      generatePortrait(locale: locale, imagePath: frame, size: 4),
      generatePortrait(locale: locale, imagePath: frame, size: 4),
      generatePortrait(locale: locale, imagePath: frame, size: 4),
      generatePortrait(locale: locale, imagePath: frame, size: 4),
    ];
  }

  Widget generatePortrait({
    required String locale,
    required String imagePath,
    required int size,
    VoidCallbackAction? onTap
  }){
    return Row(
      children: [
        const Expanded(flex: 1, child: SizedBox()),
        Expanded(flex: size, child: Image.asset(imagePath, fit: BoxFit.fitWidth)),
        const Expanded(flex: 1, child: SizedBox())
      ],
    );
  }
}