import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/nollning/nollning_group.dart';

class HighscoreTab extends StatefulWidget {
  HighscoreTab({required this.groups});

  final List<NollningGroup>? groups;

  @override
  _HighscoreTabState createState() => _HighscoreTabState();
}

class _HighscoreTabState extends State<HighscoreTab> {
  List<NollningGroup>? _groups;

  void initState() {
    _groups = widget.groups;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_groups == null) {
      return Text("Handle null plz");
    }
    _groups!.sort((g1, g2) => g1.total_points!.compareTo(g2.total_points!));
    return Column(
      children: [
        Container(
          child: ListTile(
            leading: Text("Placering"),
            title: Text("Gruppnamn"),
            trailing: Text("Poäng"),
          ),
          color: Colors.orange[600],
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
}
