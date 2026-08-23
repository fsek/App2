import "dart:math" as math;
import "package:flutter/material.dart";

class SmoothArrowPainter extends CustomPainter {
  const SmoothArrowPainter({
    required this.flatIndices,
    required this.gridWidth,
    required this.cellSize,
    this.extraLength = 0,
    this.extraDirection,
    required this.animationProgress,
    this.showArrowHead = true,
    this.lineColor = Colors.white,
    this.idleProgress,
    this.frequency,
    this.speed = 1
  });

  final List<int> flatIndices;
  final int gridWidth;
  final double cellSize;
  final double extraLength;
  final AxisDirection? extraDirection;
  final double animationProgress;
  final bool showArrowHead;
  final Color lineColor;
  final double? idleProgress;
  final double? frequency;
  final double speed;

  @override
  void paint(Canvas canvas, Size size) {
    if (flatIndices.length == 0) return;

    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = cellSize / 15
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = _buildSmoothPath(flatIndices);
    _drawAnimatedDashedPath(canvas, path, paint, animationProgress, idleProgress ?? 0, frequency);

    if (showArrowHead && animationProgress > 0) {
      final metrics = path.computeMetrics().toList();
      final totalLength = metrics.fold(
        0.0,
        (sum, metric) => sum + metric.length,
      );
      double remaining = totalLength * animationProgress;    

      for (final metric in metrics) {
        if (remaining <= metric.length) {
          final tangent = metric.getTangentForOffset(remaining);
          if (tangent == null) return;

          _drawArrowHead(canvas, paint, tangent.position, -tangent.angle);  // for some reason angle needs to be negated

          return;
        }

        remaining -= metric.length;
      }
    }
  }

  Offset _getCoords(int flatIndex, int gridWidth, double cellSize) {
    final rowIndex = flatIndex ~/ gridWidth;
    final columnIndex = flatIndex % gridWidth;

    return Offset(
      (columnIndex + 0.5) * cellSize,
      (rowIndex + 0.5) * cellSize
    );
  }

  Path _buildSmoothPath(List<int> flatIndices) {
    final points = flatIndices.map((flatIndex) => _getCoords(flatIndex, gridWidth, cellSize)).toList();

    final path = Path();
    path.moveTo(points.first.dx, points.first.dy);

    for (int i = 1; i < points.length - 1; i++) {
      final rowIndexDiff = (flatIndices[i + 1] ~/ gridWidth - flatIndices[i] ~/ gridWidth).abs();
      final columnIndexDiff = (flatIndices[i + 1] % gridWidth - flatIndices[i] % gridWidth).abs();
      if (rowIndexDiff + columnIndexDiff != 1) {
        // Avoid discontinuities (portals)
        path.moveTo(points[i + 1].dx, points[i + 1].dy);
        i++;  // Since we use i + 1 here, skip that one.

        continue;
      }

      final prev = points[i - 1];
      final current = points[i];
      final next = points[i + 1];

      final incoming = current - prev;
      final outgoing = next - current;

      final incomingLength = incoming.distance;
      final outgoingLength = outgoing.distance;

      final radius = math.min(incomingLength, outgoingLength) / 2;

      final start = current - incoming / incomingLength * radius;
      final end = current + outgoing / outgoingLength * radius;

      path.lineTo(start.dx, start.dy);
      path.quadraticBezierTo(current.dx, current.dy, end.dx, end.dy);
    }

    path.lineTo(points.last.dx, points.last.dy);

    // if (path.computeMetrics().length == 0) return path;

    final metric = path.computeMetrics().last;
    final tangent = metric.getTangentForOffset(metric.length);
    final directionAngleDict = {
      AxisDirection.up: math.pi / 2,
      AxisDirection.down: -math.pi / 2,
      AxisDirection.left: math.pi,
      AxisDirection.right: 0
    };
    final usedAngle = directionAngleDict[extraDirection] ?? tangent!.angle;
    path..lineTo(
      points.last.dx + extraLength * math.cos(usedAngle),
      points.last.dy - extraLength * math.sin(usedAngle)
    );

    return path;
  }

  void _drawArrowHead(Canvas canvas, Paint paint, Offset tip, double angle) {
    final arrowLength = cellSize / 2;
    const spread = math.pi / 6;

    final path = Path()
      ..moveTo(tip.dx, tip.dy)
      ..lineTo(
        tip.dx - arrowLength * math.cos(angle - spread),
        tip.dy - arrowLength * math.sin(angle - spread),
      )
      ..moveTo(tip.dx, tip.dy)
      ..lineTo(
        tip.dx - arrowLength * math.cos(angle + spread),
        tip.dy - arrowLength * math.sin(angle + spread),
      );

    canvas.drawPath(path, paint);
  }

  void _drawAnimatedDashedPath(Canvas canvas, Path path, Paint paint, double animationProgress, double idleProgress, double? frequency) {
    final dash = cellSize * 3 / 5;
    final gap = cellSize * 2 / 5;

    final startDistance;
    if (frequency == null) {
      startDistance = speed * (idleProgress - 1) * (dash + gap);
    } else {
      final step = (idleProgress * frequency).floor();
      startDistance = (step - frequency) * (dash + gap) / frequency;
    }

    final metrics = path.computeMetrics().toList();
    final totalLength = metrics.fold(
      0.0,
      (sum, metric) => sum + metric.length,
    );
    double remaining = totalLength * animationProgress;
    for (final metric in metrics) {
      if (remaining <= 0) break;

      final visibleLength = math.min(remaining, metric.length);

      double distance = startDistance;  // consider making this discrete instead to get stuttering animations like the rest of the idle animations
      while (distance < visibleLength) {
        final start = distance;
        final end = math.min(start + dash, visibleLength);

        canvas.drawPath(metric.extractPath(start, end), paint);
        distance += dash + gap;
      }

      remaining -= visibleLength;
    }
  }

  @override
  bool shouldRepaint(covariant SmoothArrowPainter oldDelegate) {
    return oldDelegate.animationProgress != animationProgress || oldDelegate.idleProgress != idleProgress;
  }
}
