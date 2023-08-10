import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fsek_mobile/screens/nollning/introduction_schedule.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide/nolleguide.dart';
import 'package:fsek_mobile/screens/nollning/adventure_missions.dart';
import 'package:fsek_mobile/util/nollning/week_tracker.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

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
    double circleSize = MediaQuery.of(context).size.height / 7;
    double edgePadding = MediaQuery.of(context).size.width / 25;
    String locale = Localizations.localeOf(context).toString();

    // if it for some reason is something different dont break everything
    if (locale != "sv" && locale != "en") {
      locale = "sv";
    }

    int week = WeekTracker.determineWeek();
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
                    SizedBox(
                        height: MediaQuery.of(context).size.height /
                            28) // Box to make middle button float higher than right and left
                  ]),
                  _pageFlipButton(
                      IntroductionSchedule(currentWeek: week, firstTime: true), schedulePath, week, circleSize, 45, 3),
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

  Widget _pageFlipButton(
      Widget destination, String assetPath, int week, double circleSize, double inkwellCurvature, double padding) {
    return InkWell(
      customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(inkwellCurvature)),
      onTap: () => Navigator.push(
          context, TurnPageRoute(builder: (context) => destination, overleafColor: WeekTracker.weekColors[week])),
      child: Padding(
        padding: EdgeInsets.only(left: padding, right: padding),
        child: Image.asset(assetPath, height: circleSize),
      ),
    );
  }
}
