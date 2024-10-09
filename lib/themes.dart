import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/* 

If you want to add more themes it's probably best to copy themeN since themeF is 
overly complicated in order to look as close to the old theme as possible. themeN
is a little more straightforward and has been tested thoroughly so that everything 
is workable and looks okay.

themeO is the simplest possible auto-generated theme. Nothing is guaranteed to look good,
but things should at least be navigable and not crash.

To add another theme you also have to edit the language files, getThemeData in theme.service.dart 
and theme_settings.dart.

*/

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit(): super(themeF);

  void setTheme(_theme) {
    emit(_theme);
  }
}

final ThemeData themeN = ThemeData(
  /* Since the app is not built around material 3, I've had to be a
  bit creative with the application of some of these colours. */

  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromRGBO(56, 142, 60, 1), // colors.green[700]
    brightness: Brightness.dark,
    onPrimary: Colors.white, // Used for a unselected element in the bottom bar
    onPrimaryContainer: Colors.black, // colors.green[700], // (only) Used for a selected element in the bottom bar
    primary: const Color.fromRGBO(56, 142, 60, 1), // colors.green[700], used often and in random places, this is a remnant from the old theme

    // Used, ex. for the background of the cafe shifts/the notification cards
    // this is the wrong way to use this color (it should not have 100% opacity), 
    // so please change it when time allows
    surfaceTint: Color.fromRGBO(3, 51, 6, 1), 

    // Used as background for cards, like event cards in calendar, notification cards, items on "other" page
    surface: Color.fromRGBO(34, 34, 34, 1),
    onBackground: Colors.white,
    onSecondary: Colors.white,

    onInverseSurface: Colors.white,// Used, ex. for the text on the cafe shifts

    onError: Colors.white,
    error: Color.fromARGB(255, 156, 8, 16), // (and edited error a little)

    /* NOT CHANGED */

    // Sometimes used on top of primary, for example in the divider between the calendar and event cards. Sorry :(
    // (and on buttons in the login page)
    // onSecondary: Colors.white

    // onError: Colors.white

    // onSurface: some gray color. Used for icons on search bars

    // onBackground: 

    // shadow: Colors.black, // Likely unused

    // Used, ex. for the background of letters in songbook and as background for other text that 
    // should stand out a bit (like explanations in the account settings)
    // surfaceVariant: UNCHANGED 

    // onPrimaryContainer: UNCHANGED // (only) Used for a selected element in the bottom bar
  ),

  // Color used for circular loading indicator in some places
  // Also used in the background shape, and in many other places where previous
  // developers used orange to spice things up. Don't blame me if it looks bad.
  primaryColor: const Color.fromRGBO(56, 142, 60, 1), // colors.green[700]
  primaryColorLight: Colors.green[800], // Used for the banner/background on the contact page

  appBarTheme: AppBarTheme(color: Colors.green[700]), // Top bar color
  bottomAppBarTheme: BottomAppBarTheme(color: Colors.green[700]),
  textTheme: TextTheme(
    displayMedium: const TextStyle( // Used for the text on the loading widget
      fontSize: 30,
      fontWeight: FontWeight.normal,
      fontFamily: 'Helvetica Neue'
    ),
    titleLarge: const TextStyle( // Ex: all titles on top bar, titles of gallery albums
      fontSize: 22,
      fontStyle: FontStyle.normal,
      fontFamily: 'Helvetica Neue',
      color: Colors.white
    ),
    headlineMedium: const TextStyle( // Ex: titles on the event page and songs
      fontSize: 25,
      fontStyle: FontStyle.normal,
      fontFamily: 'Helvetica Neue',
      color: const Color.fromRGBO(56, 142, 60, 1), // colors.green[700]
    ),
    bodyMedium: const TextStyle(
      fontSize: 15,
      fontStyle: FontStyle.normal,
      fontFamily: 'Helvetica Neue'
    ),
    displaySmall: const TextStyle(
      fontSize: 12,
      fontStyle: FontStyle.normal,
      fontFamily: 'Helvetica Neue'
    ),
    labelLarge: const TextStyle( // Ex: text on image saving snackbar
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: 'Helvetica Neue'
    ),
  ),

  // Used in cafe shift page, required to not crash
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.green[700]!),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    ),
  ),

  // Used for log in page (among other places?)
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green[700]!)),
    labelStyle: TextStyle(color: Colors.green[700]!),
    hintStyle: TextStyle(color: Colors.grey[600]), // Colors.grey[600]
    floatingLabelStyle: TextStyle(color: Colors.green[700]!),
    iconColor: Colors.grey[600],
  ),
);

