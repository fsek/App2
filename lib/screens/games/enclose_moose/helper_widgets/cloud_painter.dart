import "dart:math" as math;
import "package:flutter/material.dart";

class CloudPainter extends CustomPainter {
  CloudPainter({
    this.minPuffs = 7,
    this.puffVariance = 5,
    this.minAngular = 0.15,
    this.angularVariance = 0.2,
    this.minRadial = 0,
    this.radialVariance = 0.15,
    this.bulgeFactor = 0.3,
    this.color = Colors.white
  });

  final int minPuffs;
  final int puffVariance;
  final double minAngular;
  final double angularVariance;
  final double minRadial;
  final double radialVariance;
  final double bulgeFactor;
  final Color color;

  final _rng = math.Random();

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width * 0.5, size.height * 0.5);
    final a = size.width * 0.5;  // could divide by sqrt(2) to ensure the bounds are enclosed within the ellipse but then the size becomes more unpredictable and harder for the dots
    final b = size.height * 0.5;

    final numPuffs = minPuffs + _rng.nextInt(puffVariance);

    // Create lookup table for ellipse arc lengths by angle (index)
    const tableResolution = 360;
    const stepAngle = 2 * math.pi / tableResolution;

    final List<double> arcLengthTable = [0.0];
    double accumulatedLength = 0.0;
    Offset prevPos = Offset(center.dx + a, center.dy);
    for (int i = 0; i < tableResolution; i++) {
      final angle = i * stepAngle;
      final currentPos = Offset(center.dx + a * math.cos(angle), center.dy + b * math.sin(angle));
      accumulatedLength += (currentPos - prevPos).distance;
      arcLengthTable.add(accumulatedLength);
      prevPos = currentPos;
    }

    // Sample (jittered) points along the ellipse, spaced by arcLengths from lookup table
    final distanceStep = accumulatedLength / numPuffs;
    final List<Offset> points = [];
    for (int i = 0; i < numPuffs; i++) {
      final aJitter = minAngular + _rng.nextDouble() * angularVariance;
      final targetDistance = (i + aJitter) * distanceStep;
      final targetIndex = arcLengthTable.indexWhere((length) => length > targetDistance) - 1;

      // Linearly interpolate targetDistance angle from lookup table
      final t = (targetDistance - arcLengthTable[targetIndex]) / (arcLengthTable[targetIndex + 1] - arcLengthTable[targetIndex]);
      final angle = (targetIndex + t) * stepAngle;

      final rJitter = minRadial + _rng.nextDouble() * radialVariance;
      final rx = a * (1 + rJitter);
      final ry = b * (1 + rJitter);

      points.add(Offset(
        center.dx + rx * math.cos(angle),
        center.dy + ry * math.sin(angle),
      ));
    }

    final path = Path();
    path.moveTo(points[0].dx, points[0].dy);

    // Draw cubic Bézier curves between sampled points
    for (int i = 0; i < numPuffs; i++) {
      final p1 = points[i];
      final p2 = points[(i + 1) % numPuffs];

      final dx = p2.dx - p1.dx;
      final dy = p2.dy - p1.dy;
      final segLen = math.sqrt(dx * dx + dy * dy);

      // Control points on 1/4 and 3/4 of the arc length between points
      final base1 = Offset(p1.dx + dx * 0.25, p1.dy + dy * 0.25);
      final base2 = Offset(p1.dx + dx * 0.75, p1.dy + dy * 0.75);

      // Unit normal (outward) to ellipse surface
      final normX = dy / segLen;
      final normY = -dx / segLen;

      final bulge = segLen * bulgeFactor;  // Bulge out proportional to segLen
      final controlPoint1 = Offset(
        base1.dx + normX * bulge,
        base1.dy + normY * bulge,
      );
      final controlPoint2 = Offset(
        base2.dx + normX * bulge,
        base2.dy + normY * bulge,
      );

      path.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx, controlPoint2.dy, p2.dx, p2.dy);
    }

    final cloudPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, cloudPaint);

    // final largeCenter = Offset(size.width * 0.55, size.height + 25);
    // canvas.drawCircle(largeCenter, 7, cloudPaint);

    // final smallCenter = Offset(size.width * 0.5, size.height + 40);
    // canvas.drawCircle(smallCenter, 4, cloudPaint);
  }

  @override
  bool shouldRepaint(covariant CloudPainter oldDelegate) {
    return true;
  }
}
