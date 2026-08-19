import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';


class KladguidePage extends StatefulWidget {
  @override
  _KladguideScreenState createState() => _KladguideScreenState();
}

class _KladguideScreenState extends State<KladguidePage> {
  String? kladguideJsonString;


  void initState() {
    super.initState();
    loadKladguideJsonString();
  }


  Future<void> loadKladguideJsonString() async {
     final jsonString = await rootBundle.loadString("assets/data/nollning_25/nolleguide/kladguide/kladguide2025.json");
     setState(() {
       kladguideJsonString = jsonString;
     });
  }

  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    String rubrikPath = "assets/data/nollning_25/nolleguide/rubrik.png";
    String hyllaPath = "assets/data/nollning_25/nolleguide/hylla.png";
    String plattaPath = "assets/data/nollning_25/nolleguide/kladguide/platta.png";
    String toga = "assets/data/nollning_25/nolleguide/kladguide/toga.png";
    String kostym = "assets/data/nollning_25/nolleguide/kladguide/kostym.png";
    String medalj = "assets/data/nollning_25/nolleguide/kladguide/medalj.png";
    String hogtid = "assets/data/nollning_25/nolleguide/kladguide/hogtid.png";
    String mossa = "assets/data/nollning_25/nolleguide/kladguide/mossa.png";
    String uddakavaj = "assets/data/nollning_25/nolleguide/kladguide/uddakavaj.png";
    String ovve = "assets/data/nollning_25/nolleguide/kladguide/ovve.png";
    String backgroundPath = "assets/data/nollning_25/nolleguide/bakgrund.png";

    if(kladguideJsonString == null) {
      return Scaffold(
        body: CircularProgressIndicator(),
      );
    }

