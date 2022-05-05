import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/nollning/nollning_group.dart';
import 'package:fsek_mobile/services/nollning.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';

class HighscoreTab extends StatefulWidget {
  @override
  _HighscoreTabState createState() => _HighscoreTabState();
}

class _HighscoreTabState extends State<HighscoreTab> {
  List<NollningGroup>? _groups;

  void initState() {
    locator<NollningService>().getNollningGroups().then((value) => setState(() {
          this._groups = value;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_groups == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.orange[600],
          ),
        ),
      );
    }
    _groups!.sort((g1, g2) => compareGroups(g1, g2));
    return Column(
      children: [
        Container(
          child: IgnorePointer(
              // This is incredibly bad code but it just won't scale correctly across devices otherwise
              child: TabBar(indicatorColor: Theme.of(context).bottomAppBarTheme.color, tabs: [Tab(text: "Placering"), Tab(text: "Gruppnamn"), Tab(text: "Poäng")])),
          color: Theme.of(context).bottomAppBarTheme.color,
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              this._groups = await locator<NollningService>().getNollningGroups();
              setState(() {});
            },
            child: ListView.builder(
              itemCount: _groups!.length,
              itemBuilder: (context, index) {
                return _listItem(index);
              },
              physics: const AlwaysScrollableScrollPhysics(),
            ),
          ),
        )
      ],
    );
  }

  Widget _listItem(int index) {
    switch (index) {
      case 0:
        return ListTile(
          contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 15),
          leading: Container(
            child: Center(
              child: Icon(
                Icons.emoji_events,
                color: Colors.amber.shade300,
                size: MediaQuery.of(context).size.width / 8,
              ),
            ),
            width: 50,
          ),
          title: Text(
            "${_groups![index].name}",
            style: TextStyle(fontSize: 25),
          ),
          subtitle: Text("${_groups![index].finished_missions} avklarade uppdrag"),
          trailing: Text(
            "${_groups![index].total_points} p",
            style: TextStyle(fontSize: 18),
          ),
          tileColor: Colors.yellow.shade100,
        );
      case 1:
        return ListTile(
          contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          leading: Container(
              child: Center(
                child: Icon(
                  Icons.emoji_events,
                  color: Colors.grey.shade400,
                  size: MediaQuery.of(context).size.width / 9,
                ),
              ),
              width: 50),
          title: Text(
            "${_groups![index].name}",
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text("${_groups![index].finished_missions} avklarade uppdrag"),
          trailing: Text(
            "${_groups![index].total_points} p",
            style: TextStyle(fontSize: 18),
          ),
          tileColor: Colors.grey.shade200,
        );
      case 2:
        return ListTile(
          contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 5),
          leading: Container(
              child: Center(
                child: Icon(
                  Icons.emoji_events,
                  color: Colors.brown.shade300,
                  size: MediaQuery.of(context).size.width / 10,
                ),
              ),
              width: 50),
          title: Text(
            "${_groups![index].name}",
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text("${_groups![index].finished_missions} avklarade uppdrag"),
          trailing: Text(
            "${_groups![index].total_points} p",
            style: TextStyle(fontSize: 18),
          ),
          tileColor: Colors.brown.shade100,
        );
      default:
        return ListTile(
          contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          leading: Container(
            child: Center(
                child: Text(
              "${index + 1}",
              style: TextStyle(fontSize: 22),
            )),
            width: 50,
          ),
          title: Text(
            "${_groups![index].name}",
            style: TextStyle(fontSize: 18),
          ),
          subtitle: Text("${_groups![index].finished_missions} avklarade uppdrag"),
          trailing: Text(
            "${_groups![index].total_points} p",
            style: TextStyle(fontSize: 18),
          ),
        );
    }
  }

  // First sort on points, then on completed missions, and then it up to chance
  // could add so that it also handles with alphabetic order, men palla
  int compareGroups(NollningGroup group1, NollningGroup group2) {
    var compResult = group2.total_points!.compareTo(group1.total_points!);
    // don't have same points
    if (compResult != 0) {
      return compResult;
    }
    return group2.finished_missions!.compareTo(group1.finished_missions!);
  }
}
