import 'package:flutter/cupertino.dart';
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
      return Text("Handle null plz");
    }
    _groups!.sort((g1, g2) => compareGroups(g1, g2));
    return Column(
      children: [
        Container(
          child: ListTile(
            leading: Text("Placering"),
            title: Text("Gruppnamn"),
            trailing: Text("Poäng"),
          ),
          color: Theme.of(context).bottomAppBarTheme.color,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: _groups!.length,
              itemBuilder: (context, index) {
                return _listItem(index);
              }),
        )
      ],
    );
  }

  Widget _listItem(index) {
    return ListTile(
      leading: Text("${index + 1}"),
      title: Text("${_groups![index].name}"),
      trailing: Text("${_groups![index].total_points}"),
    );
  }

  // First sort on points, then on completed missions, and then it up to chance
  // could add so that it also handles with alphabetic order, men palla
  int compareGroups(group1, group2) {
    var compResult = group2.total_points.compareTo(group1.total_points);
    // don't have same points
    if (compResult != 0) {
      return compResult;
    }
    return group2.finished_missions.compareTo(group1.finshed_missions);
  }
}
