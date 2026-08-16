import "package:flutter/material.dart";

class AnimatedSprite extends StatefulWidget {
  const AnimatedSprite({
    super.key,
    this.vsync,
    this.shouldAnimate = true,
    this.animationCurve = Curves.linear,
    this.animationFrames,
    this.animationFrameDuration,
    this.animationReverseFrameDuration,
    this.animationWaitTime,
    this.animationReverseWaitTime,
    this.animationWaitFrames,
    this.animationReverseWaitFrames,
    this.shouldIdle = true,
    this.idleFrames,
    this.startIdleFrames,
    this.endIdleFrames,
    this.idleController
  });

  final TickerProvider? vsync;
  final bool shouldAnimate;
  final Curve animationCurve;
  final List<String>? animationFrames;
  final Duration? animationFrameDuration;
  final Duration? animationReverseFrameDuration;
  final double? animationWaitFrames;
  final double? animationReverseWaitFrames;
  final Duration? animationWaitTime;
  final Duration? animationReverseWaitTime;
  final bool shouldIdle;
  final List<String>? idleFrames;
  final List<String>? startIdleFrames;
  final List<String>? endIdleFrames;
  final AnimationController? idleController;

  @override
  State<AnimatedSprite> createState() => _AnimatedSpriteState();
}

class _AnimatedSpriteState extends State<AnimatedSprite> with SingleTickerProviderStateMixin {
  Animation<double> _frameAnimation = const AlwaysStoppedAnimation(0);
  late final AnimationController _controller = AnimationController(vsync: widget.vsync ?? this);

  @override
  void initState() {
    super.initState();

    if (widget.shouldAnimate) {
      _animate(widget, reverse: false);
    }
  }

  @override
  void didUpdateWidget(covariant AnimatedSprite oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!oldWidget.shouldAnimate && widget.shouldAnimate) {
      _animate(widget, reverse: false);
    } else if (oldWidget.shouldAnimate && !widget.shouldAnimate) {
      _animate(oldWidget, reverse: true);
    }
  }

  void _animate(AnimatedSprite usedWidget, {required bool reverse}) {
    if (widget.animationFrames == null) return;

    const defaultFrameDuration = const Duration(milliseconds: 40);

    final usedFrameDuration = usedWidget.animationFrameDuration ?? usedWidget.animationReverseFrameDuration ?? defaultFrameDuration;
    final usedWaitFrames = usedWidget.animationWaitFrames ?? (usedWidget.animationWaitTime?.inMilliseconds ?? 0) / usedFrameDuration.inMilliseconds;

    final usedReverseFrameDuration = usedWidget.animationReverseFrameDuration ?? usedWidget.animationFrameDuration ?? defaultFrameDuration;
    final usedReverseWaitFrames = usedWidget.animationReverseWaitFrames ?? (usedWidget.animationReverseWaitTime?.inMilliseconds ?? 0) / usedReverseFrameDuration.inMilliseconds;

    final begin = -usedWaitFrames;
    final end = usedWidget.animationFrames!.length + usedReverseWaitFrames;

    _controller.duration = usedFrameDuration * (end - begin);
    _controller.reverseDuration = usedReverseFrameDuration * (end - begin);;

    _frameAnimation = Tween(
      begin: begin,
      end: end
    ).animate(CurvedAnimation(parent: _controller, curve: widget.animationCurve));

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
        final animationFramesLength = widget.animationFrames?.length ?? 0;

        final frame = _frameAnimation.value;
        if (!widget.shouldAnimate && !widget.shouldIdle && (frame < 0 || frame > animationFramesLength - 1)) return const SizedBox.shrink();

        if (widget.shouldIdle && widget.idleController != null && (widget.idleFrames != null || widget.startIdleFrames != null || widget.endIdleFrames != null)) {
          if (frame <= 0 || frame >= animationFramesLength) {
            final usedStartIdleFrames = widget.startIdleFrames ?? widget.idleFrames;
            final usedEndIdleFrames = widget.endIdleFrames ?? widget.idleFrames;
            final usedIdleFrames = frame <= 0 ? usedStartIdleFrames : usedEndIdleFrames;
            if (usedIdleFrames?.isEmpty ?? true) return const SizedBox.shrink();

            return AnimatedBuilder(
              animation: widget.idleController!,
              builder: (context, child) {
                final idleFrame = (widget.idleController!.value * usedIdleFrames!.length)
                  .floor()
                  .clamp(0, usedIdleFrames.length - 1);

                return Image.asset(
                  usedIdleFrames[idleFrame],
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.none
                );
              }
            );
          }
        }

        if (widget.animationFrames == null) return const SizedBox.shrink();

        return Image.asset(
          widget.animationFrames![frame.toInt().clamp(0, widget.animationFrames!.length - 1)],
          fit: BoxFit.fill,
          filterQuality: FilterQuality.none
        );
      },
    );
  }
}
