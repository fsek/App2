class Sprite {
  final String imagePath;
  // Allow fractional sizes so we can scale graphics to exactly line up on a pixel level
  final double imageWidth;
  final double imageHeight;
  // Nudge the sprite. Positive is down.
  final double yOffset;

  const Sprite(this.imagePath, this.imageWidth, this.imageHeight,
      [this.yOffset = 0]);
}
