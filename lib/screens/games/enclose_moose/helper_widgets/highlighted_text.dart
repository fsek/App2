import "package:flutter/material.dart";

class HighlightedText extends StatefulWidget {
  const HighlightedText({
    super.key,
    required this.child,
    this.showHighlight = false,
    this.highlightShadow = const Shadow(
      color: Colors.white,
      blurRadius: 40
    ),
    this.duration = const Duration(seconds: 1),
    this.curve = Curves.easeOut
  });

  final Widget child;
  final bool showHighlight;
  final Shadow highlightShadow;
  final Duration duration;
  final Curve curve;

  @override
  State<HighlightedText> createState() => _HighlightedTextState();
}

class _HighlightedTextState extends State<HighlightedText> {
  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      style: widget.showHighlight
      ? TextStyle(
        shadows: [
          widget.highlightShadow
        ]
      )
      : const TextStyle(),
      duration: widget.showHighlight ? Duration.zero : widget.duration,
      curve: widget.curve,
      child: widget.child
    );
  }
}
