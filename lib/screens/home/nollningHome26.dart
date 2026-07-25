import 'package:flutter/material.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';
import 'package:fsek_mobile/screens/nollning/emergency_contacts.dart';
import 'package:fsek_mobile/screens/nollning/map_page.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide_26/nolleguide_home.dart';
import 'package:fsek_mobile/screens/nollning/questscreen_26/quest_home.dart';
import 'package:fsek_mobile/screens/nollning/schedule.dart';
import 'package:fsek_mobile/screens/songbook/songbook.dart';

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

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    const int buttonSize = 5; // The higher the number the smaller the button
    const double buttonSpace = 30; // The space between the buttons
    const double bottomMargin = 30; // The margin from the navbar

    const String backgroundImage = "assets/data/nollning_26/homescreen/background.png";
    const String buttonImage = "assets/data/nollning_26/homescreen/button.png";

    return Container(
      child: Stack(children: [
        Positioned.fill(child: Image.asset(backgroundImage, fit: BoxFit.fill)),
        Align(alignment: Alignment.topCenter, child: Text("En nollning på ny nivå!", style: TextStyle(color: Colors.white),),),
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
                      child: generateButton(buttonImage, "Nolle-\nguiden"),
                    ),
                  ),
                  SizedBox(
                    height: buttonSpace,
                  ),
                  Container(
                    width: screenWidth / buttonSize,
                    child: InkWell(
                      onTap: () => (Navigator.push(context, MaterialPageRoute(builder: (context) => ScheduleScreenPage()))),
                      child: generateButton(buttonImage, "Schema"),
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
                      child: generateButton(buttonImage, "Kontakt"),
                    ),
                  ),
                  SizedBox(
                    height: buttonSpace,
                  ),
                  Container(
                    width: screenWidth / buttonSize,
                    child: InkWell(
                      onTap: () => (Navigator.push(context, MaterialPageRoute(builder: (context) => QuestHomeScreen()))),
                      child: generateButton(buttonImage, "Side\nQuest"),
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
                      child: generateButton(buttonImage, "Sångbok"),
                    ),
                  ),
                  SizedBox(
                    height: buttonSpace,
                  ),
                  Container(
                    width: screenWidth / buttonSize,
                    child: InkWell(
                      onTap: () => (Navigator.push(context, MaterialPageRoute(builder: (context) => MapView()))),
                      child: generateButton(buttonImage, "Karta"),
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