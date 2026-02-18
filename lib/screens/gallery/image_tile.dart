import 'package:flutter/material.dart';

class ImageTile extends StatelessWidget {
  final ImageProvider image;
  final VoidCallback onTap;

  const ImageTile({
    super.key,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {  // Could try to add scroll to select
    return Ink.image(
      image: image,
      fit: BoxFit.cover,
      child: InkWell(onTap: onTap),
    );
  }
}

class TileSelectionOverlay extends StatelessWidget {
  const TileSelectionOverlay();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        color: Colors.black38,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.blue,
              child: const Icon(Icons.check, size: 14, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
