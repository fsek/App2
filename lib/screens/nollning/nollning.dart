import 'package:flutter/material.dart';
import 'package:fsek_mobile/screens/guildmeeting/other_documents.dart';
import 'package:fsek_mobile/screens/guildMeeting/about_guild_meeting.dart';
import 'package:fsek_mobile/screens/guildmeeting/pdf.dart';
import 'package:fsek_mobile/screens/guildmeeting/propositions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    String backgroundPath = "assets/img/bakgrund.png";
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
          padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height / 2.69420 /* lemao */, 0, 0),
          // child: GridView.count(
          //   physics: NeverScrollableScrollPhysics(),
          //   shrinkWrap: true,
          //   crossAxisCount: 2,
          //   children: [
          //     button(t.guildMeetingButtonAbout, AboutGuildMeetingPage()),
          //     button(t.guildMeetingButtonPoster, PdfPage(url: "https://fsektionen.se/dokument/1089", title: "Kandidaturplanch")),
          //     button(t.guildMeetingButtonMotions, DocumentPage()),
          //     button(t.guildMeetingButtonProposition, DocumentPage()),
          //     button(t.guildMeetingButtonOther, OtherDocumentsPage()),
          //   ],
          // )

          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    button(t.guildMeetingButtonAbout, AboutGuildMeetingPage()),
                    button(t.guildMeetingButtonPoster, PdfPage(url: "https://fsektionen.se/dokument/1089", title: "Kandidaturplanch")),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    button(t.guildMeetingButtonMotions, DocumentPage()),
                    button(t.guildMeetingButtonProposition, DocumentPage()),
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
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => destination));
      },
      child: Text(text),
      style: ElevatedButton.styleFrom(
          primary: Color(0x40005E77),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // <-- Radius
          ),
          minimumSize: Size(MediaQuery.of(context).size.width / 2.2, 60)),
    );
  }
}
