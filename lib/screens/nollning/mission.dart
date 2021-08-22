import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/nollning/adventure_mission.dart';

class MissionPage extends StatelessWidget {
  const MissionPage({Key? key, required this.mission}) : super(key: key);

  final AdventureMission mission;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mission.title!),
      ),
      body: Column(
        children: [
          Text("Maxpoäng: ${mission.max_points}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _getStatus(mission),
          )
        ],
      ),
    );
  }

  List<Widget> _getStatus(AdventureMission mission) {
    if (mission.is_accepted!) {
      return [
        Text("Status: "),
        Text("Avklarat"),
        Icon(
          Icons.check_circle_outline_rounded,
          color: Colors.green,
        ),
      ];
    } else if (mission.is_pending!) {
      return [
        Text("Status: "),
        Text("Väntar på godkännande"),
        Icon(
          Icons.schedule_rounded,
          color: Colors.yellow,
        ),
      ];
    } else {
      return [
        Text("Status: "),
        Text("Ej avklarat"),
        Icon(
          Icons.remove_circle_outline_rounded,
          color: Colors.grey,
        ),
      ];
    }
  }
}
