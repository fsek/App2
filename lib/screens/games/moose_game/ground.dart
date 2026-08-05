import 'package:vector_math/vector_math.dart';
import 'package:fsek_mobile/screens/games/moose_game/game_object.dart';
import 'package:fsek_mobile/screens/games/moose_game/game_theme.dart';

class Ground extends GameObject {
  Ground(double xPosition, double floorY) : super(Vector2(xPosition, floorY)) {
    sprite = groundSprite;
  }
  static const int groundWidth = 10;

  @override
  void update(double deltaTime) {}
}
