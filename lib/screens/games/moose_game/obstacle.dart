import 'dart:math';
import 'dart:ui';
import 'package:vector_math/vector_math.dart';

import 'package:fsek_mobile/screens/games/moose_game/game_object.dart';
import 'package:fsek_mobile/screens/games/moose_game/game_theme.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/services/theme.service.dart';
import 'package:fsek_mobile/screens/games/moose_game/obstacle_def.dart';

List<ObstacleDef> obstacles = buildObstacles();

Brightness savedBrightness = locator<ThemeService>().theme.brightness;

class Obstacle extends GameObject {
  double movementSpeed = 0.0;
  bool flying = false;
  final double floorY;

  double get speed {
    return movementSpeed;
  }

  Obstacle(double xPosition, this.floorY)
      : super(Vector2(xPosition, floorY)) {
    randomize();
  }

  void reloadSprites() {
    obstacles = buildObstacles();
  }

  void randomize() {
    if (locator<ThemeService>().theme.brightness != savedBrightness) {
      savedBrightness = locator<ThemeService>().theme.brightness;
      reloadSprites();
    }

    double totalWeight = 0.0;
    List<double> thresholds = [];
    for (int i = 0; i < obstacles.length; i++) {
      totalWeight += obstacles[i].spawnWeight;
      thresholds.add(totalWeight);
    }
    //print(thresholds);
    double choice = totalWeight * Random().nextDouble();
    //print(choice);
    ObstacleDef def = obstacles[0];
    for (int i = 0; i < obstacles.length; i++) {
      if (choice < thresholds[i]) {
        def = obstacles[i];
        break;
      }
    }
    sprite = def.sprite;
    flying = def.flying;
    // Flying obstacles hover just above the running moose
    position.y = def.flying ? flyingObstacleHeight : floorY;
    movementSpeed =
        lerpDouble(def.minSpeed, def.maxSpeed, Random().nextDouble())!;
  }

  @override
  void update(double deltaTime) {}
}
