import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle;

final String imagePath = "assets/img/Kartan.png";
final String markerPath = "assets/img/map_pin.png";

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  ui.Image? _marker;
  bool _tapped = false;

  @override
  void initState() {
    super.initState();
    _loadImage(markerPath).then((img) {
      setState(() {
        _marker = img;
      });
    });
  }

  void _showInfo() {
    if (_tapped) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Mattehuset"),
              content: Text("Här e' re gött häng va"),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map with Markers'),
      ),
      body: Center(
        child: InteractiveViewer(
          boundaryMargin: EdgeInsets.all(20.0),
          clipBehavior: Clip.none,
          minScale: 0.1,
          maxScale: 4.0,
          constrained: false,
          onInteractionEnd: (details) {
            _showInfo();
            _tapped = false;
          },
          child: Stack(
            children: [
              Image.asset(
                imagePath,
                // fit: BoxFit.contain,
              ),
              GestureDetector(
                  child: _marker == null
                      ? Center(child: CircularProgressIndicator())
                      : CustomPaint(
                          painter: MarkerPainter(_marker!),
                        ),
                  onTap: () {
                    _tapped = true;
                  }),
            ],
          ),
        ),
      ),
    );
    // return Center(
    //   child: SizedBox.expand(
    //     child: InteractiveViewer(
    //       // panEnabled: false, // Set it to false
    //       boundaryMargin: EdgeInsets.all(8),
    //       clipBehavior: Clip.none,
    //       minScale: 0.1,
    //       maxScale: 5,
    //       child: Image.asset(
    //         imagePath,
    //         // width: 2900,
    //         // height: 2480,
    //         // fit: BoxFit.cover,
    //       ),
    //     ),
    //   ),
    // );
  }
}

Future<ui.Image> _loadImage(String imageAssetPath) async {
  final data = await rootBundle.load(imageAssetPath);
  final codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
  var frame = await codec.getNextFrame();
  return frame.image;
}

class MarkerPainter extends CustomPainter {
  final ui.Image image;

  MarkerPainter(this.image);

  @override
  void paint(Canvas canvas, Size size) {
    // You can define your marker coordinates relative to the image size
    final markerCoordinates = [
      Offset(770, 1650), // Example coordinates, adjust as needed
      // Offset(300, 400),
      // Offset(500, 600),
    ];

    // Define the paint for the markers
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    // Draw markers on the canvas
    markerCoordinates.forEach((coordinates) {
      // canvas.drawCircle(coordinates, 10, paint);
      canvas.drawImage(image, coordinates, paint);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
