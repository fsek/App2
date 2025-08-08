import 'package:flutter/material.dart';
import 'package:fsek_mobile/api_client/lib/api_client.dart';
import 'package:fsek_mobile/screens/nollning/adventure_missions_tab_new.dart';
import 'package:fsek_mobile/screens/nollning/highscore_tab_new.dart';
import 'package:fsek_mobile/screens/nollning/questscreen/quests.dart';
import 'package:fsek_mobile/services/api.service.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fsek_mobile/models/home/calendarevent.dart';
import 'package:fsek_mobile/services/event.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/screens/event/event.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HighscoreScreen extends StatefulWidget {
  final double availableWidth;
  final double availableHeight;

  HighscoreScreen(
      {required this.availableHeight, required this.availableWidth});

  @override
  @override
  _HighscoreScreenState createState() => _HighscoreScreenState();
}

class _HighscoreScreenState extends State<HighscoreScreen> {
  Map<NollningGroupRead, int> groupPointsMap = {};
  NollningRead? nollning;

  String bakgrund = "assets/data/nollning_25/uppdrag/bakgrund.png";
  String avklarad = "assets/data/nollning_25/uppdrag/bricka-avklarad.png";
  String bedomning = "assets/data/nollning_25/uppdrag/bricka-bedomning.png";
  String misslyckad = "assets/data/nollning_25/uppdrag/bricka-misslyckad.png";
  String start = "assets/data/nollning_25/uppdrag/bricka-start.png";
  String pelare_left = "assets/data/nollning_25/uppdrag/halvpelare_left.png";
  String pelare_right = "assets/data/nollning_25/uppdrag/halvpelare_right.png";
  String rubrik = "assets/data/nollning_25/uppdrag/rubrik.png";

  @override
  void initState() {
    super.initState();
    _loadInitData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _loadInitData() async {
    final nollningResponse = await ApiService.apiClient
        .getNollningApi()
        .nollningGetNollningByYear(year: DateTime.now().year);
    final nollningData = nollningResponse.data;

    if (nollningData != null) {
      for (final nollningGroup in nollningData.nollningGroups.toList()) {
        final groupMissions = await ApiService.apiClient
            .getNollningApi()
            .nollningGetGroupMissionsFromNollningGroup(
                nollningGroupId: nollningGroup.id);

        int totalPoints = 0;
        if (groupMissions.data != null && groupMissions.data!.isNotEmpty) {
          for (final gm in groupMissions.data!.toList()) {
            if (gm.isAccepted == "Accepted") {
              totalPoints += gm.points;
            }
          }
        }
        groupPointsMap[nollningGroup] = totalPoints;
      }
    }

    // if (nollningData != null) {
    //   nollningData.nollningGroups.toList().forEach((group) async {
    //     final groupMissions = await ApiService.apiClient
    //         .getNollningApi()
    //         .nollningGetGroupMissionsFromNollningGroup(
    //             nollningGroupId: group.id);
    //     groupPointsMap.putIfAbsent(group, () {
    //       int totalPoints = 0;
    //       if (groupMissions.data!.isEmpty) {
    //         return 0;
    //       } else {
    //         groupMissions.data!.toList().forEach((groupMission) {
    //           if (groupMission.isAccepted == "Accepted") {
    //             totalPoints += groupMission.points;
    //           }
    //         });
    //         return totalPoints;
    //       }
    //     });
    //   });
    // }

    setState(() {
      this.nollning = nollningData;
    });
  }

  List<Widget> _createHighscoreCards(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    List<Widget> highscoreCards = [];

    Map<NollningGroupRead, int> sortedMap = Map.fromEntries(
      groupPointsMap.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value)),
    );

    int pos = 1;

    sortedMap.forEach((key, value) {
      highscoreCards.add(highscoreCard(key, value, pos, context));
      pos++;
    });

    return highscoreCards;
  }

  Widget highscoreCard(
      NollningGroupRead group, int points, int position, BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Center(
        child: Container(
            height: widget.availableHeight / 8,
            width: widget.availableWidth - 40,
            child: Card(
              shadowColor: Colors.transparent,
              color: Colors.transparent,
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Image.asset(
                    start,
                    fit: BoxFit.fill,
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Text(position.toString(),
                            style: TextStyle(
                                color: position == 1
                                    ? Color(0xFFd4af37)
                                    : (position == 2
                                        ? Color(0xFFC0C0C0)
                                        : (position == 3
                                            ? Color(0xFFCD7F32)
                                            : Colors.black)),
                                fontFamily: "MinionPro",
                                fontWeight: FontWeight.w800,
                                fontSize: widget.availableWidth / 10)),
                      ),
                      Container(
                          width: widget.availableWidth / 3,
                          height: widget.availableHeight / 10,
                          child: Center(
                              child: Text(
                            textAlign: TextAlign.center,
                            group.group.name.length <= 40
                                ? group.group.name
                                : group.group.name.substring(0, 20) + "...",
                            style: TextStyle(
                                fontFamily: "MinionPro",
                                fontWeight: FontWeight.w600,
                                fontSize: group.group.name.length <= 10
                                    ? widget.availableWidth / 15
                                    : (group.group.name.length <= 20
                                        ? widget.availableWidth / 20
                                        : widget.availableWidth / 25),
                                color: Color(0xFFFCBD1D)),
                          ))),
                      Center(
                        child: Text(
                          points.toString() + " ${t.introductionPoints2}",
                          style: TextStyle(
                              fontFamily: "MinionPro",
                              fontWeight: FontWeight.normal,
                              fontSize: widget.availableWidth / 25,
                              color: Colors.black),
                        ),
                      ),
                      // Column(
                      //   children: [
                      //     SizedBox(
                      //       height: widget.availableHeight / 50,
                      //     ),
                      //     Center(
                      //         child: Text(
                      //       textAlign: TextAlign.center,
                      //       group.group.name,
                      //       style: TextStyle(
                      //           fontFamily: "MinionPro",
                      //           fontWeight: FontWeight.w600,
                      //           fontSize: widget.availableWidth / 20,
                      //           color: Color(0xFFFCBD1D)),
                      //     )),
                      //     SizedBox(
                      //       height: widget.availableHeight / 100,
                      //     ),
                      //     Center(
                      //       child: Text(
                      //         points.toString() + t.introductionPoints2,
                      //         style: TextStyle(
                      //             fontFamily: "MinionPro",
                      //             fontWeight: FontWeight.normal,
                      //             fontSize: widget.availableWidth / 25,
                      //             color: Colors.black),
                      //       ),
                      //     )
                      //   ],
                      // )
                    ],
                  )
                ],
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    if (this.nollning == null) {
      return Center(child: CircularProgressIndicator());
    }

    return Container(
      height: widget.availableHeight,
      width: widget.availableWidth,
      child: Stack(
        children: [
          Positioned.fill(child: Image.asset(bakgrund, fit: BoxFit.fill)),
          SingleChildScrollView(
            child: Column(
              children: [..._createHighscoreCards(context)],
            ),
          )
        ],
      ),
    );
  }
}
