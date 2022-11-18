import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/fredmansky/fredmansky.dart';
import 'package:fsek_mobile/screens/moose_game/game_object.dart';
import 'package:fsek_mobile/screens/moose_game/obstacle.dart';
import 'package:fsek_mobile/services/fredmansky.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:vector_math/vector_math.dart';

import 'moose.dart';

class MooseGamePage extends StatefulWidget {
  @override
  _MooseGamePageState createState() => _MooseGamePageState();
}

const double floorY = 0.5;
const double scorePerSecond = 50;

class _MooseGamePageState extends State<MooseGamePage> with SingleTickerProviderStateMixin {
  final String idleLink = "assets/img/moose_game/hilbert_scaled_idle.png";
  final String duckingLink = "assets/img/moose_game/hilbert_scaled_ducking.png";
  final Color googleDinosaurColor = Color.fromRGBO(83, 83, 83, 1.0);
  late Vector2 cameraPos;
  final double gameViewportWidth = 8;          // How many mooses should fit-
  late double pixelsPerUnit;
  double score = 0.0;
  double gameSpeed = 4;

  late AnimationController gameAnimController;
  Duration lastUpdateTime = Duration();

  Moose moose = Moose(-2, floorY);
  List<Obstacle> obstacles = [Obstacle(floorY)];

  @override
  void initState() {
    super.initState();

    
    cameraPos = Vector2.zero();

    gameAnimController = AnimationController(vsync: this, duration: Duration(days: 6122));
    gameAnimController.addListener(update);
    gameAnimController.forward();
  }

  @override
  void dispose() {
    gameAnimController.stop();
    gameAnimController.dispose();

    super.dispose();
  }

  void update() {
    double deltaTime = (gameAnimController.lastElapsedDuration! - lastUpdateTime).inMilliseconds / 1000.0;
    Size screenSize = MediaQuery.of(context).size;

    moose.update(deltaTime);
    Rect mooseRect = getGameObjectCameraRect(screenSize, moose).deflate(10);
    for (GameObject obst in obstacles) {
      obst.position.x -= gameSpeed * deltaTime;
      Rect obstRect = getGameObjectCameraRect(screenSize, obst).deflate(10);
      if (mooseRect.overlaps(obstRect)) {
        gameOver();
        return;
      }
    }
    setState(() {
      score += deltaTime * scorePerSecond;
    });
    lastUpdateTime = gameAnimController.lastElapsedDuration!;
  }

  void gameOver() {
    gameAnimController.stop();
  }

  Rect getGameObjectCameraRect(Size screenSize, GameObject gameObject) {
    return Rect.fromCenter(
      center: Offset(
        screenSize.width / 2 + (gameObject.position.x - cameraPos.x) * pixelsPerUnit,
        screenSize.height / 2 - (gameObject.position.y + cameraPos.y) * pixelsPerUnit
        ),
      width: pixelsPerUnit,
      height: pixelsPerUnit,
      );
  }

  Widget getGameObjectWidget(GameObject gameObject, Size screenSize) {
    return AnimatedBuilder(
        animation: gameAnimController,
        builder: (context, _) {
          // Rect needs to be defined here for it to update during the game animation.
          Rect rect = getGameObjectCameraRect(screenSize, gameObject);
          return Positioned(
            left: rect.left,
            top: rect.top,
            width: rect.width,
            height: rect.height,
            child: gameObject.render(pixelsPerUnit),
          );
        }
      );
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    Size screenSize = MediaQuery.of(context).size;
    pixelsPerUnit = screenSize.width / gameViewportWidth;

    List<Widget> children = [getGameObjectWidget(moose, screenSize)];
    for (GameObject gameObject in obstacles) {
      children.add(getGameObjectWidget(gameObject, screenSize));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Moose Game"),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => moose.jump(),
        child: Stack(
          alignment: Alignment.center,
          children: children,
        ),
      ),
    );
  }
}