final ThemeData themeF = ThemeData(
  /* Since the app is not built around material 3, I've had to be a
  bit creative with the application of some of these colours. */

  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromRGBO(245, 124, 0, 1), // colors.orange[700]
    primary: Colors.orange[600], // colors.orange[600], used unsparingly and in random places, I just ported it over
    brightness: Brightness.light,

    // Used, ex. for the background of letters in songbook and as background for other text that 
    // should stand out a bit (like explanations in the account settings)
    surfaceVariant: Colors.grey[200]!, 
    onSurfaceVariant: Colors.black,
    onPrimary: Colors.black, // Used for a unselected element in the bottom bar
    // (only) Used for a selected element in the bottom bar
    onPrimaryContainer: Colors.white,

    // Used, ex. for the background of the cafe shifts/the notification cards
    // this is the wrong way to use this color (it should not have 100% opacity), 
    // so please change it when time allows
    surfaceTint: Colors.orange[100], 
    onInverseSurface: Colors.black, // Used, ex. for the text on the cafe shifts
    // Used as background for cards, like event cards in calendar, notification cards, items on "other" page
    surface: Color.fromRGBO(255, 254, 251, 1), // A color that kinda looked nice
    background: Colors.white, //  Main new background color


    error: Colors.red[600], // Same as the old error color

    /* NOT CHANGED */

    // Sometimes used on top of primary, for example in the divider between the calendar and event cards. Sorry :(
    // (and on buttons in the login page)
    // onSecondary: Colors.white

    // onError: Colors.white

    // onSurface: some gray color. Used for icons on search bars

    // onBackground: 

    // shadow: Colors.black, // Likely unused

    /* OLD COLORS */
    //surface: Color.fromRGBO(246, 243, 254, 1), // I guessed this color, it's close but not exactly the same as the old one
    //background: const Color.fromRGBO(241, 241, 241, 1), // Main old background color
  ),

  // Color used for circular loading indicator in some places
  // Also used in the background shape, and in many other places where previous
  // developers used orange to spice things up. Don't blame me if it looks bad.
  primaryColor: const Color.fromRGBO(245, 124, 0, 1), // colors.orange[700]
  primaryColorLight: const Color.fromRGBO(251, 140, 0, 1), //Colors.orange[600] // Used for the banner/background on the contact page

  appBarTheme: AppBarTheme(
    color: Colors.orange[700]
  ), // Top bar color
  bottomAppBarTheme: BottomAppBarTheme(color: Colors.orange[800]), // Bottom bar color

  textTheme: TextTheme(
    displayMedium: const TextStyle( // Used for the text on the loading widget
      fontSize: 30,
      fontWeight: FontWeight.normal,
      fontFamily: 'Helvetica Neue'
    ),
    titleLarge: const TextStyle( // Ex: all titles on top bar, titles of gallery albums
      fontSize: 22,
      fontStyle: FontStyle.normal,
      fontFamily: 'Helvetica Neue'
    ),
    headlineMedium: const TextStyle( // Ex: titles on the event page and songs
      fontSize: 25,
      fontStyle: FontStyle.normal,
      fontFamily: 'Helvetica Neue',
      color: const Color.fromRGBO(251, 140, 0, 1), // colors.orange[600]
    ),
    bodyMedium: const TextStyle(
      fontSize: 15,
      fontStyle: FontStyle.normal,
      fontFamily: 'Helvetica Neue'
    ),
    displaySmall: const TextStyle(
      fontSize: 12,
      fontStyle: FontStyle.normal,
      fontFamily: 'Helvetica Neue'
    ),
    labelLarge: const TextStyle( // Ex: text on image saving snackbar
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: 'Helvetica Neue'
    ),
  ),

  // Used in cafe shift page, required to not crash
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.orange[700]!),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    ),
  ),

  // This is here to make checkboxes have the strange colors they did before
  // the theme update. You should probably not copy this to new themes,
  // the standard colors usually look better.
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.all<Color>(Colors.orange[800]!),
    checkColor: MaterialStateProperty.all<Color>(Colors.white),
  ),

  // Used for log in page (among other places?)
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange[600]!)),
    labelStyle: TextStyle(color: Colors.grey[600]!),
    hintStyle: TextStyle(color: Colors.grey[600]),
    floatingLabelStyle: TextStyle(color: Colors.orange[600]!),
    iconColor: Colors.grey[600],
  ),
);

