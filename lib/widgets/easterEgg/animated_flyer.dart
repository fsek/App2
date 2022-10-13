import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:audioplayers/audioplayers.dart';

const double periodSeconds = 2;
const int refreshIntervalMilliseconds = 10;

class AnimatedFlyer extends StatefulWidget {
  _AnimatedFlyerState createState() => _AnimatedFlyerState();
}

class _AnimatedFlyerState extends State<AnimatedFlyer> {
  double xPos = 0;
  double yPos = 0;

  void animate() async {
    print("Hej");
    AudioPlayer().play(AssetSource('audio/' + toPlay));
    setState(() {
      xPos = 50 +100 *cos(DateTime.now().millisecondsSinceEpoch *2 *pi / (periodSeconds * 1000));
      yPos = -400 + 200 * sin(DateTime.now().millisecondsSinceEpoch * 2*pi/(periodSeconds * 1000));
    });
    await Future.delayed(
        new Duration(milliseconds: refreshIntervalMilliseconds));
    animate();
  }

  @override
  void initState() {
    animate();
    super.initState();
  }

  @override
  void dispose() {
    print("hejdå");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        curve: Curves.ease,
        duration: new Duration(milliseconds: 1),
        left: xPos,
        top: yPos,
        child: Column(children: [
          Text("YOU HAVE BEEN BLEESED",
              style: Theme.of(context).textTheme.headline5),
          Image(
            image: AssetImage("assets/img/memes/wideNils.jpg"),
            width: 300,
          ),
          Text("BY WIDE NILS", style: Theme.of(context).textTheme.headline4)
        ]));
  }
}
