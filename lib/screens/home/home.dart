import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fsek_mobile/screens/nollning/introduction_schedule.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide/nolleguide.dart';
import 'package:fsek_mobile/screens/nollning/adventure_missions.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/homepage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<Color> weekColors = [
    Color(0xFF202C57), // v0
    Color(0xFF4B6357), // v1
    Color(0xFF9B4C52), // v2
    Color(0xFF260F3F), // v3
    Color(0xFF165C7F), // v4
  ];

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    double circleSize = MediaQuery.of(context).size.height / 7;
    double edgePadding = MediaQuery.of(context).size.width / 25;

    // String week = _determineWeek();
    int week = _determineWeek();
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _pageFlipButton(GuidePage(), nolleguidePath, week, circleSize, 35, 3),
                  Column(children: [
                    _pageFlipButton(AdventureMissionsPage(), uppdragPath, week, circleSize, 35, 3),
                    SizedBox(height: MediaQuery.of(context).size.height / 28) // Box to make middle button float higher then right and left
                  ]),
                  _pageFlipButton(IntroductionSchedule(currentWeek: week), schedulePath, week, circleSize, 45, 3),
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

  int _determineWeek() {
    DateTime now = DateTime.now();
    DateTime v0 = DateTime(2023, 8, 21, 0, 0);
    DateTime v1 = DateTime(2023, 8, 28, 0, 0);
    DateTime v2 = DateTime(2023, 9, 4, 0, 0);
    DateTime v3 = DateTime(2023, 9, 11, 0, 0);
    DateTime v4 = DateTime(2023, 9, 18, 0, 0);

    List<DateTime> weeks = [v0, v1, v2, v3, v4];

    for (int i = 0; i < weeks.length; i++) {
      // If we have gotten to week 4 then end of list so edge-case
      if (i == 4) {
        // if its week 4 and current time is after start time of week 4
        if (now.compareTo(weeks[i]) > 0) {
          return i;
        }
      } else if (now.compareTo(weeks[i]) > 0 && now.compareTo(weeks[i + 1]) < 0) {
        return i;
      }
    }

    // If it for some reason doesnt find one I guess default to week 0 for no spoilers?
    return 0;
  }

  Widget _pageFlipButton(Widget destination, String assetPath, int week, double circleSize, double inkwellCurvature, double padding) {
    return InkWell(
      customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(inkwellCurvature)),
      onTap: () => Navigator.push(context, TurnPageRoute(builder: (context) => destination, overleafColor: weekColors[week])),
      child: Padding(
        padding: EdgeInsets.only(left: padding, right: padding),
        child: Image.asset(assetPath, height: circleSize),
      ),
    );
  }
}
