import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/nollning/adventure_mission.dart';
import 'package:fsek_mobile/models/nollning/adventure_mission_week.dart';
import 'package:fsek_mobile/models/nollning/nollning_group.dart';
import 'package:fsek_mobile/services/nollning.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';

class AdventureMissionsTab extends StatefulWidget {
  @override
  _AdventureMissionsTabState createState() => _AdventureMissionsTabState();
}

class _AdventureMissionsTabState extends State<AdventureMissionsTab> {
  AdventureMissionWeek? _adventureWeek;

  void initState() {
    // locator<NollningService>().testGetThings();
    locator<NollningService>().getCurrentAdventureWeek().then((value) => setState(() {
          this._adventureWeek = value;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_adventureWeek == null) {
      return Text("NULL NULL NULL PLZ HANDLE");
    }
    List<AdventureMission> missions = locator<NollningService>().parseAdventureMissions(_adventureWeek);
    return Text("Ingen faddergrupp är tillgänglig :(");
  }
}
