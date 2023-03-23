import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/screens/guildmeeting/other_documents.dart';
import 'package:fsek_mobile/screens/nollning/introduction_schedule.dart';
import 'package:fsek_mobile/screens/guildMeeting/about_guild_meeting.dart';
import 'package:fsek_mobile/screens/guildmeeting/pdf.dart';
import 'package:fsek_mobile/screens/guildmeeting/propositions.dart';

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
    String backgroundPath = "assets/img/jubel_background_home.png";
    return Stack(children: [
      // Image.asset(
      //   backgroundPath, //Sizing here is a bit wonky. nollningbakgrundtest is better than original though. Edited in paint so quality is shite
      //   height: MediaQuery.of(context).size.height,
      //   width: MediaQuery.of(context).size.width,
      //   fit: BoxFit.cover,
      //   alignment: Alignment.topCenter,
      // ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height / 2.69420 /* lemao */, 0, 0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(
                  flex: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AboutGuildMeetingPage()));
                      },
                      child: Text("About guild meeting"),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text("Before VT-meeting"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DocumentPage()));
                        },
                        child: Text("Motions")),
                    InkWell(
                      onTap: () {},
                      child: Text("Propositions"),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => PdfPage(url: "https://fsektionen.se/dokument/1089", title: "Kandidaturplanch"))));
                        },
                        child: Text("Candidacy planch")),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => OtherDocumentsPage()));
                      },
                      child: Text("Other meeting documents"),
                    ),
                  ],
                ),
                Spacer(
                  flex: 4,
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
