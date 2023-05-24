import 'package:flutter/material.dart';
import 'package:fsek_mobile/screens/guildMeeting/candidacy_poster.dart';
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
    var t = AppLocalizations.of(context)!;
    double edgePadding = MediaQuery.of(context).size.width / 25;
    String backgroundPath = "assets/img/vt_bakgrund_ny.png";
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
        body: Padding(
          padding: EdgeInsets.fromLTRB(
              edgePadding,
              MediaQuery.of(context).size.height / 2.69420 /* lemao */,
              edgePadding,
              0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    button("Nolleguide", GuidePage()),
                    button("Uppdrag", AdventureMissionsPage()),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    button("Här kan schemat ligga", MotionsPage()),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/emergency_contacts");
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
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
                Spacer(flex: 5),
              ],
            ),
          ),
        ),
      ),
    ]);
  }

  Widget button(String text, Widget destination) {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => destination));
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
