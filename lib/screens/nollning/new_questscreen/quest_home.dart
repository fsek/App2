import 'package:flutter/material.dart';
import 'package:fsek_mobile/api_client/lib/api_client.dart';
import 'package:fsek_mobile/screens/nollning/adventure_missions_tab_new.dart';
import 'package:fsek_mobile/screens/nollning/highscore_tab_new.dart';
import 'package:fsek_mobile/screens/nollning/new_questscreen/quests.dart';
import 'package:fsek_mobile/screens/nollning/questscreen/quests.dart';
import 'package:fsek_mobile/services/api.service.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fsek_mobile/models/home/calendarevent.dart';
import 'package:fsek_mobile/services/event.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/screens/event/event.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class QuestHomeScreen extends StatefulWidget {
  @override
  _QuestHomeScreenState createState() => _QuestHomeScreenState();
}

class _QuestHomeScreenState extends State<QuestHomeScreen> {


  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    String rubrik = "assets/data/nollning_25/uppdrag/rubrik.png";
    String bakgrund = "assets/data/nollning_25/uppdrag/bakgrund.png";
    String pelare_left = "assets/data/nollning_25/uppdrag/halvpelare_left.png";
    String pelare_right = "assets/data/nollning_25/uppdrag/halvpelare_right.png";

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          scrolledUnderElevation: 0.0,
          centerTitle: true,
          title: Text(
            t.missions,
            style: TextStyle(
              fontFamily: "MinionPro",
              fontWeight: FontWeight.normal,
              fontSize: screenWidth / 10,
              color: const Color.fromARGB(255, 83, 81, 81),
              letterSpacing: 3
            ),
          ),
        ),
        body: Container(
          height: screenHeight,
          width: screenWidth,
          child: Stack(
            children: [
              Positioned.fill(child: Image.asset(bakgrund, fit: BoxFit.fill)),
              Column(
                children: [
                  Container(
                    width: screenWidth,
                    height: screenHeight/7,
                    child: Image.asset(rubrik, fit: BoxFit.fill),
                  ),
                  Container(
                    width: screenWidth,
                    height: screenHeight / 15,
                    child: Stack(
                      children: [
                        Positioned.fill(child: Image.asset(rubrik, fit: BoxFit.fill,)),
                        TabBar(
                          padding: EdgeInsets.only(top: 2),
                          indicatorColor: Color.fromARGB(255, 160, 120, 18),
                          labelColor: Color.fromARGB(255, 160, 120, 18),
                          unselectedLabelColor: const Color.fromARGB(255, 83, 81, 81),
                          tabs: [
                        //  Tab(
                          //  text: t.introductionMissions,
                          //   icon: Icon(Icons.flag_rounded),
                        // ),
                            Tab(
                              text: t.introductionMyGroup,
                              icon: Icon(Icons.group_rounded),
                            ),
                            Tab(
                              text: 'HIGHSCORE',
                              icon: Icon(Icons.emoji_events_rounded),
                            )
                          ]
                          ),
                      ],
                    )
                  ),
                  Container(
                    width: screenWidth - (screenWidth/5),
                    height: screenHeight - (screenHeight / 7) - (screenHeight / 15) - 20,
                    child: TabBarView(
                      children: [
                        QuestScreen(
                          availableHeight: screenHeight - (screenHeight / 7) - (screenHeight / 15) - 20, 
                          availableWidth: screenWidth - (screenWidth/8)),
                        Placeholder()
                      ]
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: screenWidth/6.5,
                  height: screenHeight,
                  child: Image.asset(pelare_left, fit: BoxFit.fitHeight),
                )
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: screenWidth/6.5,
                  height: screenHeight,
                  child: Image.asset(pelare_right, fit: BoxFit.fitHeight),
                )
              )
            ],
          )
        ),
      ),
    );
  }

}



// Column(
//             children: [
//               Image.asset(rubrik, fit: BoxFit.fitWidth,),
//               TabBar(
//                 tabs: [
//                   // Tab(
//                   //   text: t.introductionMissions,
//                   //   icon: Icon(Icons.flag_rounded),
//                   // ),
//                   Tab(
//                     text: t.introductionMyGroup,
//                     icon: Icon(Icons.group_rounded),
//                   ),
//                   Tab(
//                     text: 'HIGHSCORE',
//                     icon: Icon(Icons.emoji_events_rounded),
//                   )
//                 ]
//               )
//             ],
//           ),



// TabBarView(children: [
//           // AdventureMissionsTabNew(),
//           QuestScreen(),
//           HighscoreTab(),
//         ]),



// appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           centerTitle: true,
//           title: Text(
//             t.introductionAdventureMissions,
//             style: TextStyle(
//               fontFamily: 'Testament',
//               fontSize:
//                   //MediaQuery.of(context).size.width / 20,
//                   (t.localeName == "sv" ? 28.0 : 26),
//               fontWeight: FontWeight.normal,
//               color: Color(0xFFE9CA97),
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),



// flexibleSpace: Container(
//             width: screenWidth,
//             child: Column(
//               children: [
//                 Container(
//                   height: 20,
//                   width: screenWidth,
//                 ),
//                 Image.asset(rubrik, fit: BoxFit.fitWidth,)
//               ],
//             )
//           ),