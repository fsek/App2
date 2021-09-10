import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/nollning/adventure_data.dart';
import 'package:fsek_mobile/models/nollning/nollning_group.dart';
import 'package:fsek_mobile/screens/nollning/adventure_missions_tab.dart';
import 'package:fsek_mobile/screens/nollning/highscore_tab.dart';
import 'package:fsek_mobile/screens/nollning/my_group_tab.dart';
import 'package:fsek_mobile/services/nollning.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';

class AdventureMissionsPage extends StatefulWidget {
  static const routeName = '/adventure_missions';

  @override
  _AdventureMissionsPageState createState() => _AdventureMissionsPageState();
}

class _AdventureMissionsPageState extends State<AdventureMissionsPage> {
  AdventureData? _adventureData;

  void initState() {
    locator<NollningService>().getAdventures().then((value) => setState(() {
          this._adventureData = value;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'UPPDRAG',
                  icon: Icon(Icons.flag_rounded),
                ),
                Tab(
                  text: 'MIN GRUPP',
                  icon: Icon(Icons.group_rounded),
                ),
                Tab(
                  text: 'HIGHSCORE',
                  icon: Icon(Icons.emoji_events_rounded),
                )
              ],
            ),
            title: Hero(
              child: Text('Äventyrsuppdrag'),
              tag: "adventure_missions_tag",
            )),
        body: TabBarView(children: [
          AdventureMissionsTab(),
          MyGroupTab(),
          HighscoreTab(),
        ]),
      ),
    );
  }
}
