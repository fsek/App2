import 'sprite.dart';

class ObstacleDef {
  late Sprite sprite;
  late double spawnWeight;
  late double minSpeed;
  late double maxSpeed;
  late bool flying;

  ObstacleDef(
    sprite, [
    spawnWeight = 1.0,
    minSpeed = 0.0,
    maxSpeed = 0.0,
    flying = false,
  ]) {
    this.sprite = sprite;
    this.spawnWeight = spawnWeight;
    this.minSpeed = minSpeed;
    this.maxSpeed = maxSpeed;
    this.flying = flying;
  }
}
