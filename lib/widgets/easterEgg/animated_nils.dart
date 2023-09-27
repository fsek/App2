import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

const double periodSeconds = 2;
const int refreshIntervalMilliseconds = 10;

class AnimatedNils extends StatefulWidget {
  _AnimatedNilsState createState() => _AnimatedNilsState();
}

class _AnimatedNilsState extends State<AnimatedNils>
    with SingleTickerProviderStateMixin {
  double xPos = 0;
  double yPos = 0;
  AnimationController? animation;

  @override
  void initState() {
    super.initState();
    // is broke no time to fix now FIXME
    //AudioPlayer().play(AssetSource('audio/semenMusic.mp3'));
    animation =
        AnimationController(vsync: this, duration: new Duration(seconds: 1))
          ..repeat();
  }

  @override
  void dispose() {
    if (animation != null) animation!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        builder: (_, __) {
          return Positioned(
              left: 50 + 50 * cos(animation!.value * 2 * pi),
              top: -400 + 100 * sin(animation!.value * 2 * pi),
              child: Column(children: [
                Text("YOU HAVE BEEN BLEESED",
                    style: Theme.of(context).textTheme.headlineSmall),
                Image(
                  image: AssetImage("assets/img/memes/wideNils.jpg"),
                  width: 300,
                ),
                Text("BY WIDE NILS",
                    style: Theme.of(context).textTheme.headlineMedium)
              ]));
        },
        animation: animation!);
  }
}