    final Map<String, dynamic> data = jsonDecode(kladguideJsonString!);


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
                    Image.asset(rubrikPath, fit: BoxFit.contain),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20, left: 40, right: 40),
                          child: Center(
                          child: Text(
                            data["articles"][0]["title"][t.localeName],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: screenWidth/22,
                              color: Color(0xFFd4d3d6),
                              fontFamily: "MinionPro",
                              fontWeight: FontWeight.bold
                            ),
                          )
                        )),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Center(
                            child: Text(
                              t.kladGuideProcessionFeature,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "MinionPro",
                                fontWeight: FontWeight.normal,
                                fontSize: screenWidth/28,
                                color: Color(0xFFd4d3d6)
                              ),
                          ))),
                          Container(
                            height: screenHeight,
                            width: screenWidth,
                            child: Stack(
                              children: [
                                Positioned.fill(child: Image.asset(backgroundPath, fit: BoxFit.fill)),
                                Center(
                                  child: Image.asset(hyllaPath, fit: BoxFit.fill),
                                ),
                                Row(
                                  children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                    padding: EdgeInsets.only(left: screenWidth/15, bottom: screenHeight/2.5),
                                      child: Container(
                                        height: screenHeight/2.6,
                                        width: screenWidth/2,
                                          child: Stack(
                                            children: [
                                              Positioned.fill(child: Image.asset(plattaPath, fit: BoxFit.fill)),
                                              Padding(
                                            padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  textAlign: TextAlign.left,
                                                  data["articles"][0]["content"][t.localeName],
                                                  style: TextStyle(
                                                    fontFamily: "MinionPro",
                                                    fontWeight: FontWeight.normal,
                                                    fontSize: screenWidth/45,
                                                    height: 1.2,
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                                Text(
                                                  textAlign: TextAlign.left,
                                                  data["articles"][0]["sections"][0]["title"][t.localeName],
                                                  style: TextStyle(
                                                    fontFamily: "MinionPro",
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: screenWidth/22,
                                                    color: const Color.fromARGB(255, 83, 81, 81)
                                                )
                                              ),
                                              Text(
                                                  textAlign: TextAlign.left,
                                                  data["articles"][0]["sections"][0]["subsections"][1]["title"][t.localeName],
                                                  style: TextStyle(
                                                    fontFamily: "MinionPro",
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: screenWidth/30,
                                                    color: const Color.fromARGB(255, 83, 81, 81)
                                                  ),
                                                ),
                                              Text(
                                                  textAlign: TextAlign.left,
                                                  data["articles"][0]["sections"][0]["subsections"][1]["content"][t.localeName],
                                                  style: TextStyle(
                                                    fontFamily: "MinionPro",
                                                    fontWeight: FontWeight.normal,
                                                    fontSize: screenWidth/45,
                                                    height: 1.2
                                              ),
                                            )
                                          ]))
                                            ],
                                        ),
                                  ))),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 0, bottom: screenHeight/2.7),
                                      child: Container(
                                        height: screenHeight/2.7,
                                        width: screenWidth/2.7,
                                        child: Image.asset(hogtid, fit: BoxFit.cover,),
                                      )),
                                  )
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                    child: Padding(
                                    padding: EdgeInsets.only(right: screenWidth/15, bottom: screenHeight/25),
                                    child: Container(
                                      height: screenHeight/2.6,
                                      width: screenWidth/2,
                                      child: Stack(
                                        children: [
                                          Positioned.fill(child: Image.asset(plattaPath, fit: BoxFit.fill)),
                                          Padding(
                                            padding: EdgeInsets.only(left: 30, right: 30, top: 15),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  textAlign: TextAlign.left,
                                                  data["articles"][0]["sections"][0]["subsections"][0]["title"][t.localeName],
                                                  style: TextStyle(
                                                    fontFamily: "MinionPro",
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: screenWidth/28,
                                                    color: const Color.fromARGB(255, 83, 81, 81)
                                                  ),
                                                ),
                                                Text(
                                                  textAlign: TextAlign.left,
                                                  data["articles"][0]["sections"][0]["subsections"][0]["content"][t.localeName],
                                                  style: TextStyle(
                                                    fontFamily: "MinionPro",
                                                    fontWeight: FontWeight.normal,
                                                    fontSize: screenWidth/45,
                                                    height: 1.2
                                                )
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                  textAlign: TextAlign.left,
                                                  data["articles"][0]["sections"][0]["subsections"][2]["title"][t.localeName],
                                                  style: TextStyle(
                                                    fontFamily: "MinionPro",
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: screenWidth/28,
                                                    color: const Color.fromARGB(255, 83, 81, 81)
                                                  ),
                                                ),
                                              Text(
                                                  textAlign: TextAlign.left,
                                                  data["articles"][0]["sections"][0]["subsections"][2]["content"][t.localeName],
                                                  style: TextStyle(
                                                    fontFamily: "MinionPro",
                                                    fontWeight: FontWeight.normal,
                                                    fontSize: screenWidth/45,
                                                    height: 1.2
                                              ),
                                            )
                                          ]))
                                        ],
                                  ),
                                ))),
                              ],
                            ),
                          ),
                          Container(
                            height: screenHeight,
                            width: screenWidth,
                            child: Stack(
                              children: [
                                Positioned.fill(child: Image.asset(backgroundPath, fit: BoxFit.fill)),
                                Center(
                                  child: Image.asset(hyllaPath, fit: BoxFit.fill),
                                ),
                                Row(
                                  children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                    padding: EdgeInsets.only(left: screenWidth/15, bottom: screenHeight/2.5),
                                      child: Container(
                                        height: screenHeight/2.6,
                                        width: screenWidth/2,
                                          child: Stack(
                                            children: [
                                              Positioned.fill(child: Image.asset(plattaPath, fit: BoxFit.fill)),
                                              Padding(
                                            padding: EdgeInsets.only(left: 30, right: 30, top: 15),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  textAlign: TextAlign.left,
                                                  data["articles"][0]["sections"][1]["mainTitle"][t.localeName],
                                                  style: TextStyle(
                                                    fontFamily: "MinionPro",
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: screenWidth/22,
                                                    color: const Color.fromARGB(255, 83, 81, 81)
                                                )
                                              ),
                                              Text(
                                                  textAlign: TextAlign.left,
                                                  data["articles"][0]["sections"][1]["title1"][t.localeName],
                                                  style: TextStyle(
                                                    fontFamily: "MinionPro",
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: screenWidth/28,
                                                    color: const Color.fromARGB(255, 83, 81, 81)
                                                  ),
                                                ),
                                                Text(
                                                  textAlign: TextAlign.left,
                                                  data["articles"][0]["sections"][1]["content1"][t.localeName],
                                                  style: TextStyle(
                                                    fontFamily: "MinionPro",
                                                    fontWeight: FontWeight.normal,
                                                    fontSize: screenWidth/45,
                                                    height: 1.2
                                                ),
                                              ),
                                              SizedBox(height: 10,),
                                              Text(
                                                  textAlign: TextAlign.left,
                                                  data["articles"][0]["sections"][1]["title2"][t.localeName],
                                                  style: TextStyle(
                                                    fontFamily: "MinionPro",
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: screenWidth/28,
                                                    color: const Color.fromARGB(255, 83, 81, 81)
                                                  ),
                                                ),
                                              Text(
                                                  textAlign: TextAlign.left,
                                                  data["articles"][0]["sections"][1]["content2"][t.localeName],
                                                  style: TextStyle(
                                                    fontFamily: "MinionPro",
                                                    fontWeight: FontWeight.normal,
                                                    fontSize: screenWidth/45,
                                                    height: 1.2
                                              ),
                                            )
                                          ]))
                                            ],
                                        ),
                                  ))),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 0, bottom: screenHeight/2.7),
                                      child: Container(
                                        height: screenHeight/2.7,
                                        width: screenWidth/2.7,
                                        child: Image.asset(kostym, fit: BoxFit.cover,),
                                      )),
                                  )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 0, bottom: screenHeight/30),
                                      child: Container(
                                        height: screenHeight/2.7,
                                        width: screenWidth/2.7,
                                        child: Image.asset(uddakavaj, fit: BoxFit.cover,),
                                      )),
                                  ),
                                  Align(
                                  alignment: Alignment.bottomLeft,
                                    child: Padding(
                                    padding: EdgeInsets.only(right: screenWidth/15, bottom: screenHeight/25),
                                    child: Container(
                                      height: screenHeight/2.6,
                                      width: screenWidth/2,
                                      child: Stack(
                                        children: [
                                          Positioned.fill(child: Image.asset(plattaPath, fit: BoxFit.fill)),
                                          Padding(
                                            padding: EdgeInsets.only(left: 30, right: 30, top: 15),
                                            child: Column(
                                              // mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  textAlign: TextAlign.left,
                                                  data["articles"][0]["sections"][2]["title"][t.localeName],
                                                  style: TextStyle(
                                                    fontFamily: "MinionPro",
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: screenWidth/22,
                                                    color: const Color.fromARGB(255, 83, 81, 81)
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  textAlign: TextAlign.left,
                                                  data["articles"][0]["sections"][2]["content"][t.localeName],
                                                  style: TextStyle(
                                                    fontFamily: "MinionPro",
                                                    fontWeight: FontWeight.normal,
                                                    fontSize: screenWidth/45,
                                                    height: 1.2
                                                )
                                              ),
                                          ]))
                                        ],
                                  ),
                                ))),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: screenHeight,
                            width: screenWidth,
                            child: Stack(
                              children: [
                                Positioned.fill(child: Image.asset(backgroundPath, fit: BoxFit.fill)),
                                Center(
                                  child: Image.asset(hyllaPath, fit: BoxFit.fill),
                                ),
                                Row(
                                  children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                    padding: EdgeInsets.only(left: screenWidth/15, bottom: screenHeight/2.5),
                                      child: Container(
                                        height: screenHeight/2.6,
                                        width: screenWidth/2,
                                          child: Stack(
                                            children: [
                                              Positioned.fill(child: Image.asset(plattaPath, fit: BoxFit.fill)),
                                              Padding(
                                            padding: EdgeInsets.only(left: 30, right: 30, top: 15),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  textAlign: TextAlign.left,
                                                  data["articles"][0]["sections"][3]["title"][t.localeName],
                                                  style: TextStyle(
                                                    fontFamily: "MinionPro",
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: screenWidth/22,
                                                    color: const Color.fromARGB(255, 83, 81, 81)
                                                )
                                              ),
                                              SizedBox(height: 5),
                                                Text(
                                                  textAlign: TextAlign.left,
                                                  data["articles"][0]["sections"][3]["content"][t.localeName],
                                                  style: TextStyle(
                                                    fontFamily: "MinionPro",
                                                    fontWeight: FontWeight.normal,
                                                    fontSize: screenWidth/45,
                                                    height: 1.2
                                                ),
                                              ),
                                              SizedBox(height: 20),
                                              Text(
                                                  textAlign: TextAlign.left,
                                                  data["articles"][0]["sections"][4]["title"][t.localeName],
                                                  style: TextStyle(
                                                    fontFamily: "MinionPro",
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: screenWidth/28,
                                                    color: const Color.fromARGB(255, 83, 81, 81)
                                                  ),
                                                ),
                                              Text(
                                                  textAlign: TextAlign.left,
                                                  data["articles"][0]["sections"][4]["content"][t.localeName],
                                                  style: TextStyle(
                                                    fontFamily: "MinionPro",
                                                    fontWeight: FontWeight.normal,
                                                    fontSize: screenWidth/45,
                                                    height: 1.2
                                              ),
                                            )
                                          ]))
                                            ],
                                        ),
                                  ))),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 0, bottom: screenHeight/2.7),
                                      child: Container(
                                        height: screenHeight/2.7,
                                        width: screenWidth/2.7,
                                        child: Image.asset(ovve, fit: BoxFit.cover,),
                                      )),
                                  )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 0, bottom: screenHeight/30),
                                      child: Container(
                                        height: screenHeight/2.7,
                                        width: screenWidth/2.7,
                                        child: Image.asset(toga, fit: BoxFit.cover,),
                                      )),
                                  ),
                                  Align(
                                  alignment: Alignment.bottomLeft,
                                    child: Padding(
                                    padding: EdgeInsets.only(right: screenWidth/15, bottom: screenHeight/25),
                                    child: Container(
                                      height: screenHeight/2.6,
                                      width: screenWidth/2,
                                      child: Stack(
                                        children: [
                                          Positioned.fill(child: Image.asset(plattaPath, fit: BoxFit.fill)),
                                          Padding(
                                            padding: EdgeInsets.only(left: 30, right: 30, top: 15),
                                            child: Column(
                                              // mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  textAlign: TextAlign.left,
                                                  data["articles"][0]["sections"][8]["title"][t.localeName],
                                                  style: TextStyle(
                                                    fontFamily: "MinionPro",
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: screenWidth/22,
                                                    color: const Color.fromARGB(255, 83, 81, 81)
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                                Text(
                                                  textAlign: TextAlign.left,
                                                  data["articles"][0]["sections"][8]["content"][t.localeName],
                                                  style: TextStyle(
                                                    fontFamily: "MinionPro",
                                                    fontWeight: FontWeight.normal,
                                                    fontSize: screenWidth/50,
                                                    height: 1.2
                                                )
                                              ),
                                          ]))
                                        ],
                                  ),
                                ))),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: screenHeight,
                            width: screenWidth,
                            child: Stack(
                              children: [
                                Positioned.fill(child: Image.asset(backgroundPath, fit: BoxFit.fill)),
                                Center(
                                  child: Image.asset(hyllaPath, fit: BoxFit.fill),
                                ),
                                Row(
                                  children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                    padding: EdgeInsets.only(left: screenWidth/15, bottom: screenHeight/2.5),
                                      child: Container(
                                        height: screenHeight/2.6,
                                        width: screenWidth/2,
                                          child: Stack(
                                            children: [
                                              Positioned.fill(child: Image.asset(plattaPath, fit: BoxFit.fill)),
                                              Padding(
                                            padding: EdgeInsets.only(left: 30, right: 30, top: 15),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  textAlign: TextAlign.left,
                                                  data["articles"][0]["sections"][5]["title"][t.localeName],
                                                  style: TextStyle(
                                                    fontFamily: "MinionPro",
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: screenWidth/22,
                                                    color: const Color.fromARGB(255, 83, 81, 81)
                                                )
                                              ),
                                              Text(
                                                  textAlign: TextAlign.left,
                                                  data["articles"][0]["sections"][5]["subtitle"][t.localeName],
                                                  style: TextStyle(
                                                    fontFamily: "MinionPro",
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: screenWidth/28,
                                                    color: const Color.fromARGB(255, 83, 81, 81)
                                                  ),
                                                ),
                                                Text(
                                                  textAlign: TextAlign.left,
                                                  data["articles"][0]["sections"][5]["content"][t.localeName],
                                                  style: TextStyle(
                                                    fontFamily: "MinionPro",
                                                    fontWeight: FontWeight.normal,
                                                    fontSize: screenWidth/50,
                                                    height: 1.2
                                                ),
                                              ),
                                              SizedBox(height: 10,),
                                              Text(
                                                  textAlign: TextAlign.left,
                                                  data["articles"][0]["sections"][6]["title"][t.localeName],
                                                  style: TextStyle(
                                                    fontFamily: "MinionPro",
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: screenWidth/28,
                                                    color: const Color.fromARGB(255, 83, 81, 81)
                                                  ),
                                                ),
                                              Text(
                                                  textAlign: TextAlign.left,
                                                  data["articles"][0]["sections"][6]["content"][t.localeName],
                                                  style: TextStyle(
                                                    fontFamily: "MinionPro",
                                                    fontWeight: FontWeight.normal,
                                                    fontSize: screenWidth/50,
                                                    height: 1.2
                                              ),
                                            )
                                          ]))
                                            ],
                                        ),
                                  ))),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 0, bottom: screenHeight/2.7),
                                      child: Container(
                                        height: screenHeight/2.7,
                                        width: screenWidth/2.7,
                                        child: Image.asset(mossa, fit: BoxFit.fill,),
                                      )),
                                  )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 0, bottom: screenHeight/30),
                                      child: Container(
                                        height: screenHeight/2.7,
                                        width: screenWidth/2.7,
                                        child: Image.asset(medalj, fit: BoxFit.cover,),
                                      )),
                                  ),
                                  Align(
                                  alignment: Alignment.bottomLeft,
                                    child: Padding(
                                    padding: EdgeInsets.only(right: screenWidth/15, bottom: screenHeight/25),
                                    child: Container(
                                      height: screenHeight/2.6,
                                      width: screenWidth/2,
                                      child: Stack(
                                        children: [
                                          Positioned.fill(child: Image.asset(plattaPath, fit: BoxFit.fill)),
                                          Padding(
                                            padding: EdgeInsets.only(left: 30, right: 30, top: 15),
                                            child: Column(
                                              // mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  textAlign: TextAlign.left,
                                                  data["articles"][0]["sections"][7]["title"][t.localeName],
                                                  style: TextStyle(
                                                    fontFamily: "MinionPro",
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: screenWidth/28,
                                                    color: const Color.fromARGB(255, 83, 81, 81)
                                                  ),
                                                ),
                                                Text(
                                                  textAlign: TextAlign.left,
                                                  data["articles"][0]["sections"][7]["content"][t.localeName],
                                                  style: TextStyle(
                                                    fontFamily: "MinionPro",
                                                    fontWeight: FontWeight.normal,
                                                    fontSize: screenWidth/45,
                                                    height: 1.2
                                                )
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                  textAlign: TextAlign.left,
                                                  data["articles"][0]["sections"][9]["title"][t.localeName],
                                                  style: TextStyle(
                                                    fontFamily: "MinionPro",
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: screenWidth/28,
                                                    color: const Color.fromARGB(255, 83, 81, 81)
                                                  ),
                                                ),
                                                Text(
                                                  textAlign: TextAlign.left,
                                                  data["articles"][0]["sections"][9]["content"][t.localeName],
                                                  style: TextStyle(
                                                    fontFamily: "MinionPro",
                                                    fontWeight: FontWeight.normal,
                                                    fontSize: screenWidth/45,
                                                    height: 1.2
                                                )
                                              ),
                                          ]))
                                        ],
                                  ),
                                ))),
                                  ],
                                )
                              ],
                            ),
                          ),
                      ],
                      )
                    
                  ],
                ),
            ],
          )
        )),
    );
  }
}