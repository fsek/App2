import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:fsek_mobile/screens/cafe/cafe.dart';
import 'package:fsek_mobile/screens/gallery/gallery.dart';
import 'package:fsek_mobile/screens/nollning/emergency_contacts.dart';
import 'package:fsek_mobile/screens/nollning/map_page.dart';
import 'package:fsek_mobile/screens/nollning/mission.dart';
import 'package:fsek_mobile/screens/nollning/new_questscreen/quest_home.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide25/nolleguide_home.dart';
import 'package:fsek_mobile/screens/nollning/schedule.dart';
import 'package:fsek_mobile/screens/placeholder/placeholder.dart';
import 'package:fsek_mobile/screens/songbook/songbook.dart';

import 'package:fsek_mobile/util/nollning/week_tracker.dart';

import 'package:fsek_mobile/services/preload_asset.service.dart';

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
    String background = "assets/data/nollning_25/homescreen/bakgrund.png";
    String sos = "assets/data/nollning_25/homescreen/sos.png";
    String karta = "assets/data/nollning_25/homescreen/karta.png";
    String nolleguiden = "assets/data/nollning_25/homescreen/nolleguiden.png";
    String sangbok = "assets/data/nollning_25/homescreen/sangbok.png";
    String schema = "assets/data/nollning_25/homescreen/schema.png";
    String uppdrag = "assets/data/nollning_25/homescreen/uppdrag.png";

    return Container(
      child: Stack(children: [
        Positioned.fill(
            child: Image.asset(
          background,
          fit: BoxFit.fill,
        )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: screenHeight / 12),
                child: Container(
                    width: screenWidth / 6,
                    child: InkWell(
                      onTap: () => (Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmergencyContactsPage()))),
                      child: Image.asset(sos),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        width: screenWidth / 4,
                        child: InkWell(
                          onTap: () => (Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuestHomeScreen()))),
                          child: Image.asset(uppdrag),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: screenWidth / 5,
                        child: InkWell(
                          onTap: () => (Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MapView()))),
                          child: Image.asset(karta),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        width: screenWidth / 4,
                        child: InkWell(
                          onTap: () => (Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NolleGuideHomePage()))),
                          child: Image.asset(nolleguiden),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: screenWidth / 5,
                        child: InkWell(
                          onTap: () => (Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScheduleScreenPage()))),
                          child: Image.asset(schema),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: screenHeight / 12),
                child: Container(
                    width: screenWidth / 6,
                    child: InkWell(
                      onTap: () => (Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SongbookPage()))),
                      child: Image.asset(sangbok),
                    )),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
