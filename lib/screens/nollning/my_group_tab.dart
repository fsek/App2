import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fsek_mobile/models/nollning/adventure_mission.dart';
import 'package:fsek_mobile/models/nollning/adventure_mission_week.dart';
import 'package:fsek_mobile/models/nollning/nollning_group.dart';
import 'package:fsek_mobile/screens/nollning/mission.dart';
import 'package:fsek_mobile/services/abstract.service.dart';
import 'package:fsek_mobile/services/nollning.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/services/theme.service.dart';
import 'package:fsek_mobile/util/app_exception.dart';

class MyGroupTab extends StatefulWidget {
  @override
  _MyGroupTabState createState() => _MyGroupTabState();
}

class _MyGroupTabState extends State<MyGroupTab> {
  List<AdventureMissionWeek>? _adventureWeeks;

  void initState() {
    locator<NollningService>().getAdventureWeeks().then((value) => setState(() {
          this._adventureWeeks = value;
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _weekProgressCircle(
                    imgPath: "assets/img/vecka_0.png",
                    progress: 0.7,
                    borderColor: Colors.purple[900]!,
                  ),
                  _weekProgressCircle(
                    imgPath: "assets/img/vecka_1.png",
                    progress: 1.0,
                    borderColor: Colors.blue[900]!,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _weekProgressCircle(
                    imgPath: "assets/img/vecka_4.png",
                    progress: 0.4,
                    borderColor: Colors.orange,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _weekProgressCircle(
                    imgPath: "assets/img/vecka_2.png",
                    progress: 0.8,
                    borderColor: Colors.red[900]!,
                  ),
                  _weekProgressCircle(
                    imgPath: "assets/img/vecka_3.png",
                    progress: 0.1,
                    borderColor: Colors.green[900]!,
                  ),
                ],
              )
            ],
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
}
