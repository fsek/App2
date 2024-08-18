import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/nollning/adventure_data.dart';
import 'package:fsek_mobile/screens/nollning/adventure_missions_tab_new.dart';
import 'package:fsek_mobile/screens/nollning/highscore_tab_new.dart';
import 'package:fsek_mobile/screens/nollning/my_group_tab.dart';
import 'package:fsek_mobile/screens/nollning/questscreen/quests.dart';
import 'package:fsek_mobile/services/nollning.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AdventureMissionsPageNew extends StatefulWidget {
  static const routeName = '/adventure_missions';

  @override
  _AdventureMissionsPageNewState createState() =>
      _AdventureMissionsPageNewState();
}

class _AdventureMissionsPageNewState extends State<AdventureMissionsPageNew> {
  AdventureData? _adventureData;

  void initState() {
    locator<NollningService>().getAdventures().then((value) {
      if (mounted) {
        setState(() {
          this._adventureData = value;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    String locale = Localizations.localeOf(context).toString();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF7E5127),
          // Color.fromARGB(255, 118, 110, 99),
          bottom: TabBar(
            indicatorColor: Color.fromARGB(255, 70, 43, 17),
            labelColor: Color(0xFFE9CA97),
            unselectedLabelColor: Color(0xFF39342E),

            //Colors.white,
            tabs: [
              Tab(
                text: t.introductionMissions,
                icon: Icon(Icons.flag_rounded),
              ),
              Tab(
                text: t.introductionMyGroup,
                icon: Icon(Icons.group_rounded),
              ),
              Tab(
                text: 'HIGHSCORE',
                icon: Icon(Icons.emoji_events_rounded),
              )
            ],
          ),
          title: Text(
            t.introductionAdventureMissions,
            style: TextStyle(
              fontFamily: 'Testament',
              fontSize:
                  //MediaQuery.of(context).size.width / 20,
                  (locale == "sv" ? 28.0 : 26),
              fontWeight: FontWeight.normal,
              color: Color(0xFFE9CA97),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        body: TabBarView(children: [
          AdventureMissionsTabNew(),
          QuestPage(),
          HighscoreTab(),
        ]),
      ),
    );
  }
}
