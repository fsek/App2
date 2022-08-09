import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/nollning/adventure_mission.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MissionPage extends StatelessWidget {
  const MissionPage({Key? key, required this.mission}) : super(key: key);

  final AdventureMission mission;

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(mission.title!),
      ),
      body: Column(
        children: [
          Text("${t.introductionMaxPoints}: ${mission.max_points}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _getStatus(mission, context),
          )
        ],
      ),
    );
  }

  List<Widget> _getStatus(AdventureMission mission, BuildContext context) {
    var t = AppLocalizations.of(context)!;
    if (mission.is_accepted!) {
      return [
        Text("Status: "),
        Text(t.introductionCompleted),
        Icon(
          Icons.check_circle_outline_rounded,
          color: Colors.green,
        ),
      ];
    } else if (mission.is_pending!) {
      return [
        Text("Status: "),
        Text(t.introductionPendingApproval),
        Icon(
          Icons.schedule_rounded,
          color: Colors.yellow,
        ),
      ];
    } else {
      return [
        Text("Status: "),
        Text(t.introductionNotCompleted),
        Icon(
          Icons.remove_circle_outline_rounded,
          color: Colors.grey,
        ),
      ];
    }
  }
}
