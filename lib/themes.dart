import 'package:flutter/material.dart';

final ThemeData fsekTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.orange,
  accentColor: Colors.orangeAccent,
  buttonColor: Colors.orange,
  bottomAppBarTheme: BottomAppBarTheme(
    color: Colors.orange[700]
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
    labelStyle: TextStyle(color: Colors.orange),
    hintStyle: TextStyle(color: Colors.grey[600]),
  ),
);

final List<Color> fsekBackground = [
    Color(0xFFf77e14),
    Color(0xFFe6660b),
];

final ThemeData nollning2021theme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFFe3b900),
  accentColor: Colors.orangeAccent,
  buttonColor: Colors.orange,
  bottomAppBarTheme: BottomAppBarTheme(
    color: Color(0xFFe3b900)
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
    labelStyle: TextStyle(color: Colors.orange),
    hintStyle: TextStyle(color: Colors.grey[600]),
  ),
);

final List<Color> nollning2021Background = [
    Color(0xFFe3b900),
    Color(0xFFe3b900),
];
