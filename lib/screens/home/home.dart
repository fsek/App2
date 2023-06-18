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
    double tempsize = 110;
    var t = AppLocalizations.of(context)!;
    double edgePadding = MediaQuery.of(context).size.width / 25;
    String backgroundPath =
        "assets/img/nollning-23/hemsidan/homescreen-background-v4.png"; // TODO insert local method to determine what image to use
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
              SizedBox(height: 435),
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
                            "assets/img/nollning-23/hemsidan/homescreen-button-nolleguide-v4.png",
                            height: tempsize,
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
                              "assets/img/nollning-23/hemsidan/homescreen-button-uppdrag-v4.png",
                              height: tempsize,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30)
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
                            "assets/img/nollning-23/hemsidan/homescreen-button-schema-v4.png",
                            height: tempsize,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
                          padding: EdgeInsets.only(bottom: 3, right: 3),
                          child: Image.asset(
                            "assets/img/nollning-23/homescreen-button-help.png",
                            height: 60,
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
}
