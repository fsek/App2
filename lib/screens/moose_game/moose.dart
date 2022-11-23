import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:fsek_mobile/screens/moose_game/game_object.dart';
import 'package:fsek_mobile/screens/moose_game/sprite.dart';
import 'package:vector_math/vector_math.dart';

enum MooseState {
  running,
  jumping,
  ducking
}

class Moose extends GameObject {
  Sprite mooseRun = Sprite("assets/img/moose_game/hilbert_pixel_run.gif", 24, 24);
  Sprite mooseDuck = Sprite("assets/img/moose_game/hilbert_pixel_duck.png", 24, 24);
  
  double yVelocity = 0;
  final double jumpForce = 10;
  final double gravity = 38;
  MooseState state = MooseState.running;

  late double floorY;

  Moose(double xPosition, this.floorY) : super(Vector2(xPosition, floorY)) {
    sprite = mooseRun;
  }

  @override
  void update(double deltaTime) {
    position.y += yVelocity * deltaTime;
    if (position.y - floorY <= 0) {
      position.y = floorY;
      yVelocity = 0;
      state = MooseState.running;
    }
    else {
      yVelocity -= gravity * deltaTime;
    }
  }

  void jump() {
    if (state != MooseState.jumping) {
      state = MooseState.jumping;
      yVelocity = jumpForce;
    }
  }

  void reset() {
    yVelocity = 0;
    state = MooseState.running;
    position.y = floorY;
  }
}