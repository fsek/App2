import 'package:flutter/material.dart';
import 'package:fsek_mobile/screens/guildMeeting/candidacy_poster.dart';
import 'package:fsek_mobile/screens/guildmeeting/other_documents.dart';
import 'package:fsek_mobile/screens/guildMeeting/about_guild_meeting.dart';
import 'package:fsek_mobile/screens/guildmeeting/propositions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fsek_mobile/screens/guildmeeting/motions.dart';

class NollningPage extends StatefulWidget {
  static const routeName = '/nollningpage';

  @override
  _NollningPageState createState() => _NollningPageState();
}

class _NollningPageState extends State<NollningPage> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    double edgePadding = MediaQuery.of(context).size.width / 25;
    String backgroundPath = "assets/img/vt_bakgrund.png";
    return Stack(children: [
      Image.asset(
        backgroundPath, //Sizing here is a bit wonky. nollningbakgrundtest is better than original though. Edited in paint so quality is shite
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.fromLTRB(
              edgePadding, MediaQuery.of(context).size.height / 2.69420 /* lemao */, 0, edgePadding),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    button(t.guildMeetingButtonAbout, AboutGuildMeetingPage()),
                    button(t.guildMeetingButtonPoster, CandidacyPosterPage()),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    button(t.guildMeetingButtonMotions, MotionsPage()),
                    button(t.guildMeetingButtonProposition, PropositionsPage()),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width / 48), // space so that the fifth button
                    button(t.guildMeetingButtonOther, OtherDocumentsPage()),
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
        Navigator.push(context, MaterialPageRoute(builder: (context) => destination));
      },
      child: Text(text),
      style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Color.fromARGB(255, 0, 93, 119).withOpacity(0.25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // <-- Radius
          ),
          minimumSize: Size(MediaQuery.of(context).size.width / 2.4, 80)),
    );
  }
}
