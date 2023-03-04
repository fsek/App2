import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/screens/nollning/introduction_schedule.dart';
import 'package:fsek_mobile/screens/guildmeeting/pdf.dart';

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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PdfPage(url: "https://fsektionen.se/dokument/276")));

                        // Navigator.pushNamed(context, '/nolleguide');
                      },
                      child: Image.asset(
                        "assets/img/Nolleguiden.png",
                        height: 100,
                      ),
                    ),
                  ],
                ),
                //Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => IntroductionSchedule()));
                      },
                      child: Image.asset(
                        "assets/img/schedulebutton.png",
                        height: 100,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/song_book');
                      },
                      child: Image.asset(
                        "assets/img/Sångbok.png",
                        height: 100,
                        // scale: 2,
                      ),
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
