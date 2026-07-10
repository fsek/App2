import 'package:flutter/material.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';
import 'package:fsek_mobile/screens/nollning/emergency_contacts.dart';
import 'package:fsek_mobile/screens/nollning/map_page.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide_26/nolleguide_home.dart';
import 'package:fsek_mobile/screens/nollning/questscreen_26/quest_home.dart';
import 'package:fsek_mobile/screens/nollning/schedule.dart';
import 'package:fsek_mobile/screens/songbook/songbook.dart';
import 'package:fsek_mobile/util/nollning/week_tracker.dart';

class NollningHomePage extends StatefulWidget {
  static const routeName = '/homepage';

  @override
  _NollningHomePageState createState() => _NollningHomePageState();
}

class _NollningHomePageState extends State<NollningHomePage> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    var week = WeekTracker.determineWeek();

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    const int buttonSize = 5; // The higher the number the smaller the button
    const double buttonSpace = 30; // The space between the buttons
    const double bottomMargin = 30; // The margin from the navbar

    var filePath = 'assets/data/nollning_26/homescreen/lvl_${week}';

    var backgroundImage = '${filePath}/background.png';
    var contactButton = '${filePath}/button_contact_${t.localeName}.png';
    var mapButton = '${filePath}/button_map_${t.localeName}';
    var guideButton = '${filePath}/button_guide_${t.localeName}.png';
    var scheduleButton = '${filePath}/button_schedule_${t.localeName}.png';
    var questButton = '${filePath}/button_quest_${t.localeName}.png';
    var songButton = '${filePath}/button_song_${t.localeName}.png';

    return Container(
      child: Stack(children: [
        Positioned.fill(child: Image.asset(backgroundImage, fit: BoxFit.fill)),
        Align(alignment: Alignment.bottomCenter, child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(padding: EdgeInsets.only(bottom: bottomMargin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: screenWidth / buttonSize,
                    child: InkWell(
                      onTap: () => (Navigator.push(context, MaterialPageRoute(builder: (context) => NolleGuideHomePage()))),
                      child: Image.asset(guideButton)
                    ),
                  ),
                  SizedBox(
                    height: buttonSpace,
                  ),
                  Container(
                    width: screenWidth / buttonSize,
                    child: InkWell(
                      onTap: () => (Navigator.push(context, MaterialPageRoute(builder: (context) => ScheduleScreenPage()))),
                      child: Image.asset(scheduleButton)
                    ),
                  )
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: bottomMargin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: screenWidth / buttonSize,
                    child: InkWell(
                      onTap: () => (Navigator.push(context, MaterialPageRoute(builder: (context) => EmergencyContactsPage()))),
                      child: Image.asset(contactButton)
                    ),
                  ),
                  SizedBox(
                    height: buttonSpace,
                  ),
                  Container(
                    width: screenWidth / buttonSize,
                    child: InkWell(
                      onTap: () => (Navigator.push(context, MaterialPageRoute(builder: (context) => QuestHomeScreen()))),
                      child: Image.asset(questButton)
                    ),
                  )
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: bottomMargin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: screenWidth / buttonSize,
                    child: InkWell(
                      onTap: () => (Navigator.push(context, MaterialPageRoute(builder: (context) => SongbookPage()))),
                      child: Image.asset(songButton)
                    ),
                  ),
                  SizedBox(
                    height: buttonSpace,
                  ),
                  Container(
                    width: screenWidth / buttonSize,
                    child: InkWell(
                      onTap: () => (Navigator.push(context, MaterialPageRoute(builder: (context) => MapView()))),
                      child: Image.asset(mapButton)
                    ),
                  )
                ],
              ),
            ),
          ],
        ),)
      ],),
    );
  }

  Widget generateButton(String imagePath, String text) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(imagePath),
        Text(
          text,
          style: TextStyle(color: Colors.black),
        )
      ],
    );
  }
}