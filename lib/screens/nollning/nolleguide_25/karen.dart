import 'package:flutter/material.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';

class KarenPage extends StatefulWidget {
  @override
  _KarenPageState createState() => _KarenPageState();
}

class _KarenPageState extends State<KarenPage> {
  String? karenJsonString;

  Future<void> _loadKarenJsonString() async {
    final jsonString = await rootBundle.loadString(
        "assets/data/nollning_25/nolleguide/studentlivet/teknologkarenklar.json");
    setState(() {
      this.karenJsonString = jsonString;
    });
  }

  void initState() {
    super.initState();
    _loadKarenJsonString();
  }

  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    String heltidare =
        "assets/data/nollning_25/nolleguide/studentlivet/hel.jpg";
    String karordf =
        "assets/data/nollning_25/nolleguide/studentlivet/karordf.jpg";
    String nollu = "assets/data/nollning_25/nolleguide/studentlivet/nollu.jpg";
    String nolleg =
        "assets/data/nollning_25/nolleguide/studentlivet/nolleg.jpg";

    String rubrikPath = "assets/data/nollning_25/nolleguide/rubrik.png";
    String hyllaPath = "assets/data/nollning_25/nolleguide/hylla.png";
    String plattaPath =
        "assets/data/nollning_25/nolleguide/kladguide/platta.png";
    String backgroundPath = "assets/data/nollning_25/nolleguide/bakgrund.png";
    String stativ = "assets/data/nollning_25/nolleguide/stativ.png";

    if (karenJsonString == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    Map<String, dynamic> data = jsonDecode(karenJsonString!);

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
                          padding: EdgeInsets.only(top: 40),
                          child: Text(data["category"][t.localeName],
                              style: TextStyle(
                                  letterSpacing: 2,
                                  fontFamily: "MinionPro",
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFd4d3d6),
                                  fontSize: screenWidth / 12))))
                ],
              ),
              Container(
                height: screenHeight,
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
                          height: screenHeight / 2,
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
                                          height: screenHeight / 3,
                                          width: screenWidth / 1.2,
                                          child: Image.asset(nollu,
                                              fit: BoxFit.fill)),
                                      Container(
                                          height: screenHeight / 15,
                                          width: screenWidth / 3,
                                          child: Image.asset(stativ,
                                              fit: BoxFit.fill)),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: screenHeight / 2,
                          width: screenWidth,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Container(
                                    height: screenHeight / 2.2,
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
                                                left: 40, right: 40, top: 20),
                                            child: Column(
                                              children: [
                                                _createHeaderText(
                                                    data["people"][0]["name"]
                                                        [t.localeName],
                                                    screenWidth / 25),
                                                _createStandardText(
                                                    data["people"][0]["text"]
                                                        [t.localeName],
                                                    screenWidth / 38)
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
                                          child: Image.asset(nolleg,
                                              fit: BoxFit.fill)),
                                      Container(
                                          height: screenHeight / 15,
                                          width: screenWidth / 3,
                                          child: Image.asset(stativ,
                                              fit: BoxFit.fill)),
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
                                                left: 40, right: 40, top: 20),
                                            child: Column(
                                              children: [
                                                _createHeaderText(
                                                    data["people"][1]
                                                            ["position"]
                                                        [t.localeName],
                                                    screenWidth / 25),
                                                _createHeaderText(
                                                    data["people"][1]["name"]
                                                        [t.localeName],
                                                    screenWidth / 30),
                                                _createStandardText(
                                                    data["people"][1]["text"]
                                                        [t.localeName],
                                                    screenWidth / 45)
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
                                          child: Image.asset(heltidare,
                                              fit: BoxFit.fill)),
                                      Container(
                                          height: screenHeight / 15,
                                          width: screenWidth / 3,
                                          child: Image.asset(stativ,
                                              fit: BoxFit.fill)),
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
                                                left: 40, right: 40, top: 20),
                                            child: Column(
                                              children: [
                                                _createHeaderText(
                                                    data["people"][2]["name"]
                                                        [t.localeName],
                                                    screenWidth / 25),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                _createStandardText(
                                                    data["people"][2]["text"]
                                                        [t.localeName],
                                                    screenWidth / 40)
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
                                          child: Image.asset(karordf,
                                              fit: BoxFit.fill)),
                                      Container(
                                          height: screenHeight / 15,
                                          width: screenWidth / 3,
                                          child: Image.asset(stativ,
                                              fit: BoxFit.fill)),
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
                                                left: 40, right: 40, top: 20),
                                            child: Column(
                                              children: [
                                                _createHeaderText(
                                                    data["people"][3]
                                                            ["position"]
                                                        [t.localeName],
                                                    screenWidth / 25),
                                                _createHeaderText(
                                                    data["people"][3]["name"]
                                                        [t.localeName],
                                                    screenWidth / 30),
                                                _createStandardText(
                                                    data["people"][3]["text"]
                                                        [t.localeName],
                                                    screenWidth / 42)
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
              ),
            ],
          )),
        ));
  }

  Text _createHeaderText(String str, double fontSize) {
    return Text(
      textAlign: TextAlign.center,
      str,
      style: TextStyle(
          fontFamily: "MinionPro",
          fontWeight: FontWeight.w900,
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