final ThemeData themeO = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromRGBO(191, 54, 12, 1), // Colors.deepOrange[900]
    brightness: Brightness.dark,
    onPrimary: Colors.white, // Used for a unselected element in the bottom bar
    onPrimaryContainer: const Color.fromRGBO(191, 54, 12, 1), // Colors.deepOrange[900], (only) Used for a selected element in the bottom bar
    surfaceTint: Color.fromRGBO(51, 26, 3, 1), // Used, ex. for the background of the cafe shifts/the notification cards
    onInverseSurface: Colors.white, // Used, ex. for the text on the cafe shifts
  ),

  // Used for log in page (among other places?)
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: const Color.fromRGBO(191, 54, 12, 1))), // Colors.deepOrange[900]
    labelStyle: TextStyle(color: const Color.fromRGBO(191, 54, 12, 1)), // Colors.deepOrange[900]
    hintStyle: TextStyle(color: Colors.grey[600]), // Colors.grey[600]
    floatingLabelStyle: TextStyle(color: const Color.fromRGBO(191, 54, 12, 1)), // Colors.deepOrange[900]
    iconColor: Colors.grey[600],
  ),

  // Used in cafe shift page, required to not crash
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(191, 54, 12, 1)),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    ),
  ),

);

final ThemeData themeD = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.pink[400]!, 
    brightness: Brightness.dark,
    onPrimary: Colors.white, // Used for a unselected element in the bottom bar
    onPrimaryContainer: Colors.pink[400]!, // (only) Used for a selected element in the bottom bar
    surfaceTint: Colors.pink[800], // Used, ex. for the background of the cafe shifts/the notification cards
    onInverseSurface: Colors.white, // Used, ex. for the text on the cafe shifts
  ),

  // Used for log in page (among other places?)
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.pink[900]!)),
    labelStyle: TextStyle(color: Colors.pink[900]!),
    hintStyle: TextStyle(color: Colors.grey[600]), // Colors.grey[600]
    floatingLabelStyle: TextStyle(color: Colors.pink[900]!), // Colors.deepOrange[900]
    iconColor: Colors.grey[600],
  ),

  // Used in cafe shift page, required to not crash
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.pink[400]!),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    ),
  ),

);

final ThemeData themeV = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue[600]!, 
    brightness: Brightness.light,
    onPrimary: Colors.black, // Used for a unselected element in the bottom bar
    onPrimaryContainer: Colors.blue[700]!, // (only) Used for a selected element in the bottom bar
    surfaceTint: Colors.lightBlue[50], // Used, ex. for the background of the cafe shifts/the notification cards
    onInverseSurface: Colors.black, // Used, ex. for the text on the cafe shifts
  ),

  // Used for log in page (among other places?)
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue[600]!)), // Colors.deepOrange[900]
    labelStyle: TextStyle(color: Colors.blue[600]!), // Colors.deepOrange[900]
    hintStyle: TextStyle(color: Colors.grey[600]), // Colors.grey[600]
    floatingLabelStyle: TextStyle(color: Colors.blue[600]!), // Colors.deepOrange[900]
    iconColor: Colors.grey[600],
  ),

  // Used in cafe shift page, required to not crash
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue[400]!),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
    ),
  ),

);


