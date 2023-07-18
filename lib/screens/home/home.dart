import 'package:flutter/material.dart';
import 'package:fsek_mobile/screens/guildMeeting/candidacy_poster.dart';
import 'package:fsek_mobile/screens/guildMeeting/motions.dart';
import 'package:fsek_mobile/screens/guildmeeting/other_documents.dart';
import 'package:fsek_mobile/screens/guildMeeting/about_guild_meeting.dart';
import 'package:fsek_mobile/screens/guildmeeting/propositions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fsek_mobile/screens/guildmeeting/motions.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide/nolleguide.dart';

import '../nollning/adventure_missions.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/homepage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double circle_size = MediaQuery.of(context).size.height / 7;
    var t = AppLocalizations.of(context)!;
    double edgePadding = MediaQuery.of(context).size.width / 25;

    String week = _determineWeek();
    String backgroundPath = "assets/img/nollning-23/hemsidan/homescreen-background-v$week.png";
    String nolleguidePath = "assets/img/nollning-23/hemsidan/homescreen-button-nolleguide-v$week.png";
    String uppdragPath = "assets/img/nollning-23/hemsidan/homescreen-button-uppdrag-v$week.png";
    String schedulePath = "assets/img/nollning-23/hemsidan/homescreen-button-schema-v$week.png";

    return Stack(children: [
      Image.asset(
        backgroundPath,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: // Padding(
            //   padding: EdgeInsets.fromLTRB(
            //       edgePadding, MediaQuery.of(context).size.height / 2.69420 /* lemao */, edgePadding, 0),
            // child:
            Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //Spacer(flex: 80),
              //height: MediaQuery.of(context).size.height / 7),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => GuidePage()));
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 3, right: 3),
                          child: Image.asset(
                            nolleguidePath,
                            height: circle_size,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(children: [
                    InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AdventureMissionsPage()));
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 3, right: 3),
                            child: Image.asset(
                              uppdragPath,
                              height: circle_size,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height /
                            28) // Box to make middle button float higher then right and left
                  ]),
                  InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => GuidePage()));
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 3, right: 3),
                          child: Image.asset(
                            schedulePath,
                            height: circle_size,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    customBorder: CircleBorder(),
                    onTap: () {
                      Navigator.pushNamed(context, "/emergency_contacts");
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 5, right: 5),
                          child: Image.asset(
                            "assets/img/nollning-23/homescreen-button-help.png",
                            height: MediaQuery.of(context).size.height / 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  Widget button(String text, Widget destination) {
    return TextButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => destination));
      },
      child: Text(text),
      style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Color.fromARGB(255, 0, 93, 119).withOpacity(0.25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          minimumSize: Size(MediaQuery.of(context).size.width / 2.4, 80)),
    );
  }

  String _determineWeek() {
    DateTime now = DateTime.now();
    DateTime v0 = DateTime(2023, 8, 21, 0, 0);
    DateTime v1 = DateTime(2023, 8, 28, 0, 0);
    DateTime v2 = DateTime(2023, 9, 4, 0, 0);
    DateTime v3 = DateTime(2023, 9, 11, 0, 0);
    DateTime v4 = DateTime(2023, 9, 18, 0, 0);

    List<DateTime> weeks = [v0, v1, v2, v3, v4];

    for (int i = 0; i < weeks.length; i++) {
      String week = "v$i";
      // If we have gotten to week 4 then end of list so edge-case
      if (week == "v4") {
        // if its week 4 and current time is after start time of week 4
        if (now.compareTo(weeks[i]) > 0) {
          return "$i";
        }
      } else if (now.compareTo(weeks[i]) > 0 && now.compareTo(weeks[i + 1]) < 0) {
        return "$i";
      }
    }

    // If it for some reason doesnt find one I guess default to week 0 for no spoilers?
    return "0";
  }
}
