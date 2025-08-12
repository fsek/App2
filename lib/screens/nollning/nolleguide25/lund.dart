import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:linkify/linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class LundPage extends StatefulWidget {
  @override
  _LundPageState createState() => _LundPageState();
}

class _LundPageState extends State<LundPage> {
  String? lundJsonString;

  Future<void> _loadLundJsonString() async {
    final jsonString = await rootBundle.loadString(
        "assets/data/nollning_25/nolleguide/studentlivet/lund.json");
    setState(() {
      this.lundJsonString = jsonString;
    });
  }

  void initState() {
    super.initState();
    _loadLundJsonString();
  }

  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    String spex1 =
        "assets/data/nollning_25/nolleguide/studentlivet/spexbild1.jpg";
    String spex2 =
        "assets/data/nollning_25/nolleguide/studentlivet/spexbild2.jpg";

    String rubrikPath = "assets/data/nollning_25/nolleguide/rubrik.png";
    String hyllaPath = "assets/data/nollning_25/nolleguide/hylla.png";
    String plattaPath =
        "assets/data/nollning_25/nolleguide/kladguide/platta.png";
    String backgroundPath = "assets/data/nollning_25/nolleguide/bakgrund.png";
    String stativ = "assets/data/nollning_25/nolleguide/stativ.png";

    if (lundJsonString == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    List<dynamic> data = jsonDecode(lundJsonString!);

    String textSvOrEn = t.localeName == "sv" ? "text_sv" : "text_eng";
    String sectionSvOrEn = t.localeName == "sv" ? "section_sv" : "section_eng";

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          scrolledUnderElevation: 0.0,
        ),
        body: InteractiveViewer(
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
                          padding: EdgeInsets.only(top: 30),
                          child: Text("LUND",
                              style: TextStyle(
                                  letterSpacing: 2,
                                  fontFamily: "MinionPro",
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFd4d3d6),
                                  fontSize: screenWidth / 8))))
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
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: screenHeight / 1.5,
                          width: screenWidth,
                          child: Stack(
                            children: [
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Image.asset(
                                    hyllaPath,
                                    fit: BoxFit.contain,
                                  )),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                    padding: EdgeInsets.only(bottom: 20),
                                    child: Container(
                                      height: screenHeight / 2,
                                      width: screenWidth / 1.1,
                                      child: Stack(
                                        children: [
                                          Positioned.fill(
                                              child: Image.asset(
                                            plattaPath,
                                            fit: BoxFit.fill,
                                          )),
                                          Align(
                                              alignment: Alignment.topCenter,
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 20,
                                                      right: 40,
                                                      left: 40),
                                                  child: Column(
                                                    children: [
                                                      _createHeaderText(
                                                          data[0]
                                                              [sectionSvOrEn],
                                                          screenWidth / 25),
                                                      _createStandardText(
                                                          data[0][textSvOrEn],
                                                          screenWidth / 40)
                                                    ],
                                                  )))
                                        ],
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: screenHeight / 4,
                          width: screenWidth,
                          child: Stack(
                            children: [
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Image.asset(
                                    hyllaPath,
                                    fit: BoxFit.contain,
                                  )),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                              height: screenHeight / 5.2,
                                              width: screenWidth / 1.2,
                                              child: Image.asset(spex1,
                                                  fit: BoxFit.fill)),
                                          Container(
                                              height: screenHeight / 30,
                                              width: screenWidth / 3,
                                              child: Image.asset(stativ,
                                                  fit: BoxFit.fill)),
                                          SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      )))
                            ],
                          ),
                        ),
                        Container(
                          height: screenHeight / 4,
                          width: screenWidth,
                          child: Stack(
                            children: [
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                              height: screenHeight / 5.2,
                                              width: screenWidth / 1.2,
                                              child: Image.asset(spex2,
                                                  fit: BoxFit.fill)),
                                          Container(
                                              height: screenHeight / 30,
                                              width: screenWidth / 3,
                                              child: Image.asset(stativ,
                                                  fit: BoxFit.fill)),
                                        ],
                                      )))
                            ],
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
                    Center(
                        child: Column(
                      children: [
                        Container(
                          height: screenHeight * 1.2 / 1.8,
                          width: screenWidth / 1.1,
                          child: Stack(
                            children: [
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Image.asset(
                                    hyllaPath,
                                    fit: BoxFit.contain,
                                  )),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                    padding: EdgeInsets.only(bottom: 20),
                                    child: Container(
                                      height: screenHeight / 2,
                                      width: screenWidth / 1.1,
                                      child: Stack(
                                        children: [
                                          Positioned.fill(
                                              child: Image.asset(
                                            plattaPath,
                                            fit: BoxFit.fill,
                                          )),
                                          Align(
                                              alignment: Alignment.topCenter,
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 20,
                                                      right: 40,
                                                      left: 40),
                                                  child: Column(
                                                    children: [
                                                      _createHeaderText(
                                                          data[1]
                                                              [sectionSvOrEn],
                                                          screenWidth / 25),
                                                      _createStandardText(
                                                          data[1][textSvOrEn],
                                                          screenWidth / 34)
                                                    ],
                                                  )))
                                        ],
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: screenHeight * 1.2 / 2.3,
                          width: screenWidth / 1.1,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                    padding: EdgeInsets.only(bottom: 20),
                                    child: Container(
                                      height: screenHeight / 2.1,
                                      width: screenWidth / 1.1,
                                      child: Stack(
                                        children: [
                                          Positioned.fill(
                                              child: Image.asset(
                                            plattaPath,
                                            fit: BoxFit.fill,
                                          )),
                                          Align(
                                              alignment: Alignment.topCenter,
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 20,
                                                      right: 40,
                                                      left: 40),
                                                  child: Column(
                                                    children: [
                                                      _createHeaderText(
                                                          data[2]
                                                              [sectionSvOrEn],
                                                          screenWidth / 25),
                                                      _createClickableStandardText(
                                                          data[2][textSvOrEn],
                                                          screenWidth / 30)
                                                    ],
                                                  )))
                                        ],
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              )
            ],
          ),
        )));
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

  Widget _createClickableStandardText(String str, double fontSize) {
    return Linkify(
      textAlign: TextAlign.left,
      text: str,
      linkifiers: [UrlLinkifier(), PhoneNumberLinkifier(), EmailLinkifier()],
      onOpen: (link) async {
        if (link is EmailElement) {
          _launchMail(link.url);
        } else if (link is PhoneNumberElement) {
          print(link.url.replaceAll(" ", ""));
          _launchPhoneNumber(link.url);
        } else if (link is UrlElement) {
          _launchUrl(link.url);
        }
      },
      style: TextStyle(
          fontFamily: "MinionPro",
          fontWeight: FontWeight.w400,
          fontSize: fontSize),
      linkStyle: TextStyle(color: Colors.blue),
    );
  }

  Future<void> _launchMail(String email) async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    await launchUrl(launchUri);
  }

  Future<void> _launchPhoneNumber(String phoneNumber) async {
    // phoneNumber can safely contain "-", "+" and " "
    String sanitizedNbr = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: sanitizedNbr,
    );
    await launchUrl(launchUri);
  }

  Future<void> _launchUrl(String url) async {
    launchUrl(Uri.parse(url));
  }
}
