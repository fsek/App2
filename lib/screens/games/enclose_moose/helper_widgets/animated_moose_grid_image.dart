import "package:flutter/material.dart";

class AnimatedMooseGridImage extends StatefulWidget {
  const AnimatedMooseGridImage({
    super.key,
    this.isVisible = true,
    required this.frames,
    this.vsync,
    this.frameDuration,
    this.reverseFrameDuration,
    this.waitTime,
    this.reverseWaitTime,
    this.waitFrames,
    this.reverseWaitFrames,
    this.idleFrames,
    this.idleController
  });

  final bool isVisible;
  final List<String> frames;
  final TickerProvider? vsync;
  final Duration? frameDuration;
  final Duration? reverseFrameDuration;
  final double? waitFrames;
  final double? reverseWaitFrames;
  final Duration? waitTime;
  final Duration? reverseWaitTime;
  final List<String>? idleFrames;
  final AnimationController? idleController;

  @override
  State<AnimatedMooseGridImage> createState() => _AnimatedMooseGridImageState();
}

class _AnimatedMooseGridImageState extends State<AnimatedMooseGridImage> with SingleTickerProviderStateMixin {
  Animation<double> _frameAnimation = const AlwaysStoppedAnimation(0);
  late final AnimationController _controller = AnimationController(vsync: widget.vsync ?? this);

  @override
  void initState() {
    super.initState();

    if (widget.isVisible) {
      _animate(widget, reverse: false);
    }
  }

  @override
  void didUpdateWidget(covariant AnimatedMooseGridImage oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!oldWidget.isVisible && widget.isVisible) {
      _animate(widget, reverse: false);
    } else if (oldWidget.isVisible && !widget.isVisible) {
      _animate(oldWidget, reverse: true);
    }
  }

  void _animate(AnimatedMooseGridImage usedWidget, {required bool reverse}) {
    final usedFrameDuration = usedWidget.frameDuration ?? usedWidget.reverseFrameDuration ?? const Duration(milliseconds: 40);
    final usedWaitFrames = usedWidget.waitFrames ?? (usedWidget.waitTime?.inMilliseconds ?? 0) / usedFrameDuration.inMilliseconds;

    final usedReverseFrameDuration = usedWidget.reverseFrameDuration ?? usedWidget.frameDuration ?? const Duration(milliseconds: 40);
    final usedReverseWaitFrames = usedWidget.reverseWaitFrames ?? (usedWidget.reverseWaitTime?.inMilliseconds ?? 0) / usedReverseFrameDuration.inMilliseconds;

    final begin = -usedWaitFrames;
    final end = usedWidget.frames.length - 1 + usedReverseWaitFrames;

    _controller.duration = usedFrameDuration * (end - begin);
    _controller.reverseDuration = usedReverseFrameDuration * (end - begin);;

    _frameAnimation = Tween(
      begin: begin,
      end: end
    ).animate(_controller);

    if (!reverse) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _frameAnimation,
      builder: (context, child) {
        final frame = _frameAnimation.value;
        if (frame < 0 || (frame == 0 && !widget.isVisible)) return const SizedBox.shrink();

        if (widget.idleFrames != null && widget.idleController != null && widget.idleFrames!.length > 0 && frame >= widget.frames.length - 1) {  // && _frameAnimation.isCompleted) {
          return AnimatedBuilder(
            animation: widget.idleController!,
            builder: (context, child) {
              final idleFrame = (widget.idleController!.value * widget.idleFrames!.length)
                .floor()
                .clamp(0, widget.idleFrames!.length - 1);

              return Image.asset(
                widget.idleFrames![idleFrame],
                fit: BoxFit.fill,
                filterQuality: FilterQuality.none
              );
            }
          );
        }

        return Image.asset(
          widget.frames[frame.toInt().clamp(0, widget.frames.length - 1)],
          fit: BoxFit.fill,
          filterQuality: FilterQuality.none
        );
      },
    );
  }
}
