import "package:flutter/material.dart";
import "smooth_arrow_painter.dart";

class AnimatedSmoothArrow extends StatefulWidget {
  const AnimatedSmoothArrow({
    super.key,
    this.isVisible = true,
    this.onDisappear,
    this.vsync,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeInOut,
    required this.flatIndices,
    required this.gridWidth,
    required this.cellSize,
    this.extraLength = 0,
    this.extraDirection,
    this.showArrowHead = true,
    this.lineColor = Colors.white,
    this.idleController,
    this.frequency
  });

  final bool isVisible;
  final Function? onDisappear;
  final TickerProvider? vsync;
  final Duration duration;
  final Curve curve;
  final List<int> flatIndices;
  final int gridWidth;
  final double cellSize;
  final double extraLength;
  final AxisDirection? extraDirection;
  final Color lineColor;
  final bool showArrowHead;
  final AnimationController? idleController;
  final double? frequency;

  @override
  State<AnimatedSmoothArrow> createState() => _AnimatedSmoothArrowState();
}

class _AnimatedSmoothArrowState extends State<AnimatedSmoothArrow> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: widget.vsync ?? this,
    duration: widget.duration
  );

  @override
  void initState() {
    super.initState();

    if (widget.isVisible) {
      _animate(reverse: false);
    }
  }

  @override
  void didUpdateWidget(covariant AnimatedSmoothArrow oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!oldWidget.isVisible && widget.isVisible) {
      _animate(reverse: false);
    } else if (oldWidget.isVisible && !widget.isVisible) {
      _animate(reverse: true);
    }
  }

  Future<void> _animate({required bool reverse}) async {
    if (!reverse) {
      await _controller.forward();
    } else {
      await _controller.reverse();

      if (mounted && widget.onDisappear != null) {
        widget.onDisappear!();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.idleController == null) {
      return AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return CustomPaint(
            painter: SmoothArrowPainter(
              flatIndices: widget.flatIndices,
              gridWidth: widget.gridWidth,
              cellSize: widget.cellSize,
              extraLength: widget.extraLength,
              extraDirection: widget.extraDirection,
              lineColor: widget.lineColor,
              showArrowHead: widget.showArrowHead,
              animationProgress: widget.curve.transform(_controller.value)
            ),
          );
        },
      );
    }

    return AnimatedBuilder(
      animation: widget.idleController!,
      builder: (context, child) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            return CustomPaint(
              painter: SmoothArrowPainter(
                flatIndices: widget.flatIndices,
                gridWidth: widget.gridWidth,
                cellSize: widget.cellSize,
                extraLength: widget.extraLength,
                extraDirection: widget.extraDirection,
                lineColor: widget.lineColor,
                showArrowHead: widget.showArrowHead,
                animationProgress: widget.curve.transform(_controller.value),
                idleProgress: widget.idleController!.value,
                frequency: widget.frequency
              ),
            );
          },
        );
      }
    );
  }
}
