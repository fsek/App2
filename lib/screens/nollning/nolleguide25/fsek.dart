import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';

class FsekPage extends StatefulWidget {
  @override
  _FsekPageState createState() => _FsekPageState();
}

class _FsekPageState extends State<FsekPage> {
  String? sektionenJsonString;

  Future<void> _loadSektionenJsonString() async {
    final jsonString = await rootBundle.loadString(
        "assets/data/nollning_25/nolleguide/studentlivet/fsek/sektionen.json");
    setState(() {
      this.sektionenJsonString = jsonString;
    });
  }

  void initState() {
    super.initState();
    _loadSektionenJsonString();
  }

  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    String rubrikPath = "assets/data/nollning_25/nolleguide/rubrik.png";
    String hyllaPath = "assets/data/nollning_25/nolleguide/hylla.png";
    String plattaPath =
        "assets/data/nollning_25/nolleguide/kladguide/platta.png";
    String backgroundPath = "assets/data/nollning_25/nolleguide/bakgrund.png";
    String stativ = "assets/data/nollning_25/nolleguide/stativ.png";

    String aron =
        "assets/data/nollning_25/nolleguide/studentlivet/fsek/aron.jpg";
    String cafem =
        "assets/data/nollning_25/nolleguide/studentlivet/fsek/cafem.jpg";
    String cofosAle =
        "assets/data/nollning_25/nolleguide/studentlivet/fsek/cofosAle.jpg";
    String cofosTova =
        "assets/data/nollning_25/nolleguide/studentlivet/fsek/cofosTova.jpg";
    String cofosAlma =
        "assets/data/nollning_25/nolleguide/studentlivet/fsek/cofosAlma.jpg";
    String cofosErik =
        "assets/data/nollning_25/nolleguide/studentlivet/fsek/cofosErik.jpg";
    String cofosFrida =
        "assets/data/nollning_25/nolleguide/studentlivet/fsek/cofosFrida.jpg";
    String cofosHannes =
        "assets/data/nollning_25/nolleguide/studentlivet/fsek/cofosHannes.jpg";
    String farad =
        "assets/data/nollning_25/nolleguide/studentlivet/fsek/farad.jpg";
    String fnu = "assets/data/nollning_25/nolleguide/studentlivet/fsek/fnu.jpg";
    String freja =
        "assets/data/nollning_25/nolleguide/studentlivet/fsek/freja.jpg";
    String idrottsf =
        "assets/data/nollning_25/nolleguide/studentlivet/fsek/idrottsf.jpg";
    String kassor =
        "assets/data/nollning_25/nolleguide/studentlivet/fsek/kassor.jpg";
    String kulturm =
        "assets/data/nollning_25/nolleguide/studentlivet/fsek/kulturm.jpg";
    String ordf =
        "assets/data/nollning_25/nolleguide/studentlivet/fsek/ordf.jpg";
    String overfosVictor =
        "assets/data/nollning_25/nolleguide/studentlivet/fsek/overfosVictor.jpg";
    String preses =
        "assets/data/nollning_25/nolleguide/studentlivet/fsek/preses.jpg";
    String prylm =
        "assets/data/nollning_25/nolleguide/studentlivet/fsek/prylm.jpg";
    String rm = "assets/data/nollning_25/nolleguide/studentlivet/fsek/rm.jpg";
    String samv =
        "assets/data/nollning_25/nolleguide/studentlivet/fsek/samv.jpg";
    String sanningsm =
        "assets/data/nollning_25/nolleguide/studentlivet/fsek/sanningsm.jpg";
    String sekreterare =
        "assets/data/nollning_25/nolleguide/studentlivet/fsek/sekreterare.jpg";
    String sexm =
        "assets/data/nollning_25/nolleguide/studentlivet/fsek/sexm.jpg";
    String spindelf =
        "assets/data/nollning_25/nolleguide/studentlivet/fsek/spindelf.jpg";
    String um = "assets/data/nollning_25/nolleguide/studentlivet/fsek/um.jpg";
    String viceordf =
        "assets/data/nollning_25/nolleguide/studentlivet/fsek/viceordf.jpg";
    String placeholderImg = "assets/img/underConstruction.png";

