import 'dart:math';
import 'package:vector_math/vector_math.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'dart:ui';

import 'package:fsek_mobile/screens/moose_game/game_object.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/services/theme.service.dart';

import 'sprite.dart';

List<Sprite> possibleSprites = [
  // Use the dark mode sprite if needed
  Sprite(locator<ThemeService>().theme.brightness == Brightness.light ? 
        "assets/img/moose_game/kiosk.png" :
        "assets/img/moose_game/kiosk_d.png", 24, 24),
  Sprite(locator<ThemeService>().theme.brightness == Brightness.light ?
        "assets/img/moose_game/f_rubik.png" :
        "assets/img/moose_game/f_rubik_d.png", 24, 24),
  Sprite(locator<ThemeService>().theme.brightness == Brightness.light ?
        "assets/img/moose_game/v_nails.png" :
        "assets/img/moose_game/v_nails_d.png", 24, 24),
];

class Obstacle extends GameObject {

  Obstacle(double xPosition, double floorY) : super(Vector2(xPosition, floorY)) {
    sprite = possibleSprites[Random().nextInt(possibleSprites.length)];
  }

  @override
  void update(double deltaTime) {
    
  }
}