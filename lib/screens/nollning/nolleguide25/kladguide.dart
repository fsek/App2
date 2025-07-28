import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: screenWidth/15, bottom: screenHeight/2.5),
                                      child: Container(
                                        height: screenHeight/2.6,
                                        width: screenWidth/1.7,
                                          child: Stack(
                                            children: [
                                              Positioned.fill(child: Image.asset(plattaPath, fit: BoxFit.fill))
                                            ],
                                        ),
                                  ))),
                                Align(
                                  alignment: Alignment.bottomRight,
                                    child: Padding(
                                    padding: EdgeInsets.only(right: screenWidth/15, bottom: screenHeight/25),
                                    child: Container(
                                      height: screenHeight/2.6,
                                      width: screenWidth/1.7,
                                      child: Stack(
                                        children: [
                                          Positioned.fill(child: Image.asset(plattaPath, fit: BoxFit.fill)),
                                          Padding(
                                            padding: EdgeInsets.only(left: 0, top: 0), 
                                            child: Text(
                                              textAlign: TextAlign.center,
                                              data["articles"][0]["sections"][0]["title"][t.localeName],
                                              style: TextStyle(
                                                fontFamily: "MinionPro",
                                                fontWeight: FontWeight.normal,
                                                fontSize: screenWidth/10
                                              ),
                                            ))
                                        ],
                                  ),
                                ))),
                              ],
                            ),
                          )
                      ],
                      )
                    
                  ],
                ),
            ],
          )
        )),
      
    );

    // return Scaffold(
    //   extendBodyBehindAppBar: true,
    //   appBar: AppBar(
    //     backgroundColor: Colors.transparent,
    //     elevation: 0.0,
    //     scrolledUnderElevation: 0.0,
    //   ),
    //   body: InteractiveViewer(
    //     panEnabled: true,
    //     child: SingleChildScrollView(
    //       child: Column(
    //         children: [
    //           Container(
    //             height: 30,
    //             width: screenWidth,
    //             color: Color(0xFF808181),
    //           ),
    //           Stack(
    //               children: [
    //                 Image.asset(rubrikPath, fit: BoxFit.contain),
    //                 Column(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     Padding(
    //                       padding: EdgeInsets.only(top: 20, left: 40, right: 40),
    //                       child: Center(
    //                       child: Text(
    //                         data["articles"][0]["title"][t.localeName],
    //                         textAlign: TextAlign.center,
    //                         style: TextStyle(
    //                           fontSize: screenWidth/22,
    //                           color: Color(0xFFd4d3d6),
    //                           fontFamily: "MinionPro",
    //                           fontWeight: FontWeight.bold
    //                         ),
    //                       )
    //                     )),
    //                     Padding(
    //                       padding: EdgeInsets.only(bottom: 10),
    //                       child: Center(
    //                         child: Text(
    //                           t.kladGuideProcessionFeature,
    //                           textAlign: TextAlign.center,
    //                           style: TextStyle(
    //                             fontFamily: "MinionPro",
    //                             fontWeight: FontWeight.normal,
    //                             fontSize: screenWidth/28,
    //                             color: Color(0xFFd4d3d6)
    //                           ),
    //                       )))
    //                   ],
    //                   )
                    
    //               ],
    //             ),
    //             Container(
    //               width: screenWidth,
    //               height: screenHeight ,
    //               child: Stack(
    //                 children: [
    //                   Positioned.fill(child: Image.asset(backgroundPath, fit: BoxFit.fill)),
    //                   Column(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       Container(
    //                         height: screenHeight/15,
    //                       ),
    //                       Padding (
    //                         padding: EdgeInsets.only(bottom: 0, right: screenWidth/3.5),
    //                         child: Container(
    //                           height: screenHeight/2.6,
    //                           width: screenWidth/1.7,
    //                           child: Stack(
    //                             children: [
    //                               Positioned.fill(child: Image.asset(plattaPath, fit: BoxFit.fill)),
    //                               Padding(
    //                                 padding: EdgeInsets.only(top: 20, left: 35, right: 35),
    //                                 child: Text(
    //                                   data["articles"][0]["content"][t.localeName],
    //                                   style: TextStyle(
    //                                     fontFamily: "MinionPro",
    //                                     fontWeight: FontWeight.normal,
    //                                     fontSize: screenWidth/40
    //                                   ),
    //                                 ),
    //                                 ),
    //                             ])
    //                         )),
    //                       Center(
    //                         child: Image.asset(hyllaPath, fit: BoxFit.contain),
    //                       ),
    //                       Container(
    //                         height: screenHeight/20,
    //                       ),
    //                       Padding (
    //                         padding: EdgeInsets.only(bottom: 0, left: screenWidth/3.5),
    //                         child: Container(
    //                           height: screenHeight/2.6,
    //                           width: screenWidth/1.7,
    //                           child: Stack(
    //                             children: [
    //                               Positioned.fill(child: Image.asset(plattaPath, fit: BoxFit.fill)),
    //                               Padding(
    //                                 padding: EdgeInsets.all(20),
    //                                 child: Text(
    //                                   ""
    //                               ))
    //                             ]
    //                           )
    //                         )),
    //                     ],
    //                   )
    //                 ],
    //               ),
    //             )
    //         ],
    //       )
    //     )),
      
    // );
  }

}