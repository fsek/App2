import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/screens/nollning/introduction_schedule.dart';

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
    String backgroundPath = "assets/img/bakgrund_scaled.png";
    DateTime now = DateTime.now();
    DateTime kmTakeOverStart = DateTime(2022, 9, 2, 21, 0);
    DateTime kmTakeOverEnd = DateTime(2022, 9, 10, 10, 0);
    if (kmTakeOverStart.compareTo(now) < 0 &&
        kmTakeOverEnd.compareTo(now) > 0) {
      backgroundPath = "assets/img/bakgrund_km_scaled.png";
    }
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
          padding: EdgeInsets.fromLTRB(0,
              MediaQuery.of(context).size.height / 2.69420 /* lemao */, 0, 0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(
                  flex: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/adventure_missions');
                      },
                      child: Image.asset(
                        "assets/img/Uppdrag.png",
                        height: 100,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/nolleguide');
                      },
                      child: Image.asset(
                        "assets/img/Nolleguiden.png",
                        height: 100,
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/messages'),
                      child: Image.asset(
                        "assets/img/Meddelanden.png",
                        height: 100,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => IntroductionSchedule()));
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
