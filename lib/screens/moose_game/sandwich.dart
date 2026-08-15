import 'package:vector_math/vector_math.dart';
import 'package:fsek_mobile/screens/moose_game/game_object.dart';
import 'package:fsek_mobile/screens/moose_game/game_theme.dart';

class Sandwich extends GameObject {
  Sandwich(double xPosition, double floorY)
      : super(Vector2(xPosition, floorY)) {
    sprite = pickupSprite;
  }

  @override
  void update(double deltaTime) {}
}
