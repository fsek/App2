import 'package:flutter/widgets.dart';
import 'package:vector_math/vector_math.dart';

import 'sprite.dart';

abstract class GameObject {
  late Vector2 position;
  late Sprite sprite;

  GameObject(this.position);

  Widget render(double pixelsPerUnit) {
    return Image.asset(
      sprite.imagePath,
      scale: 1 / (pixelsPerUnit / sprite.imageWidth),
      width: pixelsPerUnit,
      height: pixelsPerUnit,
      filterQuality: FilterQuality.none,
      );
  }
  void update(double deltaTime);
}