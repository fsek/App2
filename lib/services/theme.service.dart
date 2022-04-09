import 'package:flutter/material.dart';

class ThemeService {
  ThemeData theme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.orange[600],
  );
  List<Color> backgroundColors = [
    Color(0xFFf77e14),
    Color(0xFFe6660b),
  ];
  List<Widget> loginIcon = [
    CircleAvatar(
      radius: 36.0,
      backgroundImage:
          AssetImage("assets/img/fsektionen.png"),
      backgroundColor: Colors.transparent,
    ),
    SizedBox(width: 16),
    Image.asset('assets/img/text.png', scale: 3.6)
  ];
}