import 'dart:math';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:fsek_mobile/screens/games/moose_game/game_object.dart';
import 'package:fsek_mobile/screens/games/moose_game/game_theme.dart';
import 'package:fsek_mobile/screens/games/moose_game/ground.dart';
import 'package:fsek_mobile/screens/games/moose_game/highscore.dart';
import 'package:fsek_mobile/screens/games/moose_game/obstacle.dart';
import 'package:fsek_mobile/screens/games/moose_game/sandwich.dart';
import 'package:fsek_mobile/services/api.service.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';
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
  double _volume = 0;

  late AnimationController gameAnimController;
  Duration lastUpdateTime = Duration();

  Moose moose = Moose(-4, floorY);
  List<Obstacle> obstacles = [];
  late int leftmostObstacleIdx = 0;
  late Ground ground1;
  late Ground ground2;
  late Sandwich sandwich;
  late double sandwichOffset;
  String mooseGameToken =
      const String.fromEnvironment('MOOSE_GAME_SECRET', defaultValue: '');

  bool isDead = false;

  // This keeps track of if the app is in the foreground or background
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) {
      if (!isDead)
        setState(() {
          gameOver();
        });
    }
  }

  @override
  void initState() {
    super.initState();

    ApiService.apiClient.getUsersApi().usersGetMe().then((user) => {
          user.data != null
              ? highscore = user.data!.mooseGameScore.toDouble()
              : highscore = 0
        });

    WidgetsBinding.instance.addObserver(this);

    cameraPos = Vector2.zero();

    // locator<UserService>().getUser().then((user) => tempuserid = user.id ?? 0);
    // locator<GameScoreService>().getScores().then((users) => {
    //       highscore = (users
    //                   .firstWhere(
    //                       (gamescore) => gamescore.user?.id == tempuserid)
    //                   .score ??
    //               0)
    //           .toDouble()
    //     });

    gameAnimController =
        AnimationController(vsync: this, duration: Duration(days: 6122));
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
    gameSpeed = startGameSpeed.toDouble();
    obstacles.add(Obstacle(gameViewportWidth, floorY));
    double previousPos = gameViewportWidth;
    for (int i = 1; i < obstacleCount; i++) {
      previousPos +=
          Random().nextDouble() * (maxObstacleDistance - minObstacleDistance) +
              minObstacleDistance;
      obstacles.add(Obstacle(previousPos, floorY));
      separateFromWall(obstacles.last);
    }
    leftmostObstacleIdx = 0;
    sandwich = Sandwich(0.0, 1.0);
    updateSandwich();

    ground1 = Ground(-Ground.groundWidth / 2, floorY - 1 / 2);
    ground2 = Ground(Ground.groundWidth / 2, floorY - 1 / 2);
    soundtrackPlayer.setSource(AssetSource('audio/moosegame.mp3'));
    soundtrackPlayer.setReleaseMode(ReleaseMode.loop);
    soundtrackPlayer.setVolume(_volume);
    soundtrackPlayer.resume();
  }

  void update() {
    // Clamp since restart results in negative elapsed time.
    double deltaTime = max(
        0,
        (gameAnimController.lastElapsedDuration! - lastUpdateTime)
                .inMilliseconds /
            1000.0);
    Size screenSize = MediaQuery.of(context).size;
    double totalElapsedTime = score / scorePerSecond;
    gameSpeed = 1 /
            (1 + exp(-totalElapsedTime * 4 / secondsToReachMaxApprox)) *
            (maxGameSpeed + startGameSpeed) -
        startGameSpeed;

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

    Rect mooseRect =
        getGameObjectCameraRect(screenSize, moose, 0.45); //.deflate(10);
    for (Obstacle obst in obstacles) {
      obst.position.x -= (gameSpeed + obst.speed) * deltaTime;
      Rect obstRect =
          getGameObjectCameraRect(screenSize, obst, 0.45); //.deflate(11);
      if (mooseRect.overlaps(obstRect)) {
        gameOver();
        return;
      }

      if (obst.position.x < -gameViewportWidth) {
        setState(() {
          //print(obstacles[(leftmostObstacleIdx - 1) % obstacleCount].position.x);
          obst.position.x = max(
              gameViewportWidth,
              obstacles[(leftmostObstacleIdx - 1) % obstacleCount].position.x +
                  Random().nextDouble() *
                      (maxObstacleDistance - minObstacleDistance) +
                  minObstacleDistance);

          obst.randomize();
          separateFromWall(obst);
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
        getGameObjectCameraRect(screenSize, sandwich, 0.55); //.deflate(10);
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

  /// Seconds until an obstacle reaches the moose
  double? timeToMoose(Obstacle obst) {
    double closingSpeed = gameSpeed + obst.speed;
    if (closingSpeed <= 0) return null;
    return (obst.position.x - moose.position.x) / closingSpeed;
  }

  /// Called for each new obstacle, and checks if they could form a wall with
  /// another obstacle which is impossible to both jump over (regular obstacle)
  /// and run under (ufo). If so, push it out of the way.
  void separateFromWall(Obstacle obst) {
    double closingSpeed = gameSpeed + obst.speed;
    if (closingSpeed <= 0) return;
    for (int pass = 0; pass < 4; pass++) { // 4 tries at pushing it out of the way
      bool moved = false;
      for (Obstacle other in obstacles) {
        if (identical(other, obst) || other.flying == obst.flying) continue;
        double? arrival = timeToMoose(obst);
        double? otherArrival = timeToMoose(other);
        if (arrival == null || otherArrival == null) continue; // Already passed
        if ((arrival - otherArrival).abs() >= wallGuardSeconds) continue;
        obst.position.x =
            moose.position.x + (otherArrival + wallGuardSeconds) * closingSpeed;
        moved = true;
      }
      if (!moved) break; // No more walls, we're done
    }

    // Overlap check. We don't want overlapping obstacles, so pop it off the
    // left edge. update() recycles anything past there, so it gets a
    // fresh position and type on one of the next frames.
    for (Obstacle other in obstacles) {
      if (identical(other, obst) || other.flying != obst.flying) continue;
      if ((other.position.x - obst.position.x).abs() < minObstacleDistance) {
        obst.position.x = -gameViewportWidth - 1;
      }
    }
  }

  void updateSandwich() {
    setState(() {
      sandwich.position.x = sandwich.position.x +
          Random().nextDouble() * (maxSandwichDistance - minSandwichDistance) +
          minSandwichDistance;
      sandwichOffset = Random().nextDouble() * 2.0 * pi;
    });
  }

  void gameOver() async {
    gameAnimController.stop();
    soundtrackPlayer.stop();
    soundtrackPlayer.setReleaseMode(ReleaseMode.stop);
    soundtrackPlayer.play(AssetSource('audio/gameoverfart.mp3'));

    setState(() {
      sandwichBonusPopupFadeout = 0;
      isDead = true;
    });

    if (score > highscore) {
      highscore = score;
      setState(() {
        newHighscore = true;
      });
      await ApiService.apiClient
          .getMooseGameApi()
          .mooseGameUpdateMouseGameScore(
              score: score.toInt(),
              headers: {'moose-game-token': mooseGameToken});
    }
  }

  // void gameOver() {
  //   //print(locator<ThemeService>().theme.brightness.toString());
  //   gameAnimController.stop();
  //   soundtrackPlayer.stop();
  //   soundtrackPlayer.setReleaseMode(ReleaseMode.stop);
  //   soundtrackPlayer.play(AssetSource('audio/gameoverfart.mp3'));
  //   setState(() async {
  //     sandwichBonusPopupFadeout = 0;
  //     if (score > highscore) {
  //       highscore = score;
  //       newHighscore = true;
  //       await ApiService.apiClient
  //           .getMooseGameApi()
  //           .mooseGameUpdateMouseGameScore(score: score.toInt(), headers: {
  //         'moose-game-token': "sad_secret_key"
  //       }); // TODO change sad_secret_key to mooseGameToken
  //     }
  //     isDead = true;
  //   });
  // }

  Rect getGameObjectCameraRect(
      Size screenSize, GameObject gameObject, double deflation) {
    return Rect.fromCenter(
      center: Offset(
          screenSize.width / 2 +
              (gameObject.position.x - cameraPos.x) * worldScale * 24,
          screenSize.height / 2 -
              (gameObject.position.y + cameraPos.y) * worldScale * 24 +
              // Screen y grows downwards, so a positive nudge is added here.
              gameObject.sprite.yOffset * worldScale),
      width: gameObject.sprite.imageWidth * worldScale * deflation,
      height: gameObject.sprite.imageHeight * worldScale * deflation,
    );
  }

  void restart() async {
    ConnectivityResult connectivityResult;
    List<ConnectivityResult> connectivityResults =
        await Connectivity().checkConnectivity();
    connectivityResult = connectivityResults.isNotEmpty
        ? connectivityResults.first
        : ConnectivityResult.none;
    //connectivityResult = await Connectivity().checkConnectivity();
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
              style: TextStyle(
                  fontFamily: "NF-Pixels",
                  fontSize: 60,
                  color: gameTextColor(context)),
            ))));

    // Sandwhich bonus popup
    children.add(Positioned.fill(
        top: -270,
        child: Align(
            alignment: Alignment.center,
            child: Text(
              "+" + lastSandwichBonus.toInt().toString(),
              style: TextStyle(
                  fontFamily: "NF-Pixels",
                  fontSize: 50,
                  color: gameTextColor(context)
                      .withAlpha(sandwichBonusPopupFadeout)),
            ))));

    // Highscore counter
    children.add(Positioned.fill(
        top: -460,
        child: Align(
            alignment: Alignment.center,
            child: Text(
              "Highscore: " + highscore.toInt().toString(),
              style: TextStyle(
                  fontFamily: "NF-Pixels",
                  fontSize: 40,
                  color: gameTextColor(context)),
            ))));

    // "Try again" text
    if (isDead) {
      children.add(Positioned.fill(
          top: 0,
          child: Align(
              alignment: Alignment.center,
              child: Text(
                "Touch to try again",
                style: TextStyle(
                    fontFamily: "NF-Pixels",
                    fontSize: 40,
                    color: gameTextColor(context)),
              ))));

      if (newHighscore) {
        children.add(Positioned.fill(
            top: -200,
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  "New Highscore",
                  style: TextStyle(
                      fontFamily: "NF-Pixels",
                      fontSize: 50,
                      color: gameTextColor(context)),
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
            icon: Icon(_volume == 1 ? Icons.volume_up : Icons.volume_off,
                color: Theme.of(context).colorScheme.onPrimary), // Mute icon
            onPressed: () {
              if (_volume == 1) {
                _volume = 0;
                soundtrackPlayer.setVolume(_volume);
              } else {
                _volume = 1;
                soundtrackPlayer.setVolume(_volume);
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.emoji_events,
                color: Theme.of(context).colorScheme.onPrimary), // Trophy icon
            onPressed: () {
              gameOver();
              Future.delayed(Duration(milliseconds: 500));
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HighscorePage()),
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
        child: Container(
          color: backgroundColor,
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: children,
          ),
        )
      ),
    );
  }
}
