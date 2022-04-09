import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/nollning/adventure_data.dart';
import 'package:fsek_mobile/models/nollning/adventure_mission_week.dart';
import 'package:fsek_mobile/services/nollning.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';

class MyGroupTab extends StatefulWidget {
  @override
  _MyGroupTabState createState() => _MyGroupTabState();
}

class _MyGroupTabState extends State<MyGroupTab> {
  List<AdventureMissionWeek>? _adventureWeeks;
  List<int>? totalMissionsList;
  List<int>? acceptedMissionsList;
  List<double>? progressList;
  int? totalPoints;
  int? maxTotalPoints;
  AdventureData? adventureData;

  void initState() {
    locator<NollningService>().getAdventureWeeks().then((value) => setState(() {
          this._adventureWeeks = value;
          this.totalMissionsList = totalMissions(_adventureWeeks!);
          this.acceptedMissionsList = acceptedMissions(_adventureWeeks!);
          this.progressList = List.empty(growable: true);
        }));

    locator<NollningService>().getAdventures().then((value) => setState(() {
          this.adventureData = value;
          totalPoints = value.total_group_points ?? 0;
          maxTotalPoints = _getMaxTotal();
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_adventureWeeks == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.orange[600],
          ),
        ),
      );
    }
    //fuck it! For loop time
    for (var i = 0; i < 5; i++) {
      if (totalMissionsList!.elementAt(i) == 0) {
        progressList!.add(0);
      } else {
        progressList!.add(acceptedMissionsList!.elementAt(i) / totalMissionsList!.elementAt(i));
      }
    }
    double circleSize = MediaQuery.of(context).size.height / 5.5;
    return Stack(
      children: [
        Image.asset(
          "assets/img/Fapp-alternativ.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    LinearProgressIndicator(
                      value: (totalPoints ?? 0) / (maxTotalPoints ?? 1),
                      minHeight: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, right: 10, left: 10),
                      child: Text(
                        adventureData?.group_name ?? "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "$totalPoints poäng",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _weekProgressCircle(imgPath: "assets/img/vecka_0.png", progress: progressList!.elementAt(0), borderColor: Colors.purple[900]!, size: circleSize),
                    _weekProgressCircle(imgPath: "assets/img/vecka_1.png", progress: progressList!.elementAt(1), borderColor: Colors.blue[900]!, size: circleSize),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _weekProgressCircle(imgPath: "assets/img/vecka_4.png", progress: progressList!.elementAt(4), borderColor: Colors.orange, size: circleSize),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _weekProgressCircle(imgPath: "assets/img/vecka_2.png", progress: progressList!.elementAt(2), borderColor: Colors.red[900]!, size: circleSize),
                    _weekProgressCircle(imgPath: "assets/img/vecka_3.png", progress: progressList!.elementAt(3), borderColor: Colors.green[900]!, size: circleSize),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _weekProgressCircle({required String imgPath, required double progress, Color borderColor = Colors.black, bool active = true, double size = 150}) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        foregroundDecoration: BoxDecoration(
          // Only grey out img if not active
          color: active ? Colors.transparent : Colors.grey,
          backgroundBlendMode: BlendMode.saturation,
          borderRadius: BorderRadius.circular(150),
        ),
        child: Image.asset(
          imgPath,
          height: size,
        ),
      ),
      SizedBox(
        child: CircularProgressIndicator(
          value: progress,
          color: borderColor,
          strokeWidth: 8.0,
        ),
        width: size,
        height: size,
      ),
      // OBSERVE: How to give text border, as recomended by official docs
      // Stroked text as border.
      Text(
        "${(progress * 100).round()}%",
        style: TextStyle(
          fontSize: 30,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 6
            ..color = Colors.black,
        ),
      ),
      // Solid text as fill.
      Text(
        "${(progress * 100).round()}%",
        style: TextStyle(
          fontSize: 30,
          color: Colors.grey[300],
        ),
      ),
    ]);
  }

  List<int> totalMissions(List<AdventureMissionWeek> adventureMissionWeeks) {
    List<int> missionsPerWeek = List.empty(growable: true);
    adventureMissionWeeks.forEach((week) {
      missionsPerWeek.add(week.adventure_missions!.length);
    });
    //fuck it! While loop
    while (missionsPerWeek.length <= 5) {
      missionsPerWeek.add(0);
    }
    return missionsPerWeek;
  }

  List<int> acceptedMissions(List<AdventureMissionWeek> adventureMissionWeeks) {
    List<int> acceptedPerWeek = List.empty(growable: true);
    adventureMissionWeeks.forEach((week) {
      acceptedPerWeek.add(week.missions_accepted ?? 0);
    });
    //fuck it! While loop
    while (acceptedPerWeek.length <= 5) {
      acceptedPerWeek.add(0);
    }
    return acceptedPerWeek;
  }

  int _getMaxTotal() {
    Map<String, List<AdventureMissionWeek>> map = adventureData!.adventures!;
    int points = 0;
    map.entries.forEach((entry) {
      if (entry.key == "adventures") {
        entry.value.forEach((week) {
          week.adventure_missions!.forEach((mission) {
            points += mission.max_points ?? 0;
          });
        });
      }
    });
    return points;
  }
}
