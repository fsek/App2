import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';

class VettOEtikettScreenPage extends StatefulWidget {
  @override
  _VettOEtikettScreenState createState() => _VettOEtikettScreenState();
}

class _VettOEtikettScreenState extends State<VettOEtikettScreenPage> {
  String? vettJsonString;

  void initState() {
    super.initState();
    loadVettJsonString();
  }

  Future<void> loadVettJsonString() async {
    final jsonString = await rootBundle.loadString(
        "assets/data/nollning_25/nolleguide/vettochetikett2025.json");
    setState(() {
      vettJsonString = jsonString;
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

    if (vettJsonString == null) {
      return Scaffold(
        body: CircularProgressIndicator(),
      );
    }

    Map<String, dynamic> data = jsonDecode(vettJsonString!);

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
        child: Stack(
          children: [
            Positioned.fill(child: Image.asset(background, fit: BoxFit.fill)),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Container(
                      height: screenHeight,
                      width: screenWidth / 1.2,
                      child: Stack(
                        children: [
                          Positioned.fill(
                              child:
                                  Image.asset(long_marble, fit: BoxFit.fill)),
                          Padding(
                              padding:
                                  EdgeInsets.only(left: 40, right: 40, top: 40),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  createHeaderText(
                                      data["articles"][0]["title"]
                                          [t.localeName],
                                      screenWidth / 18),
                                  SizedBox(height: 10),
                                  createSubHeaderText(
                                      data["articles"][0]["content"]
                                          [t.localeName][0]["heading"],
                                      screenWidth / 25),
                                  createStandardText(
                                      data["articles"][0]["content"]
                                          [t.localeName][0]["paragraph"],
                                      screenWidth / 34),
                                  SizedBox(height: 10),
                                  createSubHeaderText(
                                      data["articles"][0]["content"]
                                          [t.localeName][1]["heading"],
                                      screenWidth / 25),
                                  createStandardText(
                                      data["articles"][0]["content"]
                                          [t.localeName][1]["paragraph"],
                                      screenWidth / 34),
                                  SizedBox(height: 10),
                                  createSubHeaderText(
                                      data["articles"][0]["content"]
                                          [t.localeName][2]["heading"],
                                      screenWidth / 25),
                                  createStandardText(
                                      data["articles"][0]["content"]
                                          [t.localeName][2]["paragraph"],
                                      screenWidth / 34),
                                  SizedBox(height: 10),
                                  createSubHeaderText(
                                      data["articles"][0]["content"]
                                          [t.localeName][3]["heading"],
                                      screenWidth / 25),
                                  createStandardText(
                                      data["articles"][0]["content"]
                                          [t.localeName][3]["paragraph"],
                                      screenWidth / 34),
                                  SizedBox(height: 10),
                                  createSubHeaderText(
                                      data["articles"][0]["content"]
                                          [t.localeName][4]["heading"],
                                      screenWidth / 25),
                                  createStandardText(
                                      data["articles"][0]["content"]
                                          [t.localeName][4]["paragraph"],
                                      screenWidth / 34),
                                ],
                              ))
                        ],
                      ),
                    ),
                    SizedBox(height: 80),
                    Container(
                      height: screenHeight,
                      width: screenWidth / 1.2,
                      child: Stack(
                        children: [
                          Positioned.fill(
                              child:
                                  Image.asset(long_marble, fit: BoxFit.fill)),
                          Padding(
                              padding:
                                  EdgeInsets.only(left: 40, right: 40, top: 40),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                      alignment: Alignment.center,
                                      child: createHeaderText(
                                          data["articles"][1]["title"]
                                              [t.localeName],
                                          screenWidth / 18)),
                                  SizedBox(height: 10),
                                  createStandardText(
                                      data["articles"][1]["content"]
                                          [t.localeName][0]["paragraph"],
                                      screenWidth / 36),
                                  SizedBox(height: 10),
                                  createSubHeaderText(
                                      data["articles"][1]["content"]
                                          [t.localeName][1]["heading"],
                                      screenWidth / 25),
                                  createStandardText(
                                      data["articles"][1]["content"]
                                          [t.localeName][1]["paragraph"],
                                      screenWidth / 36),
                                  SizedBox(height: 10),
                                  createSubHeaderText(
                                      data["articles"][1]["content"]
                                          [t.localeName][2]["heading"],
                                      screenWidth / 25),
                                  createStandardText(
                                      data["articles"][1]["content"]
                                          [t.localeName][2]["paragraph"],
                                      screenWidth / 36),
                                  SizedBox(height: 10),
                                  createSubHeaderText(
                                      data["articles"][1]["content"]
                                          [t.localeName][3]["heading"],
                                      screenWidth / 25),
                                  createStandardText(
                                      data["articles"][1]["content"]
                                          [t.localeName][3]["paragraph"],
                                      screenWidth / 36),
                                  SizedBox(height: 10),
                                  createSubHeaderText(
                                      data["articles"][1]["content"]
                                          [t.localeName][4]["heading"],
                                      screenWidth / 25),
                                  createStandardText(
                                      data["articles"][1]["content"]
                                          [t.localeName][4]["paragraph"],
                                      screenWidth / 36),
                                ],
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  Text createHeaderText(String str, double fontSize) {
    return Text(
      textAlign: TextAlign.center,
      str,
      style: TextStyle(
          fontFamily: "MinionPro",
          fontWeight: FontWeight.w900,
          fontSize: fontSize),
    );
  }

  Text createSubHeaderText(String str, double fontSize) {
    return Text(
      textAlign: TextAlign.left,
      str,
      style: TextStyle(
          fontFamily: "MinionPro",
          fontWeight: FontWeight.w700,
          fontSize: fontSize),
    );
  }

  Text createStandardText(String str, double fontSize) {
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
