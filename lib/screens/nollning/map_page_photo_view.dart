import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class MapView extends StatelessWidget {
  final String imagePath = "assets/img/mapscreen.png";
  final String backgroundPath = "assets/img/homescreen_week_2_wide.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coola kartan"),
      ),
      body: Stack(children: [
        Image.asset(
          backgroundPath,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
        PhotoView.customChild(
          child: Stack(
            children: [
              Image.asset(imagePath), // Your map image
              Positioned(
                top: 100,
                left: 150,
                child: GestureDetector(
                  onTap: () => _showPOIDialog(context, 'Ekologihuset'),
                  child: Icon(Icons.location_on, color: Colors.red, size: 30),
                ),
              ),
              Positioned(
                top: 240,
                left: 110,
                child: GestureDetector(
                  onTap: () => _showPOIDialog(context, 'Mattehuset'),
                  child: Icon(Icons.location_on, color: Colors.red, size: 30),
                ),
              ),
              // Add more POIs as needed
            ],
          ),
          minScale: PhotoViewComputedScale.contained * 2.0,
          maxScale: PhotoViewComputedScale.covered * 6.0,
        ),
      ]),
    );
  }

  void _showPOIDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text('Här e $title, sicken grej va?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
