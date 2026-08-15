import 'package:flutter/material.dart';

class TextOverlayRoute extends PageRouteBuilder<void> {
  TextOverlayRoute({
    required this.portrait,
    required this.text,
  }) : super(
    opaque: false,
    barrierDismissible: true,
    barrierColor: Colors.black.withValues(alpha: 0.45),
    transitionDuration: const Duration(milliseconds: 250),
    pageBuilder: (context, animation, secondaryAnimation) =>
        _OverlayContent(portrait: portrait, text: text),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );

  final String portrait;
  final String text;
}

class _OverlayContent extends StatelessWidget {
  const _OverlayContent({
    required this.portrait,
    required this.text,
  });

  final String portrait;
  final String text;

  static const backgroundPath =
      "assets/data/nollning_26/nolleguide/studentlife/building_blocks/textbox.png";

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final cardWidth = screenWidth * 0.8;
    final heroHeight = screenHeight * 0.25;
    final textBoxHeight = screenHeight * 0.62;

    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: SizedBox(
          width: cardWidth,
          height: heroHeight + textBoxHeight,
          child: InteractiveViewer(
            panEnabled: true,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  this.portrait,
                  width: cardWidth,
                  height: heroHeight,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    width: cardWidth,
                    height: textBoxHeight,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final textFontSize = constraints.maxWidth * 0.04;

                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              backgroundPath,
                              fit: BoxFit.cover,
                            ),

                            Positioned(
                              left: constraints.maxWidth * 0.05,
                              right: constraints.maxWidth * 0.05,
                              top: constraints.maxHeight * 0.05,
                              bottom: constraints.maxHeight * 0.05,
                              child: SingleChildScrollView(
                                child: Text(
                                  this.text,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: textFontSize,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}