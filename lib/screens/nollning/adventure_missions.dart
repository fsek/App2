import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdventureMissionsPage extends StatefulWidget {
  static const routeName = '/adventure_missions';

  @override
  _AdventureMissionsPageState createState() => _AdventureMissionsPageState();
}

class _AdventureMissionsPageState extends State<AdventureMissionsPage> {
  void initState() {
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
          _highscore(context),
        ]),
      ),
    );
  }

  // Filler widget for adventureMissions tab
  Widget _adventureMissions(BuildContext context) {
    return Scaffold(
      body: Text("Inga äventyrsuppdrag är tillgängliga :("),
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
