import "package:flutter/material.dart";
import "wiggling_widget.dart";
import "cloud_painter.dart";

class AnimatedThoughtBubble extends StatefulWidget {
  final String text;

  const AnimatedThoughtBubble({
    super.key,
    this.isVisible = true,
    this.onDisappear,
    this.vsync,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeOutBack,
    required this.text,
    this.minPuffs = 7,
    this.puffVariance = 5,
    this.minAngular = 0.15,
    this.angularVariance = 0.2,
    this.minRadial = 0,
    this.radialVariance = 0.15,
    this.bulgeFactor = 0.3,
    this.color = Colors.white,
    this.idleController,
    this.frequency = 2
  });

  final bool isVisible;
  final Function? onDisappear;
  final TickerProvider? vsync;
  final Duration duration;
  final Curve curve;
  final int minPuffs;
  final int puffVariance;
  final double minAngular;
  final double angularVariance;
  final double minRadial;
  final double radialVariance;
  final double bulgeFactor;
  final Color color;
  final AnimationController? idleController;
  final double frequency;

  @override
  State<AnimatedThoughtBubble> createState() => _AnimatedThoughtBubbleState();
}

class _AnimatedThoughtBubbleState extends State<AnimatedThoughtBubble> with SingleTickerProviderStateMixin {
  late AnimationController _controller = AnimationController(
    vsync: widget.vsync ?? this, 
    duration: widget.duration
  );
  late Animation<double> _dot1Anim = CurvedAnimation(
    parent: _controller, 
    curve: Interval(0.0, 0.3, curve: widget.curve)
  );
  late Animation<double> _dot2Anim = CurvedAnimation(
    parent: _controller, 
    curve: Interval(0.3, 0.6, curve: widget.curve)
  );
  late Animation<double> _cloudAnim = CurvedAnimation(
    parent: _controller, 
    curve: Interval(0.6, 1.0, curve: widget.curve)
  );

  @override
  void initState() {
    super.initState();

    if (widget.isVisible) {
      _animate(reverse: false);
    }
  }

  @override
  void didUpdateWidget(covariant AnimatedThoughtBubble oldWidget) {
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ScaleTransition(
          scale: _cloudAnim,
          child: FadeTransition(
            opacity: _cloudAnim,
            child: WigglingWidget(  // The wiggling makes the cloud regenerate (because we don't set a key)
              controller: widget.idleController,
              frequency: widget.frequency,
              child: CustomPaint(
                painter: CloudPainter(
                  minPuffs: widget.minPuffs,
                  puffVariance: widget.puffVariance,
                  minAngular: widget.minAngular,
                  angularVariance: widget.angularVariance,
                  minRadial: widget.minRadial,
                  radialVariance: widget.radialVariance,
                  bulgeFactor: widget.bulgeFactor,
                  color: widget.color
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    widget.text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: "Schoolbell",
                      color: Colors.black
                    )
                  )
                )
              )
            )
          )
        ),

        Transform.translate(
          offset: Offset(-5, 30),
          child: ScaleTransition(
            scale: _dot1Anim,
            child: FadeTransition(
              opacity: _dot1Anim,
              child: WigglingWidget(
                controller: widget.idleController,
                frequency: widget.frequency,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: widget.color,
                    shape: BoxShape.circle
                  )
                ),
              )
            )
          )
        ),

        Transform.translate(
          offset: Offset(-13, 10),
          child: ScaleTransition(
            scale: _dot2Anim,
            child: FadeTransition(
              opacity: _dot2Anim,
              child: WigglingWidget(
                controller: widget.idleController,
                frequency: widget.frequency,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: widget.color,
                    shape: BoxShape.circle
                  )
                )
              )
            )
          )
        ),
      ]
    );
  }
}
