import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class KladguidePage extends StatefulWidget {
  @override
  _KladguideScreenState createState() => _KladguideScreenState();
}


class _KladguideScreenState extends State<KladguidePage> {
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){

    var t =  AppLocalizations.of(context)!;

    String backgroundPaperPath = "assets/img/nollning-24/nolleguide/nolleguide_paper.png";
    String backgroundWoodPath = "assets/img/nollning-24/nolleguide/wood_background.png";
    String i1 = "assets/img/nollning-24/nolleguide/kladguide/IMG_0105.jpg";
    String i2 = "assets/img/nollning-24/nolleguide/kladguide/IMG_0159.jpg";
    String i3 = "assets/img/nollning-24/nolleguide/kladguide/IMG_0165.jpg";
    String i4 = "assets/img/nollning-24/nolleguide/kladguide/IMG_0171.jpg";
    String i5 = "assets/img/nollning-24/nolleguide/kladguide/IMG_0094.jpg";
    String i6 = "assets/img/nollning-24/nolleguide/kladguide/IMG_0090.jpg";
    String i7 = "assets/img/nollning-24/nolleguide/kladguide/IMG_0142.jpg";
    String i8 = "assets/img/nollning-24/nolleguide/kladguide/IMG_0134.jpg";
    String i9 = "assets/img/nollning-24/nolleguide/kladguide/IMG_0131.jpg";
    String i10 = "assets/img/nollning-24/nolleguide/kladguide/IMG_0120.jpg";
    String i11 = "assets/img/nollning-24/nolleguide/kladguide/IMG_0149.jpg";

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
      ),
      body: InteractiveViewer(
        panEnabled: true,
      child: 
      SingleChildScrollView(
        child: Stack(children: [
          Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Image.asset(backgroundWoodPath),
                  Image.asset(backgroundPaperPath),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 85),
                        child: 
                           Text(
                            t.kladguideTopTitle,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Testament",
                              fontSize: screenWidth/28,
                              color: Color(0xFF540909)
                            ),
                        )),
                      Container(
                        margin: EdgeInsets.only(left: 130),
                        child: Text(
                            t.kladGuideProcessionFeature,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: screenWidth/31,
                              color: Color(0xFF540909)
                            ),
                          )
                        ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.only(left: 50, right: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Text(
                                t.kladGuideIntro,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic,
                                  fontSize: screenWidth/31,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                t.kladGuideWhiteTieFullDress,
                                style: TextStyle(
                                  fontFamily: "Testament",
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF540909),
                                  fontSize: screenWidth/25,
                              )),
                              SizedBox(height: 5),
                              Text(
                                t.tailcoat,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: screenWidth/27,
                                  color: Color(0xFF540909),
                              )),
                              Text(
                                t.tailcoatContent,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: screenWidth/31,
                                )
                              ),
                              SizedBox(height: 50,),
                              Text(
                                t.fulldress,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: screenWidth/27,
                                  color: Color(0xFF540909),
                                  )),
                              SizedBox(
                                width: screenWidth,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        t.fulldressContent,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: screenWidth/31,
                                        ),
                                      ) 
                                    ),
                                    SizedBox(width: 10,),
                                    Expanded(child: Image.asset(i1))
                                  ]
                                )
                              ),
                              SizedBox(height: 50),
                              Text(
                                t.accessories,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: screenWidth/27,
                                  color: Color(0xFF540909),
                                  )
                              ),
                              Text(
                                t.accessoriesContent,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: screenWidth/31,
                                ),
                              )
                        ])),
                    ],
                  )
                ],
              )
            ),
            Container(
              child: Stack(
                children: [
                  Image.asset(backgroundWoodPath),
                  Image.asset(backgroundPaperPath),
                  Container(
                    margin: EdgeInsets.only(top: 100, left: 50, right: 50),
                    child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            t.formal,
                            style: TextStyle(
                              fontFamily: "Testament",
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF540909),
                              fontSize: screenWidth/25,
                        )
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Text(
                                t.dressSkirt,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF540909),
                                  fontSize: screenWidth/27,
                              )),
                              Text(
                                t.dressSkirtContent,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: screenWidth/35,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                t.suit,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF540909),
                                  fontSize: screenWidth/27,
                              )),
                              Text(
                                t.suitContent,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: screenWidth/34,
                                )),
                          ],)),
                          SizedBox(width: 10),
                          Expanded(child: 
                            Image.asset(i2)
                          )
                        ],
                      ),
                      SizedBox(height: 50),
                      Text(
                        t.smartCasual,
                        style: TextStyle(
                            fontFamily: "Testament",
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF540909),
                            fontSize: screenWidth/25,
                            )
                          ),
                      SizedBox(height: 10),
                      Text(
                        t.smartCasualIntro,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth/34,
                          )
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(child: Image.asset(i3)),
                          SizedBox(width: 10),
                          Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                t.smartCasualContent,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: screenWidth/34,
                                )
                              ),
                              SizedBox(height: 100)
                            ],
                          ))
                        ],
                      )
                    ],
                  ))
                ],
              )
            ),
            Container(
              child: Stack(
                children: [
                  Image.asset(backgroundWoodPath),
                  Image.asset(backgroundPaperPath),
                  Container(
                    margin: EdgeInsets.only(top: 100, left: 50, right: 50),
                    child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ovve",
                                  style: TextStyle(
                                    fontFamily: "Testament",
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF540909),
                                    fontSize: screenWidth/28,
                                    )
                                ),
                                SizedBox(height: 5),
                                Text(
                                  t.ovveContent,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: screenWidth/34,
                                    )
                                ),
                                SizedBox(height: 20),
                                Text(
                                  t.ovveThematically,
                                  style: TextStyle(
                                    fontFamily: "Testament",
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF540909),
                                    fontSize: screenWidth/28,
                                  )
                                ),
                                SizedBox(height: 5),
                                Text(
                                  t.ovveThematicallyContent,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: screenWidth/34,
                                    )
                                ),
                            ]
                          )),
                          SizedBox(width: 10),
                          Expanded(child: 
                            Image.asset(i4)
                          )
                        ],
                      ),
                      SizedBox(height: 100),
                      Text(
                        t.technologistCap,
                        style: TextStyle(
                          fontFamily: "Testament",
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF540909),
                          fontSize: screenWidth/25,
                        )
                      ),
                      SizedBox(height: 10),
                      Text(
                        t.whiteAndBlue,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF540909),
                          fontSize: screenWidth/27,
                        )
                      ),
                      SizedBox(height: 5),
                      Text(
                        t.technologistCapContent,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth/34,
                        )
                      ),
                      SizedBox(height: 20,),
                      Row(children: [
                        Expanded(child: Image.asset(i5)),
                        SizedBox(width: 10),
                        Expanded(child: Image.asset(i6)),
                        ])
                    ]))
                ],
              )
            ),
            Container(
              child: Stack(
                children: [
                  Image.asset(backgroundWoodPath),
                  Image.asset(backgroundPaperPath),
                  Container(
                    margin: EdgeInsets.only(top: 100, left: 50, right: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            t.tassel,
                            style: TextStyle(
                              fontFamily: "Testament",
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF540909),
                              fontSize: screenWidth/25,
                            )
                          )
                        ),
                        SizedBox(height: 10),
                        Text(
                          t.tasselIntro,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: screenWidth/32,
                          )
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(child: Image.asset(i7)),
                            SizedBox(width: 8),
                            Expanded(child: Image.asset(i8)),
                            SizedBox(width: 8),
                            Expanded(child: Image.asset(i9)),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          t.tasselColors,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: screenWidth/32,
                          )
                        ),
                        SizedBox(height: 60),
                        Center(
                          child: Text(
                            t.medalsAndBadges,
                            style: TextStyle(
                              fontFamily: "Testament",
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF540909),
                              fontSize: screenWidth/25,
                            )
                          )
                        ),
                        SizedBox(height: 10),
                        Text(
                          t.medalsAndBadgesIntro,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: screenWidth/32,
                          )
                        ),
                        SizedBox(height: 10),
                        Row(children: [
                          Expanded(child: Image.asset(i10)),
                          SizedBox(width: 10),
                          Expanded(child: Image.asset(i11)),
                        ],),
                        SizedBox(height: 10),
                        Text(
                          t.medalsAndBadgesEnd,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: screenWidth/32,
                          )
                        ),
                        SizedBox(height: 20),
                        Center(
                          child:
                            Text(
                              "The end",
                              style: TextStyle(
                                fontFamily: "Testament",
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF540909),
                                fontSize: screenWidth/25,
                              )
                          )
                        ),
                        Center(
                          child:
                            Text(
                              t.kladguideModels,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF540909),
                                fontSize: screenWidth/32,
                              )
                          )
                        )
                      ],
                    )
                  )
                ],
              )
            ),
          ],
        )
      ]))
    ));
  }
}