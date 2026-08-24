import "dart:math" as math;
import "package:flutter/material.dart";

class WigglingWidget extends StatefulWidget {
  const WigglingWidget({
    super.key,
    required this.child,
    required this.controller,
    this.frequency = 2,
    this.maxTranslate = const Offset(2, 1),
    this.maxRotate = 1
  });

  final Widget child;
  final AnimationController? controller;
  final double frequency;
  final Offset maxTranslate;
  final double maxRotate;

  @override
  State<WigglingWidget> createState() => _WigglingWidgetState();
}

class _WigglingWidgetState extends State<WigglingWidget> {
  final _random = math.Random();

  Offset _currentOffset = Offset.zero;
  double _currentRotation = 0;

  int _lastStep = -1;

  @override
  Widget build(BuildContext context) {
    if (widget.controller == null) {
      return widget.child;
    }

    return AnimatedBuilder(
      animation: widget.controller!,
      builder: (context, child) {
        final step = (widget.controller!.value * widget.frequency).floor();

        if (step != _lastStep) {
          _currentOffset = widget.maxTranslate * (_random.nextDouble() * 2 - 1);
          _currentRotation = (_random.nextDouble() * 2 - 1) * widget.maxRotate * math.pi / 180;

          _lastStep = step;

          // print("Updated! to $_currentOffset, $_currentRotation");
        }

        return Transform.translate(
          offset: _currentOffset,
          child: Transform.rotate(
            angle: _currentRotation,
            child: widget.child
          )
        );
      },
    );
  }
}
