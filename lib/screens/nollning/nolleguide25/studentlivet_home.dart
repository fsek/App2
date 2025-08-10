import 'package:flutter/material.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/kladguide.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/stodfunktioner.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/wordlist.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/orgscreen/org_screen.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide-24/studentvett.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide25/fsek.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide25/karen.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide25/kladguide.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide25/lund.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide25/stod.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide25/vettoetikett.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide25/wordlist.dart';
import 'package:fsek_mobile/services/preload_asset.service.dart';

class StudentlivetHome extends StatefulWidget {
  @override
  _StudentlivetHomeState createState() => _StudentlivetHomeState();
}

class _StudentlivetHomeState extends State<StudentlivetHome> {
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    String karen =
        "assets/data/nollning_25/nolleguide/studentlivet/karen_${t.localeName}.png";
    String lund = "assets/data/nollning_25/nolleguide/studentlivet/lund.png";
    String fsek =
        "assets/data/nollning_25/nolleguide/studentlivet/fsektionen_${t.localeName}.png";

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
                                child: Center(
                                    child: Text(
                                  textAlign: TextAlign.center,
                                  t.mannersEtiquette,
                                  style: TextStyle(
                                      letterSpacing: 2,
                                      fontFamily: "MinionPro",
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFFd4d3d6),
                                      fontSize: t.localeName == "sv"
                                          ? screenWidth / 10
                                          : screenWidth / 12),
                                ))))
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          height: screenHeight / 1.3,
                          width: screenWidth,
                          child: Image.asset(
                            backgroundPath,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: screenWidth,
                              height: screenHeight / 1.3 / 1.8,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Image.asset(
                                      hyllaPath,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                                height: screenHeight / 4,
                                                width: screenWidth / 2.5,
                                                child: InkWell(
                                                  onTap: () => (Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              FsekPage()))),
                                                  child: Image.asset(
                                                    fsek,
                                                    fit: BoxFit.fill,
                                                  ),
                                                )),
                                            Container(
                                              height: screenHeight / 4,
                                              width: screenWidth / 2.5,
                                              child: InkWell(
                                                  onTap: () => (Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              KarenPage()))),
                                                  child: Image.asset(
                                                    karen,
                                                    fit: BoxFit.fill,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: screenWidth,
                                  height: screenHeight / 1.3 / 2.4,
                                  child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                          padding: EdgeInsets.only(top: 0),
                                          child: Container(
                                            width: screenWidth / 2.5,
                                            height: screenHeight / 4,
                                            child: InkWell(
                                              onTap: () => (Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LundPage()))),
                                              child: Image.asset(
                                                lund,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ))),
                                )),
                          ],
                        )
                      ],
                    ),
                    Container(
                      width: screenWidth,
                      height: (screenHeight - (screenHeight / 1.3)) - 150,
                      color: Color(0xFFb3b3b3),
                    )
                  ],
                ))));
  }
}
