import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:fsek_mobile/models/nollning/nolleguide/article.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:linkify/linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class StodScreen extends StatefulWidget {
  @override
  _StodScreenState createState() => _StodScreenState();
}

class _StodScreenState extends State<StodScreen> {
  String? stodJsonString;

  void initState() {
    super.initState();
    _loadStodJsonString();
  }

  Future<void> _loadStodJsonString() async {
    final jsonString = await rootBundle
        .loadString("assets/data/nollning_25/nolleguide/stod.json");
    setState(() {
      stodJsonString = jsonString;
    });
  }

  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    String long_marble = "assets/data/nollning_25/nolleguide/long_marble.png";
    String short_marble = "assets/data/nollning_25/nolleguide/short_marble.png";
    String background =
        "assets/data/nollning_25/nolleguide/landskap_bakgrund.png";

    Map<String, dynamic> data = jsonDecode(stodJsonString!);

    String svOrEnTitle =
        t.localeName == "sv" ? "titel_svenska" : "titel_engelska";
    String svOrEnContent =
        t.localeName == "sv" ? "text_svenska" : "text_engelska";

    if (stodJsonString == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          scrolledUnderElevation: 0.0,
        ),
        body: InteractiveViewer(
            child: Container(
                height: screenHeight,
                width: screenWidth,
                child: Stack(children: [
                  Positioned.fill(
                      child: Image.asset(background, fit: BoxFit.fill)),
                  SingleChildScrollView(
                      child: Center(
                          child: Column(children: [
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: screenHeight / 1.5,
                      width: screenWidth / 1.2,
                      child: Stack(
                        children: [
                          Positioned.fill(
                              child: Image.asset(
                            short_marble,
                            fit: BoxFit.fill,
                          )),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 40, right: 40, top: 50),
                            child: Column(
                              children: [
                                Text(
                                  textAlign: TextAlign.center,
                                  data["guide"][0][svOrEnContent],
                                  style: TextStyle(
                                      fontFamily: "MinionPro",
                                      fontSize: screenWidth / 36,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                _createHeaderText(data["guide"][1][svOrEnTitle],
                                    screenWidth / 25),
                                SizedBox(
                                  height: 5,
                                ),
                                _createClickableStandardText(
                                  data["guide"][1][svOrEnContent],
                                  screenWidth / 36,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: screenHeight,
                      width: screenWidth / 1.2,
                      child: Stack(
                        children: [
                          Positioned.fill(
                              child: Image.asset(
                            long_marble,
                            fit: BoxFit.fill,
                          )),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 40, right: 40, top: 50),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                _createHeaderText(data["guide"][2][svOrEnTitle],
                                    screenWidth / 25),
                                SizedBox(
                                  height: 5,
                                ),
                                _createClickableStandardText(
                                  data["guide"][2][svOrEnContent],
                                  screenWidth / 36,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                _createHeaderText(data["guide"][3][svOrEnTitle],
                                    screenWidth / 25),
                                SizedBox(
                                  height: 5,
                                ),
                                _createClickableStandardText(
                                  data["guide"][3][svOrEnContent] +
                                      " " +
                                      t.internationalCoordinatorsWebsite,
                                  screenWidth / 36,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                _createHeaderText(data["guide"][4][svOrEnTitle],
                                    screenWidth / 25),
                                SizedBox(
                                  height: 5,
                                ),
                                _createClickableStandardText(
                                  data["guide"][4][svOrEnContent],
                                  screenWidth / 36,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: screenHeight,
                      width: screenWidth / 1.2,
                      child: Stack(
                        children: [
                          Positioned.fill(
                              child: Image.asset(
                            long_marble,
                            fit: BoxFit.fill,
                          )),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 40, right: 40, top: 50),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                _createHeaderText(data["guide"][5][svOrEnTitle],
                                    screenWidth / 25),
                                SizedBox(
                                  height: 5,
                                ),
                                _createClickableStandardText(
                                  data["guide"][5][svOrEnContent],
                                  screenWidth / 36,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                _createHeaderText(data["guide"][6][svOrEnTitle],
                                    screenWidth / 25),
                                SizedBox(
                                  height: 5,
                                ),
                                _createClickableStandardText(
                                  data["guide"][6][svOrEnContent] +
                                      t.internationalCoordinatorsWebsite,
                                  screenWidth / 36,
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                _createHeaderText(data["guide"][7][svOrEnTitle],
                                    screenWidth / 25),
                                SizedBox(
                                  height: 5,
                                ),
                                _createClickableStandardText(
                                  data["guide"][7][svOrEnContent],
                                  screenWidth / 36,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: screenHeight,
                      width: screenWidth / 1.2,
                      child: Stack(
                        children: [
                          Positioned.fill(
                              child: Image.asset(
                            long_marble,
                            fit: BoxFit.fill,
                          )),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 40, right: 40, top: 50),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                _createHeaderText(data["guide"][8][svOrEnTitle],
                                    screenWidth / 25),
                                SizedBox(
                                  height: 5,
                                ),
                                _createClickableStandardText(
                                  data["guide"][8][svOrEnContent] +
                                      t.guildAnonContactPage,
                                  screenWidth / 36,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                _createHeaderText(data["guide"][9][svOrEnTitle],
                                    screenWidth / 25),
                                SizedBox(
                                  height: 5,
                                ),
                                _createClickableStandardText(
                                  data["guide"][9][svOrEnContent],
                                  screenWidth / 36,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                _createHeaderText(
                                    data["guide"][10][svOrEnTitle],
                                    screenWidth / 25),
                                SizedBox(
                                  height: 5,
                                ),
                                _createClickableStandardText(
                                  data["guide"][10][svOrEnContent],
                                  screenWidth / 36,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                _createHeaderText(
                                    data["guide"][11][svOrEnTitle],
                                    screenWidth / 25),
                                SizedBox(
                                  height: 5,
                                ),
                                _createClickableStandardText(
                                  data["guide"][11][svOrEnContent],
                                  screenWidth / 36,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: screenHeight,
                      width: screenWidth / 1.2,
                      child: Stack(
                        children: [
                          Positioned.fill(
                              child: Image.asset(
                            long_marble,
                            fit: BoxFit.fill,
                          )),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 40, right: 40, top: 50),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  data["guide"][12][svOrEnTitle],
                                  style: TextStyle(
                                      fontFamily: "MinionPro",
                                      fontSize: screenWidth / 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                _createHeaderText(
                                    data["guide"][13][svOrEnTitle],
                                    screenWidth / 25),
                                SizedBox(
                                  height: 5,
                                ),
                                _createClickableStandardText(
                                  data["guide"][13][svOrEnContent],
                                  screenWidth / 36,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                _createHeaderText(
                                    data["guide"][14][svOrEnTitle],
                                    screenWidth / 25),
                                SizedBox(
                                  height: 5,
                                ),
                                _createClickableStandardText(
                                  data["guide"][14][svOrEnContent],
                                  screenWidth / 36,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                _createHeaderText(
                                    data["guide"][15][svOrEnTitle],
                                    screenWidth / 25),
                                SizedBox(
                                  height: 5,
                                ),
                                _createClickableStandardText(
                                  data["guide"][15][svOrEnContent],
                                  screenWidth / 36,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                _createHeaderText(
                                    data["guide"][16][svOrEnTitle],
                                    screenWidth / 25),
                                SizedBox(
                                  height: 5,
                                ),
                                _createClickableStandardText(
                                  data["guide"][16][svOrEnContent],
                                  screenWidth / 36,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                _createHeaderText(
                                    data["guide"][17][svOrEnTitle],
                                    screenWidth / 25),
                                SizedBox(
                                  height: 5,
                                ),
                                _createClickableStandardText(
                                  data["guide"][17][svOrEnContent],
                                  screenWidth / 36,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: screenHeight,
                      width: screenWidth / 1.2,
                      child: Stack(
                        children: [
                          Positioned.fill(
                              child: Image.asset(
                            long_marble,
                            fit: BoxFit.fill,
                          )),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 40, right: 40, top: 50),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                _createHeaderText(
                                    data["guide"][18][svOrEnTitle],
                                    screenWidth / 25),
                                SizedBox(
                                  height: 5,
                                ),
                                _createClickableStandardText(
                                  data["guide"][18][svOrEnContent],
                                  screenWidth / 36,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                _createHeaderText(
                                    data["guide"][19][svOrEnTitle],
                                    screenWidth / 25),
                                SizedBox(
                                  height: 5,
                                ),
                                _createClickableStandardText(
                                  data["guide"][19][svOrEnContent],
                                  screenWidth / 36,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                _createHeaderText(
                                    data["guide"][20][svOrEnTitle],
                                    screenWidth / 25),
                                SizedBox(
                                  height: 5,
                                ),
                                _createClickableStandardText(
                                  data["guide"][20][svOrEnContent],
                                  screenWidth / 36,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                _createHeaderText(
                                    data["guide"][21][svOrEnTitle],
                                    screenWidth / 25),
                                SizedBox(
                                  height: 5,
                                ),
                                _createClickableStandardText(
                                  data["guide"][21][svOrEnContent],
                                  screenWidth / 36,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                _createHeaderText(
                                    data["guide"][22][svOrEnTitle],
                                    screenWidth / 25),
                                SizedBox(
                                  height: 5,
                                ),
                                _createClickableStandardText(
                                  data["guide"][22][svOrEnContent],
                                  screenWidth / 36,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                _createHeaderText(
                                    data["guide"][23][svOrEnTitle],
                                    screenWidth / 25),
                                SizedBox(
                                  height: 5,
                                ),
                                _createClickableStandardText(
                                  data["guide"][23][svOrEnContent],
                                  screenWidth / 36,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: screenHeight,
                      width: screenWidth / 1.2,
                      child: Stack(
                        children: [
                          Positioned.fill(
                              child: Image.asset(
                            long_marble,
                            fit: BoxFit.fill,
                          )),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 40, right: 40, top: 50),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                _createHeaderText(
                                    data["guide"][24][svOrEnTitle],
                                    screenWidth / 25),
                                SizedBox(
                                  height: 5,
                                ),
                                _createClickableStandardText(
                                  data["guide"][24][svOrEnContent],
                                  screenWidth / 36,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                _createHeaderText(
                                    data["guide"][25][svOrEnTitle],
                                    screenWidth / 25),
                                SizedBox(
                                  height: 5,
                                ),
                                _createClickableStandardText(
                                  data["guide"][25][svOrEnContent],
                                  screenWidth / 36,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                _createHeaderText(
                                    data["guide"][26][svOrEnTitle],
                                    screenWidth / 25),
                                SizedBox(
                                  height: 5,
                                ),
                                _createClickableStandardText(
                                  data["guide"][26][svOrEnContent],
                                  screenWidth / 36,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                _createHeaderText(
                                    data["guide"][27][svOrEnTitle],
                                    screenWidth / 25),
                                SizedBox(
                                  height: 5,
                                ),
                                _createClickableStandardText(
                                  data["guide"][27][svOrEnContent],
                                  screenWidth / 36,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                _createHeaderText(
                                    data["guide"][28][svOrEnTitle],
                                    screenWidth / 25),
                                SizedBox(
                                  height: 5,
                                ),
                                _createClickableStandardText(
                                  data["guide"][28][svOrEnContent],
                                  screenWidth / 36,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ])))
                ]))));
  }

  Text _createHeaderText(String str, double fontSize) {
    return Text(
      textAlign: TextAlign.center,
      str,
      style: TextStyle(
          fontFamily: "MinionPro",
          fontWeight: FontWeight.w800,
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

        // final uri = Uri.parse(link.url);
        // print(uri);
        // if (await canLaunchUrl(uri)) {
        //   await launchUrl(uri, mode: LaunchMode.externalApplication);
        // } else {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //       SnackBar(content: Text('Could not open ${link.url}')));
        // }
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
