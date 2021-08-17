import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fsek_mobile/models/nollning/adventure_mission.dart';
import 'package:fsek_mobile/models/nollning/adventure_mission_week.dart';
import 'package:fsek_mobile/models/nollning/nollning_group.dart';
import 'package:fsek_mobile/screens/nollning/mission.dart';
import 'package:fsek_mobile/services/nollning.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';

class AdventureMissionsTab extends StatefulWidget {
  @override
  _AdventureMissionsTabState createState() => _AdventureMissionsTabState();
}

class _AdventureMissionsTabState extends State<AdventureMissionsTab> {
  List<AdventureMissionWeek>? _adventureWeeks;

  void initState() {
    // locator<NollningService>().testGetThings();
    locator<NollningService>().getAdventureWeeks().then((value) => setState(() {
          this._adventureWeeks = value;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_adventureWeeks == null) {
      return Text("NULL NULL NULL PLZ HANDLE");
    }
    int weekCount = _adventureWeeks!.length;
    return DefaultTabController(
      length: _adventureWeeks!.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // no back button on this appbar
          flexibleSpace: new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              new TabBar(
                tabs: List.generate(
                  weekCount,
                  (index) => Tab(
                    text: _adventureWeeks![index].title,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: List.generate(weekCount, (index) => _showAdventureWeek(_adventureWeeks![index])),
        ),
      ),
    );
  }

  Widget _showAdventureWeek(AdventureMissionWeek missionWeek) {
    List<AdventureMission> missions = missionWeek.adventure_missions!;
    return ListView(
      children: List.generate(
        missions.length,
        (index) => _adventureMissionTile(missions[index]),
      ),
    );
  }

  Widget _adventureMissionTile(AdventureMission mission) {
    return InkWell(
      // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MissionPage(mission: mission))),
      child: ListTile(
        title: Text(mission.title!),
        // subtitle has to change wether or not we have variable amount of points
        subtitle: mission.variable_points! ? Text("1-${mission.max_points} poäng") : Text("${mission.max_points} poäng"),
        trailing: locator<NollningService>().is_mentor
            ? IconButton(
                onPressed: () => setState(() => _setCompletedState(mission)),
                icon: mission.is_accepted! || mission.is_pending!
                    ? Icon(
                        Icons.cancel_rounded,
                        color: Colors.red,
                      )
                    : Icon(
                        Icons.check_box_rounded,
                        color: Colors.green,
                      ),
              )
            : null,
        tileColor: _getTileColor(mission),
      ),
    );
  }

  Color _getTileColor(AdventureMission mission) {
    if (mission.is_accepted!) {
      return Colors.greenAccent.shade100;
    } else if (mission.is_pending!) {
      return Colors.yellowAccent.shade100;
    } else {
      return Colors.transparent;
    }
  }

  void _setCompletedState(AdventureMission mission) {
    // if the mission isn't already handed in yet (either completed or pending)
    if (!(mission.is_accepted! || mission.is_pending!)) {
      // if the mission has variable points, let them fill in the amount,
      // else just post instantly
      if (mission.variable_points!) {
        _variablePointsDialog(context, mission.max_points!);
      }
    }

    if (mission.is_accepted!) {
      mission.is_accepted = false;
    } else if (mission.is_pending!) {
      mission.is_pending = false;
    } else {
      if (mission.require_acceptance!) {
        mission.is_pending = true;
      } else {
        mission.is_accepted = true;
      }
    }
  }

  Future<void> _finishAdventureMission(AdventureMission mission, int points) async {}

  Future<void> _variablePointsDialog(BuildContext context, int max_points) async {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _textFieldController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Poäng? (1-$max_points)"),
          content: TextField(
            keyboardType: TextInputType.number,
            controller: _textFieldController,
            decoration: InputDecoration(
              hintText: "1-$max_points",
            ),
          ),
          actions: [
            TextButton(
              child: Text('AVBRYT'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                if (!_isValidInput(_textFieldController.text, max_points)) {
                  _errorMessageDialog(context, max_points);
                }
                print(_textFieldController.text);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  bool _isValidInput(String value, int max_points) {
    if (value.isNotEmpty) {
      try {
        int number = int.parse(value);
        return (number > 0 && number <= max_points);
      } on FormatException {
        // not even an int
        return false;
      }
    }
    // we don't show error message on empty string
    return true;
  }

  Future<void> _errorMessageDialog(BuildContext context, int max_points) async {
    return showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            content: Text("Bara tal mellan 1 och $max_points tack!"),
          );
        });
  }
}