    if (sektionenJsonString == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    Map<String, dynamic> data = jsonDecode(sektionenJsonString!);

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          scrolledUnderElevation: 0.0,
        ),
        body: InteractiveViewer(
          panEnabled: true,
            child: SingleChildScrollView(
                child: Column(children: [
          Container(
            height: 30,
            width: screenWidth,
            color: Color(0xFF808181),
          ),
          _createHeaderWidget(
              data["categories"][12]["category_name"][t.localeName],
              t.localeName,
              screenWidth,
              screenHeight,
              rubrikPath,
              screenWidth / 10),
          _createPersonWidget(
            data["categories"][12]["people"][0]["position"][t.localeName],
            data["categories"][12]["people"][0]["name"][t.localeName],
            data["categories"][12]["people"][0]["text"][t.localeName],
            t.localeName,
            overfosVictor,
            rubrikPath,
            plattaPath,
            backgroundPath,
            stativ,
            hyllaPath,
            screenWidth,
            screenHeight,
            screenWidth / 15,
            screenWidth / 22,
            screenWidth / 30,
          ),
          _createPersonWidget(
            data["categories"][12]["people"][1]["position"][t.localeName],
            data["categories"][12]["people"][1]["name"][t.localeName],
            data["categories"][12]["people"][1]["text"][t.localeName],
            t.localeName,
            cofosTova,
            rubrikPath,
            plattaPath,
            backgroundPath,
            stativ,
            hyllaPath,
            screenWidth,
            screenHeight,
            screenWidth / 15,
            screenWidth / 22,
            screenWidth / 30,
          ),
          _createPersonWidget(
            data["categories"][12]["people"][2]["position"][t.localeName],
            data["categories"][12]["people"][2]["name"][t.localeName],
            data["categories"][12]["people"][2]["text"][t.localeName],
            t.localeName,
            cofosFrida,
            rubrikPath,
            plattaPath,
            backgroundPath,
            stativ,
            hyllaPath,
            screenWidth,
            screenHeight,
            screenWidth / 15,
            screenWidth / 22,
            screenWidth / 25,
          ),
          _createPersonWidget(
            data["categories"][12]["people"][3]["position"][t.localeName],
            data["categories"][12]["people"][3]["name"][t.localeName],
            data["categories"][12]["people"][3]["text"][t.localeName],
            t.localeName,
            cofosAlma,
            rubrikPath,
            plattaPath,
            backgroundPath,
            stativ,
            hyllaPath,
            screenWidth,
            screenHeight,
            screenWidth / 15,
            screenWidth / 22,
            screenWidth / 25,
          ),
          _createPersonWidget(
            data["categories"][12]["people"][4]["position"][t.localeName],
            data["categories"][12]["people"][4]["name"][t.localeName],
            data["categories"][12]["people"][4]["text"][t.localeName],
            t.localeName,
            cofosAle,
            rubrikPath,
            plattaPath,
            backgroundPath,
            stativ,
            hyllaPath,
            screenWidth,
            screenHeight,
            screenWidth / 15,
            screenWidth / 22,
            screenWidth / 25,
          ),
          _createPersonWidget(
            data["categories"][12]["people"][5]["position"][t.localeName],
            data["categories"][12]["people"][5]["name"][t.localeName],
            data["categories"][12]["people"][5]["text"][t.localeName],
            t.localeName,
            cofosErik,
            rubrikPath,
            plattaPath,
            backgroundPath,
            stativ,
            hyllaPath,
            screenWidth,
            screenHeight,
            screenWidth / 15,
            screenWidth / 22,
            screenWidth / 25,
          ),
          _createPersonWidget(
            data["categories"][12]["people"][6]["position"][t.localeName],
            data["categories"][12]["people"][6]["name"][t.localeName],
            data["categories"][12]["people"][6]["text"][t.localeName],
            t.localeName,
            cofosHannes,
            rubrikPath,
            plattaPath,
            backgroundPath,
            stativ,
            hyllaPath,
            screenWidth,
            screenHeight,
            screenWidth / 15,
            screenWidth / 22,
            screenWidth / 25,
          ),
          _createHeaderWidget(
              data["categories"][0]["category_name"][t.localeName],
              t.localeName,
              screenWidth,
              screenHeight,
              rubrikPath,
              screenWidth / 10),
          _createPersonWidget(
            data["categories"][0]["people"][0]["position"][t.localeName],
            data["categories"][0]["people"][0]["name"][t.localeName],
            data["categories"][0]["people"][0]["text"][t.localeName],
            t.localeName,
            ordf,
            rubrikPath,
            plattaPath,
            backgroundPath,
            stativ,
            hyllaPath,
            screenWidth,
            screenHeight,
            screenWidth / 15,
            screenWidth / 20,
            screenWidth / 36,
          ),
          _createPersonWidget(
            data["categories"][0]["people"][1]["position"][t.localeName],
            data["categories"][0]["people"][1]["name"][t.localeName],
            data["categories"][0]["people"][1]["text"][t.localeName],
            t.localeName,
            viceordf,
            rubrikPath,
            plattaPath,
            backgroundPath,
            stativ,
            hyllaPath,
            screenWidth,
            screenHeight,
            screenWidth / 15,
            screenWidth / 20,
            screenWidth / 30,
          ),
          _createHeaderWidget(
              data["categories"][1]["category_name"][t.localeName],
              t.localeName,
              screenWidth,
              screenHeight,
              rubrikPath,
              screenWidth / 10),
          _createPersonWidget(
            data["categories"][1]["people"][0]["position"][t.localeName],
            data["categories"][1]["people"][0]["name"][t.localeName],
            data["categories"][1]["people"][0]["text"][t.localeName],
            t.localeName,
            preses,
            rubrikPath,
            plattaPath,
            backgroundPath,
            stativ,
            hyllaPath,
            screenWidth,
            screenHeight,
            screenWidth / 15,
            screenWidth / 20,
            screenWidth / 28,
          ),
          _createHeaderWidget(
              data["categories"][2]["category_name"][t.localeName],
              t.localeName,
              screenWidth,
              screenHeight,
              rubrikPath,
              screenWidth / 10),
          _createPersonWidget(
            data["categories"][2]["people"][0]["position"][t.localeName],
            data["categories"][2]["people"][0]["name"][t.localeName],
            data["categories"][2]["people"][0]["text"][t.localeName],
            t.localeName,
            um,
            rubrikPath,
            plattaPath,
            backgroundPath,
            stativ,
            hyllaPath,
            screenWidth,
            screenHeight,
            screenWidth / 15,
            screenWidth / 20,
            screenWidth / 34,
          ),
          _createHeaderWidget(
              data["categories"][3]["category_name"][t.localeName],
              t.localeName,
              screenWidth,
              screenHeight,
              rubrikPath,
              screenWidth / 10),
          _createPersonWidget(
            data["categories"][3]["people"][0]["position"][t.localeName],
            data["categories"][3]["people"][0]["name"][t.localeName],
            data["categories"][3]["people"][0]["text"][t.localeName],
            t.localeName,
            sexm,
            rubrikPath,
            plattaPath,
            backgroundPath,
            stativ,
            hyllaPath,
            screenWidth,
            screenHeight,
            screenWidth / 15,
            screenWidth / 20,
            screenWidth / 36,
          ),
          _createHeaderWidget(
              data["categories"][4]["category_name"][t.localeName],
              t.localeName,
              screenWidth,
              screenHeight,
              rubrikPath,
              screenWidth / 10),
          _createPersonWidget(
            data["categories"][4]["people"][0]["position"][t.localeName],
            data["categories"][4]["people"][0]["name"][t.localeName],
            data["categories"][4]["people"][0]["text"][t.localeName],
            t.localeName,
            sekreterare,
            rubrikPath,
            plattaPath,
            backgroundPath,
            stativ,
            hyllaPath,
            screenWidth,
            screenHeight,
            screenWidth / 15,
            screenWidth / 20,
            screenWidth / 40,
          ),
          _createHeaderWidget(
              data["categories"][5]["category_name"][t.localeName],
              t.localeName,
              screenWidth,
              screenHeight,
              rubrikPath,
              screenWidth / 15),
          _createPersonWidget(
            data["categories"][5]["people"][0]["position"][t.localeName],
            data["categories"][5]["people"][0]["name"][t.localeName],
            data["categories"][5]["people"][0]["text"][t.localeName],
            t.localeName,
            sanningsm,
            rubrikPath,
            plattaPath,
            backgroundPath,
            stativ,
            hyllaPath,
            screenWidth,
            screenHeight,
            screenWidth / 15,
            screenWidth / 20,
            screenWidth / 40,
          ),
          _createPersonWidget(
            data["categories"][5]["people"][1]["position"][t.localeName],
            data["categories"][5]["people"][1]["name"][t.localeName],
            data["categories"][5]["people"][1]["text"][t.localeName],
            t.localeName,
            spindelf,
            rubrikPath,
            plattaPath,
            backgroundPath,
            stativ,
            hyllaPath,
            screenWidth,
            screenHeight,
            screenWidth / 15,
            screenWidth / 20,
            screenWidth / 34,
          ),
          _createHeaderWidget(
              data["categories"][6]["category_name"][t.localeName],
              t.localeName,
              screenWidth,
              screenHeight,
              rubrikPath,
              screenWidth / 10),
          _createPersonWidget(
            data["categories"][6]["people"][0]["position"][t.localeName],
            data["categories"][6]["people"][0]["name"][t.localeName],
            data["categories"][6]["people"][0]["text"][t.localeName],
            t.localeName,
            samv,
            rubrikPath,
            plattaPath,
            backgroundPath,
            stativ,
            hyllaPath,
            screenWidth,
            screenHeight,
            screenWidth / 15,
            screenWidth / 20,
            screenWidth / 50,
          ),
          _createHeaderWidget(
              data["categories"][7]["category_name"][t.localeName],
              t.localeName,
              screenWidth,
              screenHeight,
              rubrikPath,
              screenWidth / 10),
          _createPersonWidget(
            data["categories"][7]["people"][0]["position"][t.localeName],
            data["categories"][7]["people"][0]["name"][t.localeName],
            data["categories"][7]["people"][0]["text"][t.localeName],
            t.localeName,
            prylm,
            rubrikPath,
            plattaPath,
            backgroundPath,
            stativ,
            hyllaPath,
            screenWidth,
            screenHeight,
            screenWidth / 15,
            screenWidth / 20,
            screenWidth / 30,
          ),
          _createHeaderWidget(
              data["categories"][8]["category_name"][t.localeName],
              t.localeName,
              screenWidth,
              screenHeight,
              rubrikPath,
              screenWidth / 10),
          _createPersonWidget(
            data["categories"][8]["people"][0]["position"][t.localeName],
            data["categories"][8]["people"][0]["name"][t.localeName],
            data["categories"][8]["people"][0]["text"][t.localeName],
            t.localeName,
            fnu,
            rubrikPath,
            plattaPath,
            backgroundPath,
            stativ,
            hyllaPath,
            screenWidth,
            screenHeight,
            screenWidth / 15,
            screenWidth / 20,
            screenWidth / 30,
          ),
          _createPersonWidget(
            data["categories"][8]["people"][1]["position"][t.localeName],
            data["categories"][8]["people"][1]["name"][t.localeName],
            data["categories"][8]["people"][1]["text"][t.localeName],
            t.localeName,
            farad,
            rubrikPath,
            plattaPath,
            backgroundPath,
            stativ,
            hyllaPath,
            screenWidth,
            screenHeight,
            screenWidth / 15,
            screenWidth / 20,
            screenWidth / 30,
          ),
          _createHeaderWidget(
              data["categories"][9]["category_name"][t.localeName],
              t.localeName,
              screenWidth,
              screenHeight,
              rubrikPath,
              screenWidth / 15),
          _createPersonWidget(
            data["categories"][9]["people"][0]["position"][t.localeName],
            data["categories"][9]["people"][0]["name"][t.localeName],
            data["categories"][9]["people"][0]["text"][t.localeName],
            t.localeName,
            kulturm,
            rubrikPath,
            plattaPath,
            backgroundPath,
            stativ,
            hyllaPath,
            screenWidth,
            screenHeight,
            screenWidth / 15,
            screenWidth / 20,
            screenWidth / 34,
          ),
          _createPersonWidget(
            data["categories"][9]["people"][1]["position"][t.localeName],
            data["categories"][9]["people"][1]["name"][t.localeName],
            data["categories"][9]["people"][1]["text"][t.localeName],
            t.localeName,
            rm,
            rubrikPath,
            plattaPath,
            backgroundPath,
            stativ,
            hyllaPath,
            screenWidth,
            screenHeight,
            screenWidth / 15,
            screenWidth / 20,
            screenWidth / 34,
          ),
          _createPersonWidget(
            data["categories"][9]["people"][2]["position"][t.localeName],
            data["categories"][9]["people"][2]["name"][t.localeName],
            data["categories"][9]["people"][2]["text"][t.localeName],
            t.localeName,
            idrottsf,
            rubrikPath,
            plattaPath,
            backgroundPath,
            stativ,
            hyllaPath,
            screenWidth,
            screenHeight,
            screenWidth / 15,
            screenWidth / 20,
            screenWidth / 34,
          ),
          _createHeaderWidget(
              data["categories"][10]["category_name"][t.localeName],
              t.localeName,
              screenWidth,
              screenHeight,
              rubrikPath,
              screenWidth / 12),
          _createPersonWidget(
            data["categories"][10]["people"][0]["position"][t.localeName],
            data["categories"][10]["people"][0]["name"][t.localeName],
            data["categories"][10]["people"][0]["text"][t.localeName],
            t.localeName,
            cafem,
            rubrikPath,
            plattaPath,
            backgroundPath,
            stativ,
            hyllaPath,
            screenWidth,
            screenHeight,
            screenWidth / 15,
            screenWidth / 20,
            screenWidth / 30,
          ),
          _createHeaderWidget(
              data["categories"][11]["category_name"][t.localeName],
              t.localeName,
              screenWidth,
              screenHeight,
              rubrikPath,
              screenWidth / 10),
          _createPersonWidget(
            data["categories"][11]["people"][0]["position"][t.localeName],
            data["categories"][11]["people"][0]["name"][t.localeName],
            data["categories"][11]["people"][0]["text"][t.localeName],
            t.localeName,
            kassor,
            rubrikPath,
            plattaPath,
            backgroundPath,
            stativ,
            hyllaPath,
            screenWidth,
            screenHeight,
            screenWidth / 15,
            screenWidth / 20,
            screenWidth / 30,
          ),
          _createHeaderWidget(
              data["categories"][13]["category_name"][t.localeName],
              t.localeName,
              screenWidth,
              screenHeight,
              rubrikPath,
              screenWidth / 10),
          _createPersonWidget(
            data["categories"][13]["people"][0]["position"][t.localeName],
            data["categories"][13]["people"][0]["name"][t.localeName],
            data["categories"][13]["people"][0]["text"][t.localeName],
            t.localeName,
            aron,
            rubrikPath,
            plattaPath,
            backgroundPath,
            stativ,
            hyllaPath,
            screenWidth,
            screenHeight,
            screenWidth / 15,
            screenWidth / 22,
            screenWidth / 25,
          ),
          _createHeaderWidget(
              data["categories"][14]["category_name"][t.localeName],
              t.localeName,
              screenWidth,
              screenHeight,
              rubrikPath,
              screenWidth / 10),
          _createPersonWidget(
            data["categories"][14]["people"][0]["position"][t.localeName],
            data["categories"][14]["people"][0]["name"][t.localeName],
            data["categories"][14]["people"][0]["text"][t.localeName],
            t.localeName,
            freja,
            rubrikPath,
            plattaPath,
            backgroundPath,
            stativ,
            hyllaPath,
            screenWidth,
            screenHeight,
            screenWidth / 15,
            screenWidth / 22,
            screenWidth / 25,
          ),
        ]))));
  }

  Widget _createPersonWidget(
    String position,
    String name,
    String text,
    String locale,
    String personImagePath,
    String rubrikPath,
    String plattaPath,
    String backgroundPath,
    String stativ,
    String hyllaPath,
    double screenWidth,
    double screenHeight,
    double headerSize,
    double subheaderSize,
    double textSize,
  ) {
    return Column(children: [
      Stack(
        children: [
          Container(
              width: screenWidth,
              height: 120,
              child: Image.asset(rubrikPath, fit: BoxFit.fill)),
          Column(
            children: [
              Center(
                  child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Center(
                          child: _createHeaderText(
                              position.toUpperCase(),
                              position.length < 20
                                  ? headerSize
                                  : headerSize / 1.5)))),
              Center(
                  child: Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: Center(
                          child: _createSubHeaderText(name, subheaderSize))))
            ],
          )
        ],
      ),
      Container(
        height: screenHeight * 1.2,
        width: screenWidth,
        child: Stack(
          children: [
            Positioned.fill(
                child: Image.asset(
              backgroundPath,
              fit: BoxFit.fill,
            )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: screenHeight * 1.2 / 2,
                  width: screenWidth,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          hyllaPath,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                  height: screenHeight / 2.8,
                                  width: screenWidth / 1.2,
                                  child: Image.asset(personImagePath,
                                      fit: BoxFit.fill)),
                              Container(
                                  height: screenHeight / 15,
                                  width: screenWidth / 3,
                                  child: Image.asset(stativ, fit: BoxFit.fill)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: screenHeight * 1.2 / 2,
                  width: screenWidth,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: Container(
                            height: screenHeight * 1.2 / 2.2,
                            width: screenWidth / 1.1,
                            child: Stack(children: [
                              Positioned.fill(
                                  child: Image.asset(
                                plattaPath,
                                fit: BoxFit.fill,
                              )),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 45, right: 45, top: 20),
                                    child: Column(
                                      children: [
                                        _createStandardText(text, textSize)
                                      ],
                                    )),
                              )
                            ]))),
                  ),
                )
              ],
            )
          ],
        ),
      )
    ]);
  }

  Widget _createHeaderWidget(String text, String locale, double screenWidth,
      double screenHeight, String rubrikPath, double textSize) {
    Widget headerWidget = Stack(
      children: [
        Container(
            width: screenWidth,
            height: 120,
            child: Image.asset(rubrikPath, fit: BoxFit.fill)),
        Center(
            child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Center(
                    child: _createHeaderText(
                        text.toUpperCase(),
                        text.length < 20
                            ? textSize
                            : (text.length < 30
                                ? textSize / 1.5
                                : textSize / 2)))))
      ],
    );

    return headerWidget;
  }

  Text _createHeaderText(String str, double fontSize) {
    return Text(
      textAlign: TextAlign.center,
      str,
      style: TextStyle(
          fontFamily: "MinionPro",
          fontWeight: FontWeight.w800,
          color: Color(0xFFd4d3d6),
          fontSize: fontSize),
    );
  }

  Text _createSubHeaderText(String str, double fontSize) {
    return Text(
      textAlign: TextAlign.left,
      str,
      style: TextStyle(
          fontFamily: "MinionPro",
          fontWeight: FontWeight.w600,
          color: Color(0xFFd4d3d6),
          fontSize: fontSize),
    );
  }

  Text _createStandardText(String str, double fontSize) {
    return Text(
      textAlign: TextAlign.left,
      str,
      style: TextStyle(
          height: 1.3,
          fontFamily: "MinionPro",
          fontWeight: FontWeight.normal,
          fontSize: fontSize),
    );
  }
}
