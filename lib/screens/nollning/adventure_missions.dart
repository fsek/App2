import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/nollning/nollning_group.dart';
import 'package:fsek_mobile/screens/nollning/highscore_tab.dart';
import 'package:fsek_mobile/services/nollning.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';

class AdventureMissionsPage extends StatefulWidget {
  static const routeName = '/adventure_missions';

  @override
  _AdventureMissionsPageState createState() => _AdventureMissionsPageState();
}

class _AdventureMissionsPageState extends State<AdventureMissionsPage> {
  List<NollningGroup>? groups;
  void initState() {
    // locator<NollningService>().testGetThings();
    locator<NollningService>().getNollningGroups().then((value) => setState(() {
          this.groups = value;
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
          _adventureMissions(context),
          _myGroup(context),
          HighscoreTab(groups: groups),
        ]),
      ),
    );
  }

  // Filler widget for adventureMissions tab
  Widget _adventureMissions(BuildContext context) {
    if (groups == null) {
      return Text("ohno");
    }
    List<Widget> nollningGroups = groups!.map((e) => _groupToWidget(e)).toList();
    return Column(
      children: nollningGroups,
      //Text("Inga äventyrsuppdrag är tillgängliga :("),
    );
  }

  Widget _groupToWidget(NollningGroup nollningGroup) {
    return Row(
      children: [
        Text(nollningGroup.name!),
        Text(nollningGroup.total_points!.toString()),
        Text(nollningGroup.finished_missions.toString()),
      ],
    );
  }

  // Filler widget for myGroup tab
  Widget _myGroup(BuildContext context) {
    return Scaffold(
      body: Text("Ingen faddergrupp är tillgänglig :("),
    );
  }

  Widget _highscore(BuildContext context) {
    // Filler data for adventure mission groups
    final groups = List<String>.generate(16, (i) => 'Group_${i + 1}');

    return ListView.builder(
      itemCount: groups.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${index + 1}. ${groups[index]}'),
        );
      },
    );
  }
}
