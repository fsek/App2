import 'package:flutter/material.dart';
import 'package:fsek_mobile/themes.dart';

class ThemeService {
  ThemeData theme = fsekTheme;
  List<Color> backgroundColors = fsekBackground;
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