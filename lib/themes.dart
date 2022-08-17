import 'package:flutter/material.dart';

final ThemeData fsekTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.orange,
  colorScheme: ThemeData()
      .colorScheme
      .copyWith(primary: Colors.orange[800], secondary: Colors.orangeAccent),
  textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white))),
  bottomAppBarTheme: BottomAppBarTheme(color: Colors.orange[700]),
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
  colorScheme: ThemeData()
      .colorScheme
      .copyWith(primary: Color(0xFFe3b900), secondary: Color(0xFFf3dd6d)),
  textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFd2b941)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white))),
  bottomAppBarTheme: BottomAppBarTheme(color: Color(0xFFc0a836)),
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
final ThemeData nollning2022theme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFF7BA06E),
  colorScheme: ThemeData()
      .colorScheme
      .copyWith(primary: Color(0xFF7BA06E), secondary: Color(0xFF7BA06E)),
  textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF7BA06E)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white))),
  bottomAppBarTheme: BottomAppBarTheme(color: Color(0xFF7BA06E)),
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
    labelStyle: TextStyle(color: Colors.orange),
    hintStyle: TextStyle(color: Colors.grey[600]),
  ),
);

final List<Color> nollning2022Background = [
  Color(0xFF7BA06E),
  Color(0xFF7BA06E),
];
