import "package:flutter/material.dart";

class OutlinedText extends StatefulWidget {
  const OutlinedText({
    super.key,
    required this.text,
    this.style,
    this.strokeWidth = 1.5,
    this.strokeColor = Colors.black,
    this.textAlign
  });

  final String text;
  final TextStyle? style;
  final double strokeWidth;
  final Color strokeColor;
  final TextAlign? textAlign;

  @override
  State<OutlinedText> createState() => _OutlinedTextState();
}

class _OutlinedTextState extends State<OutlinedText> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          widget.text,
          style: TextStyle(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = widget.strokeWidth
              ..color = widget.strokeColor
          ).merge(widget.style),
          textAlign: widget.textAlign
        ),

        Text(
          widget.text,
          style: widget.style,
          textAlign: widget.textAlign
        ),
      ]
    );
  }
}
