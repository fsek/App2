import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/nollning/adventure_data.dart';
import 'package:fsek_mobile/screens/nollning/adventure_missions_tab.dart';
import 'package:fsek_mobile/screens/nollning/highscore_tab_new.dart';
import 'package:fsek_mobile/screens/nollning/my_group_tab.dart';
import 'package:fsek_mobile/services/nollning.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AdventureMissionsPage extends StatefulWidget {
  static const routeName = '/adventure_missions';

  @override
  _AdventureMissionsPageState createState() => _AdventureMissionsPageState();
}

class _AdventureMissionsPageState extends State<AdventureMissionsPage> {
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.white,
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
          title: Text(t.introductionAdventureMissions),
        ),
        body: TabBarView(children: [
          AdventureMissionsTab(),
          MyGroupTab(),
          HighscoreTab(),
        ]),
      ),
    );
  }
}
