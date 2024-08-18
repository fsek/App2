import 'package:flutter/material.dart';

class ImageMap extends StatelessWidget {
  const ImageMap({
    Key? key,
    required this.image,
    required this.onTap,
    required this.regions,
  }) : super(key: key);

  final Widget image;
  final List<Path> regions;

  /// Callback that will be invoked with the index of the tapped region.
  final void Function(int) onTap;

  void _onTap(BuildContext context, Offset globalPosition) {
    RenderObject? renderBox = context.findRenderObject();
    if (renderBox is RenderBox) {
      final localPosition = renderBox.globalToLocal(globalPosition);
      for (var region in regions.indexed) {
        var index = region.$1;
        var path = region.$2;
        if (path.contains(localPosition)) {
          onTap(index);
          return;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _onTap(context, details.globalPosition),
      child: image,
    );
  }
}
