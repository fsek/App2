import 'dart:math';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:fsek_mobile/screens/moose_game/game_object.dart';
import 'package:fsek_mobile/screens/moose_game/ground.dart';
import 'package:fsek_mobile/screens/moose_game/highscore.dart';
import 'package:fsek_mobile/screens/moose_game/obstacle.dart';
import 'package:fsek_mobile/screens/moose_game/sandwich.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/services/game.service.dart';
import 'package:fsek_mobile/services/user.service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:vector_math/vector_math.dart';

import 'moose.dart';

class MooseGamePage extends StatefulWidget {
  @override
  _MooseGamePageState createState() => _MooseGamePageState();
}

const double floorY = 1;
const double scorePerSecond = 50;
const int obstacleCount = 3;
const double minObstacleDistance = 4;
const double maxObstacleDistance = 14;
const double minSandwichDistance = 14;
const double maxSandwichDistance = 30;

const startGameSpeed = 4;
const maxGameSpeed = 11;
const secondsToReachMaxApprox = 60;

class _MooseGamePageState extends State<MooseGamePage>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  final String idleLink = "assets/img/moose_game/hilbert_scaled_idle.png";
  final String duckingLink = "assets/img/moose_game/hilbert_scaled_ducking.png";
  final Color googleDinosaurColor = Color.fromRGBO(83, 83, 83, 1.0);
  final AudioPlayer soundtrackPlayer = AudioPlayer();
  late Vector2 cameraPos;
  final double gameViewportWidth = 10; // How many mooses should fit-
  late double worldScale;
  double score = 0.0;
  double highscore = 0.0;
  double lastSandwichBonus = 0.0;
  int sandwichBonusPopupFadeout = 0;
  double gameSpeed = 0;
  bool newHighscore = false;

  late AnimationController gameAnimController;
  Duration lastUpdateTime = Duration();

  Moose moose = Moose(-4, floorY);
  List<Obstacle> obstacles = [];
  late int leftmostObstacleIdx = 0;
  late Ground ground1;
  late Ground ground2;
  late Sandwich sandwich;
  late double sandwichOffset;

  bool isDead = false;

  // This keeps track of if the app is in the foreground or background
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) {
      setState(() {
        gameOver();
      });
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    cameraPos = Vector2.zero();
    late int tempuserid;
    locator<UserService>().getUser().then((user) => tempuserid = user.id ?? 0);
    locator<GameScoreService>().getScores().then((users) => {
          highscore = (users.firstWhere((gamescore) => gamescore.user?.id == tempuserid).score ?? 0).toDouble()
        });

    gameAnimController = AnimationController(vsync: this, duration: Duration(days: 6122));
    gameAnimController.addListener(update);

    initializeGame();

    // This works (not)
    isDead = true;
  }

  @override
  void dispose() {
    gameAnimController.stop();
    gameAnimController.dispose();
    soundtrackPlayer.stop();
    soundtrackPlayer.dispose();

    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  void initializeGame() {
    obstacles.add(Obstacle(gameViewportWidth, floorY));
    double previousPos = gameViewportWidth;
    for (int i = 1; i < obstacleCount; i++) {
      previousPos += Random().nextDouble() * (maxObstacleDistance - minObstacleDistance) + minObstacleDistance;
      obstacles.add(Obstacle(previousPos, floorY));
    }
    leftmostObstacleIdx = 0;
    sandwich = Sandwich(0.0, 1.0);
    updateSandwich();

    ground1 = Ground(-Ground.groundWidth / 2, floorY - 1 / 2);
    ground2 = Ground(Ground.groundWidth / 2, floorY - 1 / 2);
    soundtrackPlayer.setSource(AssetSource('audio/moosegame.mp3'));
    soundtrackPlayer.setReleaseMode(ReleaseMode.loop);
    soundtrackPlayer.resume();
  }

  void update() {
    // Clamp since restart results in negative elapsed time.
    double deltaTime = max(0, (gameAnimController.lastElapsedDuration! - lastUpdateTime).inMilliseconds / 1000.0);
    Size screenSize = MediaQuery.of(context).size;
    double totalElapsedTime = score / scorePerSecond;
    gameSpeed = 1 / (1 + exp(-totalElapsedTime * 4 / secondsToReachMaxApprox)) * (maxGameSpeed + startGameSpeed) - startGameSpeed;

    moose.gameSpeed = gameSpeed;
    moose.update(deltaTime);

    ground1.position.x -= gameSpeed * deltaTime;
    ground2.position.x -= gameSpeed * deltaTime;

    if (ground1.position.x < -Ground.groundWidth) {
      setState(() {
        ground1.position.x = ground2.position.x + Ground.groundWidth;
      });
    }

    if (ground2.position.x < -Ground.groundWidth) {
      setState(() {
        ground2.position.x = ground1.position.x + Ground.groundWidth;
      });
    }

    Rect mooseRect = getGameObjectCameraRect(screenSize, moose, 0.45);//.deflate(10);
    for (Obstacle obst in obstacles) {
      obst.position.x -= (gameSpeed + obst.speed) * deltaTime;
      Rect obstRect = getGameObjectCameraRect(screenSize, obst, 0.45);//.deflate(11);
      if (mooseRect.overlaps(obstRect)) {
        gameOver();
        return;
      }

      if (obst.position.x < -gameViewportWidth) {
        setState(() {
          //print(obstacles[(leftmostObstacleIdx - 1) % obstacleCount].position.x);
          obst.position.x = max(gameViewportWidth, obstacles[(leftmostObstacleIdx - 1) % obstacleCount].position.x + Random().nextDouble() * (maxObstacleDistance - minObstacleDistance) + minObstacleDistance);

          obst.randomize();
          leftmostObstacleIdx = (leftmostObstacleIdx + 1) % obstacleCount;
        });
      }
    }

    // Sandwich moves a bit slower (because why not)
    sandwichBonusPopupFadeout = max(0, sandwichBonusPopupFadeout - 1);
    sandwich.position.x -= gameSpeed * deltaTime * 0.3;
    sandwich.position.y =
        1.0 + 1.0 * (sin(1.2 * sandwich.position.x + sandwichOffset) + 1.0);
    Rect sandwichRect =
        getGameObjectCameraRect(screenSize, sandwich, 0.55);//.deflate(10);
    if (mooseRect.overlaps(sandwichRect)) {
      setState(() {
        lastSandwichBonus = score * 0.05;
        score *= 1.05;
        sandwichBonusPopupFadeout = 127;
        updateSandwich();
      });
    }
    if (sandwich.position.x < -gameViewportWidth) {
      updateSandwich();
    }

    setState(() {
      score += deltaTime * scorePerSecond;
    });
    lastUpdateTime = gameAnimController.lastElapsedDuration!;
  }

  void updateSandwich() {
    setState(() {
      sandwich.position.x = sandwich.position.x +
          Random().nextDouble() * (maxSandwichDistance - minSandwichDistance) +
          minSandwichDistance;
      sandwichOffset = Random().nextDouble() * 2.0 * pi;
    });
  }

  void gameOver() {
    //print(locator<ThemeService>().theme.brightness.toString());
    gameAnimController.stop();
    soundtrackPlayer.stop();
    soundtrackPlayer.setReleaseMode(ReleaseMode.stop);
    soundtrackPlayer.play(AssetSource('audio/gameoverfart.mp3'));
    setState(() {
      sandwichBonusPopupFadeout = 0;
      if (score > highscore) {
        highscore = score;
        newHighscore = true;
        locator<GameScoreService>().postScore(score: highscore.toInt());
      }
      isDead = true;
    });
  }

  Rect getGameObjectCameraRect(Size screenSize, GameObject gameObject, double deflation) {
    return Rect.fromCenter(
      center: Offset(
          screenSize.width / 2 + (gameObject.position.x - cameraPos.x) * worldScale * 24,
          screenSize.height / 2 - (gameObject.position.y + cameraPos.y) * worldScale * 24),
      width: gameObject.sprite.imageWidth * worldScale * deflation,
      height: gameObject.sprite.imageHeight * worldScale * deflation,
    );
  }

  void restart() async {
    ConnectivityResult connectivityResult;
    connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
    } else {
      setState(() {
        moose.reset();
        score = 0;
        obstacles.clear();
        initializeGame();
        isDead = false;
        newHighscore = false;
        gameAnimController.forward();
      });
    }
  }

  Widget getGameObjectWidget(GameObject gameObject, Size screenSize) {
    return AnimatedBuilder(
        animation: gameAnimController,
        builder: (context, _) {
          // Rect needs to be defined here for it to update during the game animation.
          Rect rect = getGameObjectCameraRect(screenSize, gameObject, 1.0);
          return Positioned(
            left: rect.left,
            top: rect.top,
            width: rect.width,
            height: rect.height,
            child: gameObject.render(Size(rect.width, rect.height), worldScale),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    Size screenSize = MediaQuery.of(context).size;
    worldScale = screenSize.width / (gameViewportWidth * 24);
    //print(worldScale);

    List<Widget> children = [getGameObjectWidget(moose, screenSize)];

    // Score counter
    children.add(Positioned.fill(
        top: -370,
        child: Align(
            alignment: Alignment.center,
            child: Text(
              score.toInt().toString(),
              style: const TextStyle(fontFamily: "NF-Pixels", fontSize: 60),
            ))));

    // Sandwhich bonus popup
    children.add(Positioned.fill(
        top: -270,
        child: Align(
            alignment: Alignment.center,
            child: Text(
              "+" + lastSandwichBonus.toInt().toString(),
              style: new TextStyle(
                  fontFamily: "NF-Pixels",
                  fontSize: 50,
                  color: Theme.of(context).colorScheme.onBackground.withAlpha(sandwichBonusPopupFadeout)),
            ))));

    // Highscore counter
    children.add(Positioned.fill(
        top: -460,
        child: Align(
            alignment: Alignment.center,
            child: Text(
              "Highscore: " + highscore.toInt().toString(),
              style: const TextStyle(fontFamily: "NF-Pixels", fontSize: 40),
            ))));

    // "Try again" text
    if (isDead) {
      children.add(Positioned.fill(
          top: 200,
          child: Align(
              alignment: Alignment.center,
              child: Text(
                "Touch to try again",
                style: const TextStyle(fontFamily: "NF-Pixels", fontSize: 40),
              ))));

      if (newHighscore) {
        children.add(Positioned.fill(
            top: -570,
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  "New Highscore",
                  style: const TextStyle(fontFamily: "NF-Pixels", fontSize: 50),
                ))));
      }
    }

    for (GameObject gameObject in obstacles) {
      children.add(getGameObjectWidget(gameObject, screenSize));
    }
    children.add(getGameObjectWidget(ground1, screenSize));
    children.add(getGameObjectWidget(ground2, screenSize));
    children.add(getGameObjectWidget(sandwich, screenSize));

    return Scaffold(
      appBar: AppBar(
        title: Text("Moose Game"),
        actions: [
          // Add actions here
          IconButton(
            icon: Icon(soundtrackPlayer.volume == 1 ? Icons.volume_up : Icons.volume_off, color: Theme.of(context).colorScheme.onPrimary), // Mute icon
            onPressed: () {
              if (soundtrackPlayer.volume == 1) {
                soundtrackPlayer.setVolume(0);
              } else {
                soundtrackPlayer.setVolume(1);
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.emoji_events, color: Theme.of(context).colorScheme.onPrimary), // Trophy icon
            onPressed: () {
              gameOver();
              Future.delayed(Duration(milliseconds: 500));
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HighscorePage()),
              );
            },
          ),
        ],
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTapDown: (_) {
          if (isDead) {
            restart();
          } else {
            moose.triggerJump();
            //AudioPlayer().play()
          }
        },
        onTapUp: (_) {
          if (!isDead) {
            moose.triggerFall();
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: children,
        ),
      ),
    );
  }
}
