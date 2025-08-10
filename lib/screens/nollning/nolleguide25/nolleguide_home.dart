import 'package:flutter/material.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/kladguide.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/stodfunktioner.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/wordlist.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/orgscreen/org_screen.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/studentvett.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide25/kladguide.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide25/stod.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide25/studentlivet_home.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide25/vettoetikett.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide25/wordlist.dart';
import 'package:fsek_mobile/services/preload_asset.service.dart';

class NolleGuideHomePage extends StatefulWidget {
  @override
  _NolleGuideHomeState createState() => _NolleGuideHomeState();
}

class _NolleGuideHomeState extends State<NolleGuideHomePage> {
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    String boktrave =
        "assets/data/nollning_25/nolleguide/homescreen/boktrave.png";
    String hjalm = "assets/data/nollning_25/nolleguide/homescreen/hjalm.png";
    String kladkod =
        "assets/data/nollning_25/nolleguide/homescreen/kladkod_${t.localeName}.png";
    String ordlista =
        "assets/data/nollning_25/nolleguide/homescreen/ordlista_${t.localeName}.png";
    String spindelnat =
        "assets/data/nollning_25/nolleguide/homescreen/spindelnat.png";
    String stod =
        "assets/data/nollning_25/nolleguide/homescreen/stod_${t.localeName}.png";
    String studentlivet =
        "assets/data/nollning_25/nolleguide/homescreen/studentlivet_${t.localeName}.png";
    String urna = "assets/data/nollning_25/nolleguide/homescreen/urna.png";
    String vett =
        "assets/data/nollning_25/nolleguide/homescreen/vettoetikett_${t.localeName}.png";

    String rubrikPath = "assets/data/nollning_25/nolleguide/rubrik.png";
    String hyllaPath = "assets/data/nollning_25/nolleguide/hylla.png";
    String plattaPath =
        "assets/data/nollning_25/nolleguide/kladguide/platta.png";
    String backgroundPath = "assets/data/nollning_25/nolleguide/bakgrund.png";

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
      ),
      body: InteractiveViewer(
          panEnabled: true,
          child: Container(
            height: screenHeight,
            width: screenWidth,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  width: screenWidth,
                  color: Color(0xFF808181),
                ),
                Stack(
                  children: [
                    Container(
                        width: screenWidth,
                        height: 120,
                        child: Image.asset(rubrikPath, fit: BoxFit.fill)),
                    Center(
                        child: Padding(
                            padding: t.localeName == "sv"
                                ? EdgeInsets.only(top: 30)
                                : EdgeInsets.only(top: 40),
                            child: Text(
                              t.nolleguide,
                              style: TextStyle(
                                  letterSpacing: 2,
                                  fontFamily: "MinionPro",
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFd4d3d6),
                                  fontSize: t.localeName == "sv"
                                      ? screenWidth / 9
                                      : screenWidth / 14),
                            )))
                  ],
                ),
                Stack(
                  children: [
                    Container(
                        width: screenWidth,
                        height: screenHeight / 1.3,
                        child: Stack(
                          children: [
                            Positioned.fill(
                                child: Image.asset(backgroundPath,
                                    fit: BoxFit.fill)),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: screenHeight / 18, left: 25),
                                  child: Image.asset(
                                    spindelnat,
                                    width: screenWidth / 2.5,
                                  ),
                                ))
                          ],
                        )),
                    Container(
                      width: screenWidth,
                      height: screenHeight / 1.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: (screenHeight / 1.3) / 3,
                            width: screenWidth,
                            child: Stack(
                              children: [
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Image.asset(hyllaPath,
                                        fit: BoxFit.fitWidth)),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: screenWidth / 4.5, left: 50),
                                      child: Container(
                                          height: screenHeight / 7.8,
                                          // width: screenWidth/4,
                                          child: InkWell(
                                              onTap: () => (),
                                              child: Image.asset(
                                                urna,
                                                fit: BoxFit.contain,
                                              ))),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 20, right: 0),
                                        child: Container(
                                          height: screenWidth / 3.5,
                                          child: InkWell(
                                            onTap: () => (Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        StudentlivetHome()))),
                                            child: Image.asset(studentlivet,
                                                fit: BoxFit.contain),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: (screenHeight / 1.3) / 3,
                            width: screenWidth,
                            child: Stack(
                              children: [
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Image.asset(hyllaPath,
                                        fit: BoxFit.fitWidth)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              bottom: 30,
                                              right: screenWidth / 9),
                                          child: Container(
                                            width: screenWidth / 4,
                                            child: InkWell(
                                              onTap: () => (),
                                              child: Image.asset(boktrave,
                                                  fit: BoxFit.fitWidth),
                                            ),
                                          )),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              bottom: 20, right: 20),
                                          child: Container(
                                              // width: screenWidth/3,
                                              height: screenHeight / 6,
                                              child: Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () => (Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                KladguidePage()))),
                                                    child: Image.asset(kladkod,
                                                        fit: BoxFit.fitHeight),
                                                  ),
                                                  InkWell(
                                                      onTap: () => (Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  WordListPage()))),
                                                      child: Image.asset(
                                                          ordlista,
                                                          fit:
                                                              BoxFit.fitHeight))
                                                ],
                                              ))),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                  height: ((screenHeight / 1.3) / 3) - 40,
                                  width: screenWidth,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 0, bottom: 20),
                                              child: Container(
                                                height: screenHeight / 7,
                                                width: screenWidth / 5,
                                                child: InkWell(
                                                  onTap: () => Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              StodScreen())),
                                                  child: Image.asset(stod,
                                                      fit: BoxFit.contain),
                                                ),
                                              ))),
                                      Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: screenWidth / 12,
                                                  right: screenWidth / 15,
                                                  bottom: 10),
                                              child: Container(
                                                height: screenHeight / 7,
                                                width: screenWidth / 5,
                                                child: InkWell(
                                                  onTap: () => (Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              VettOEtikettScreenPage()))),
                                                  child: Image.asset(vett,
                                                      fit: BoxFit.contain),
                                                ),
                                              ))),
                                      Align(
                                          alignment: Alignment.bottomRight,
                                          child: Padding(
                                              padding: EdgeInsets.only(left: 0),
                                              child: Container(
                                                height: screenHeight / 8,
                                                width: screenWidth / 4,
                                                child: InkWell(
                                                  onTap: () => (),
                                                  child: Image.asset(hjalm,
                                                      fit: BoxFit.contain),
                                                ),
                                              ))),
                                    ],
                                  ))),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  width: screenWidth,
                  height: (screenHeight - (screenHeight / 1.3)) - 150,
                  color: Color(0xFFb3b3b3),
                )
              ],
            ),
          )),
    );
  }
}
