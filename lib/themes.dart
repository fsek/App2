import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/* 

If you want to add more themes it's probably best to copy themeN since themeF is 
overly complicated in order to look as close to the old theme as possible. themeN
is a little more straightforward and has been tested thoroughly so that everything 
is workable and looks okay.

There is an example theme at the bottom of the file of the old themeV. It represents the
smallest possible specification that still works graphics-wise.

To add another theme you also have to edit the language files, getThemeData in theme.service.dart 
and theme_settings.dart.

Since the app is not originally built around material 3, I've had to be a
bit creative with the application of some of these colours.

All documentation is at the end of the file. Please update that when you you add 
new color labels.

*/

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit(): super(themeF);

  void setTheme(_theme) {
    emit(_theme);
  }
}

final ThemeData themeFdark = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromRGBO(235, 113, 37, 1), 
    brightness: Brightness.dark,
    onPrimary: Colors.white,
    onPrimaryContainer: Colors.black, 
    primary: const Color.fromRGBO(235, 113, 37, 1), 

    surfaceTint: Color.fromRGBO(56, 29, 3, 1), 

    surface: Color.fromRGBO(50, 49, 45, 1),
    onBackground: Colors.white,
    onSecondary: Colors.white,

    onInverseSurface: Colors.white,

    onError: Colors.white,
    error: Color.fromARGB(255, 156, 8, 16),

  ),

  primaryColor: const Color.fromRGBO(235, 113, 37, 1), 
  primaryColorLight: Color.fromRGBO(186, 83, 19, 1), 

  appBarTheme: AppBarTheme(backgroundColor: Color.fromRGBO(235, 113, 37, 1)), // Top bar color
  bottomAppBarTheme: BottomAppBarThemeData(color: Color.fromRGBO(235, 113, 37, 1)),

  fontFamily: 'Helvetica Neue',

  textTheme: TextTheme(
    displayMedium: const TextStyle( 
      fontSize: 30,
      fontWeight: FontWeight.normal,
    ),
    titleLarge: const TextStyle( 
      fontSize: 22,
      fontStyle: FontStyle.normal,
      color: Colors.white 
    ),
    headlineMedium: const TextStyle(
      fontSize: 25,
      fontStyle: FontStyle.normal,
      color: const Color.fromRGBO(235, 113, 37, 1), 
    ),
    bodyMedium: const TextStyle(
      fontSize: 15,
      fontStyle: FontStyle.normal,
    ),
    displaySmall: const TextStyle(
      fontSize: 12,
      fontStyle: FontStyle.normal,
    ),
    labelLarge: const TextStyle( 
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  ),

  // Used in cafe shift page, required to not crash
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(Colors.orange[700]!),
      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
    ),
  ),

  // Used for log in page (among other places?)
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange[700]!)),
    labelStyle: TextStyle(color: Colors.orange[700]!),
    hintStyle: TextStyle(color: Colors.grey[600]),
    floatingLabelStyle: TextStyle(color: Colors.orange[700]!),
    iconColor: Colors.grey[600],
  ),

  // Theme for most snackbar messages. Without this the colors are very hard to read.
  snackBarTheme: SnackBarThemeData(
    contentTextStyle: TextStyle(color: Colors.black),
  ),

);

final ThemeData themeN = ThemeData(

  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromRGBO(56, 142, 60, 1), // colors.green[700]
    brightness: Brightness.dark,
    onPrimary: Colors.white,
    onPrimaryContainer: Colors.black,
    primary: const Color.fromRGBO(56, 142, 60, 1), // colors.green[700],

    surfaceTint: Color.fromRGBO(3, 51, 6, 1), 

    surface: Color.fromRGBO(45, 45, 45, 1),
    onBackground: Colors.white,
    onSecondary: Colors.white,

    onInverseSurface: Colors.white,
    onError: Colors.white,
    error: Color.fromARGB(255, 156, 8, 16),

  ),

  primaryColor: const Color.fromRGBO(56, 142, 60, 1), // colors.green[700]
  primaryColorLight: Colors.green[800], 

  appBarTheme: AppBarTheme(backgroundColor: Colors.green[700]), // Top bar color
  bottomAppBarTheme: BottomAppBarThemeData(color: Colors.green[700]),

  fontFamily: 'Helvetica Neue',

  textTheme: TextTheme(
    displayMedium: const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.normal,
    ),
    titleLarge: const TextStyle(
      fontSize: 22,
      fontStyle: FontStyle.normal,
      color: Colors.white 
    ),
    headlineMedium: const TextStyle( 
      fontSize: 25,
      fontStyle: FontStyle.normal,
      color: const Color.fromRGBO(56, 142, 60, 1), // colors.green[700]
    ),
    bodyMedium: const TextStyle(
      fontSize: 15,
      fontStyle: FontStyle.normal,
    ),
    displaySmall: const TextStyle(
      fontSize: 12,
      fontStyle: FontStyle.normal,
    ),
    labelLarge: const TextStyle( 
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  ),

  // Used in cafe shift page, required to not crash
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(Colors.green[700]!),
      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
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

  // Theme for most snackbar messages. Without this the colors are very hard to read.
  snackBarTheme: SnackBarThemeData(
    contentTextStyle: TextStyle(color: Colors.black),
  ),

);

final ThemeData themePi = ThemeData(

  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color.fromARGB(255, 179, 179, 179),
    brightness: Brightness.light,
    onPrimary: Colors.black, 
    onPrimaryContainer: Colors.white, 
    primary: const Color.fromARGB(255, 179, 179, 179),

    surfaceTint: Color.fromRGBO(247, 247, 247, 1), 

    surface: Color.fromRGBO(233, 233, 233, 1),
    onBackground: Colors.black,
    onSecondary: Colors.black,

    onInverseSurface: Colors.black,

    onError: Colors.white,
    error: Color.fromARGB(255, 156, 8, 16),
  ),

  primaryColor: const Color.fromARGB(255, 179, 179, 179),
  primaryColorLight: Color.fromARGB(255, 197, 197, 197), 

  appBarTheme: AppBarTheme(backgroundColor: Color.fromARGB(255, 179, 179, 179)), // Top bar color
  bottomAppBarTheme: BottomAppBarThemeData(color: Color.fromARGB(255, 179, 179, 179)),

  fontFamily: 'Helvetica Neue',

  textTheme: TextTheme(
    displayMedium: const TextStyle( 
      fontSize: 30,
      fontWeight: FontWeight.normal,
    ),
    titleLarge: const TextStyle( 
      fontSize: 22,
      fontStyle: FontStyle.normal,
      color: Colors.black 
    ),
    headlineMedium: const TextStyle(
      fontSize: 25,
      fontStyle: FontStyle.normal,
      color: Color.fromARGB(255, 179, 179, 179), 
    ),
    bodyMedium: const TextStyle(
      fontSize: 15,
      fontStyle: FontStyle.normal,
    ),
    displaySmall: const TextStyle(
      fontSize: 12,
      fontStyle: FontStyle.normal,
    ),
    labelLarge: const TextStyle( 
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  ),

  // Used in cafe shift page, required to not crash
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(Color.fromARGB(255, 245, 147, 35)),
      foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
    ),
  ),

  // Used for log in page (among other places?)
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 245, 147, 35))),
    labelStyle: TextStyle(color: Color.fromARGB(255, 245, 147, 35)),
    hintStyle: TextStyle(color: Colors.grey[600]), // Colors.grey[600]
    floatingLabelStyle: TextStyle(color: Color.fromARGB(255, 245, 147, 35)),
    iconColor: Colors.grey[600],
  ),

  // Theme for most snackbar messages. Without this the colors are very hard to read.
  snackBarTheme: SnackBarThemeData(
    contentTextStyle: TextStyle(color: Colors.white),
  ),

);

final ThemeData themeF = ThemeData(

  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromRGBO(245, 124, 0, 1), // colors.orange[700]
    primary: Colors.orange[600], // colors.orange[600], used unsparingly and in random places, I just ported it over
    brightness: Brightness.light,

    surfaceVariant: Colors.grey[200]!, 
    onSurfaceVariant: Colors.black,
    onPrimary: Colors.black, 
    onPrimaryContainer: Colors.white,

    surfaceTint: Colors.orange[100], 
    onInverseSurface: Colors.black, 
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
  primaryColorLight: const Color.fromRGBO(251, 140, 0, 1), //Colors.orange[600] 

  appBarTheme: AppBarTheme(
    backgroundColor: Colors.orange[700]
  ), // Top bar color
  bottomAppBarTheme: BottomAppBarThemeData(color: Colors.orange[800]), // Bottom bar color

  textTheme: TextTheme(
    displayMedium: const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.normal,
      fontFamily: 'Helvetica Neue'
    ),
    titleLarge: const TextStyle( 
      fontSize: 22,
      fontStyle: FontStyle.normal,
      fontFamily: 'Helvetica Neue'
    ),
    headlineMedium: const TextStyle( 
      fontSize: 25,
      fontStyle: FontStyle.normal,
      fontFamily: 'Helvetica Neue',
      color: const Color.fromRGBO(251, 140, 0, 1), 
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
    labelLarge: const TextStyle( 
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: 'Helvetica Neue'
    ),
    labelMedium: const TextStyle( 
      fontSize: 14,
      fontWeight: FontWeight.bold,
      fontFamily: 'Helvetica Neue'
    ),
  ),

  // Used in cafe shift page, required to not crash
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(Colors.orange[700]!),
      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
    ),
  ),

  // This is here to make checkboxes have the strange colors they did before
  // the theme update. You should probably not copy this to new themes,
  // the standard colors usually look better.
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.all<Color>(Colors.orange[800]!),
    checkColor: WidgetStateProperty.all<Color>(Colors.white),
  ),

  // Used for log in page (among other places?)
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange[600]!)),
    labelStyle: TextStyle(color: Colors.grey[600]!),
    hintStyle: TextStyle(color: Colors.grey[600]),
    floatingLabelStyle: TextStyle(color: Colors.orange[600]!),
    iconColor: Colors.grey[600],
  ),

  // Theme for most snackbar messages. Without this the colors are very hard to read.
  snackBarTheme: SnackBarThemeData(
    contentTextStyle: TextStyle(color: Colors.white),
  ),
);

final ThemeData themeO = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromRGBO(191, 54, 12, 1), // Colors.deepOrange[900]
    brightness: Brightness.dark,
    onPrimary: Colors.white,
    onPrimaryContainer: const Color.fromRGBO(191, 54, 12, 1), // Colors.deepOrange[900]
    surfaceTint: Color.fromRGBO(51, 26, 3, 1), 
    onInverseSurface: Colors.white, 
  ),

  // Used for log in page 
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: const Color.fromRGBO(191, 54, 12, 1))),
    labelStyle: TextStyle(color: const Color.fromRGBO(191, 54, 12, 1)), // Colors.deepOrange[900]
    hintStyle: TextStyle(color: Colors.grey[600]), // Colors.grey[600]
    floatingLabelStyle: TextStyle(color: const Color.fromRGBO(191, 54, 12, 1)), // Colors.deepOrange[900]
    iconColor: Colors.grey[600],
  ),

  // Used in cafe shift page, required to not crash
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(const Color.fromRGBO(191, 54, 12, 1)),
      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
    ),
  ),

  // Theme for most snackbar messages. Without this the colors are very hard to read.
  snackBarTheme: SnackBarThemeData(
    backgroundColor: Color.fromARGB(255, 83, 47, 26),
    contentTextStyle: TextStyle(color: Colors.white),
  ),

);

final ThemeData themeD = ThemeData(
  useMaterial3: true,

  colorScheme: ColorScheme.fromSeed(
    seedColor: Color(0xFFF280A1), 
    brightness: Brightness.dark,
    onPrimary: Colors.white, 
    onPrimaryContainer: Colors.black, 
    primary: Color(0xFFF280A1), 

    surfaceTint: Colors.pink[800],

    surface: Color.fromRGBO(34, 34, 34, 1),
    onBackground: Colors.white,
    onSecondary: Colors.white,

    onInverseSurface: Colors.white,

    onError: Colors.white,
    error: Color.fromARGB(255, 156, 8, 16),
  ),

  primaryColor: Color(0xFFF280A1), 
  primaryColorLight: Color.fromRGBO(236, 143, 170, 1), 

  appBarTheme: AppBarTheme(backgroundColor: Color(0xFFF280A1)), // Top bar color
  bottomAppBarTheme: BottomAppBarThemeData(color: Color(0xFFF280A1)),

  fontFamily: 'NF-Pixels',

  // Used for log in page (among other places?)
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFF280A1))),
    labelStyle: TextStyle(color: Color(0xFFF280A1)),
    hintStyle: TextStyle(color: Colors.grey[600]), 
    floatingLabelStyle: TextStyle(color: Color(0xFFF280A1)),
    iconColor: Colors.grey[600],
  ),

  // Used in cafe shift page, required to not crash
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(Color(0xFFF280A1)),
      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
    ),
  ),

  // Theme for most snackbar messages. Without this the colors are very hard to read.
  snackBarTheme: SnackBarThemeData(
    backgroundColor: Color.fromARGB(255, 83, 26, 59),
    contentTextStyle: TextStyle(color: Colors.white),
  ),

);

final ThemeData themeV = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue[600]!, 
    brightness: Brightness.light,
    onPrimary: Colors.black, 
    onPrimaryContainer: Colors.blue[700]!, 
    surfaceTint: Colors.lightBlue[50], 
    onInverseSurface: Colors.black,
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
      backgroundColor: WidgetStateProperty.all<Color>(Colors.blue[400]!),
      foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
    ),
  ),

  // Theme for most snackbar messages. Without this the colors are very hard to read.
  snackBarTheme: SnackBarThemeData(
    contentTextStyle: TextStyle(color: Colors.white),
  ),

);


/*

#### COLOR LABEL EXPLANATIONS ####

Only labels that are non-intuitive are explained.


final ThemeData ThemeName = ThemeData(
  useMaterial3: true, // Required for the theme to work
  colorScheme: ColorScheme.fromSeed(
    seedColor: 
    primary: Used unsparingly and in random places, I just ported it over from the
            old theme system, its application is not bound by rules or laws.

    brightness:
    surfaceVariant: Used, ex. for the background of letters in songbook and as background for other text that 
                    should stand out a bit (like explanations in the account settings)

    onSurfaceVariant: Only changed in main F theme. Used in the songbook on top of surfaceVariant exclusively.

    onPrimary: Used for a unselected element in the bottom bar among other small things

    onPrimaryContainer: Only (so far) specified for a selected element in the bottom bar

    surfaceTint: Used, among other places, for the background of the cafe shifts/the notification cards
                this is the wrong way to use this color (it should not have 100% opacity when set in themes), 
                so please change it when time allows. Or don't.

    onInverseSurface: Used, among other places, for the text on the cafe shifts.

    surface: Used as background for cards, like event cards in calendar, notification cards, items on "other" page.

    background: Used in main background and in other pages where continuity to the main background should be kept.

    error:
    onError:

    onSecondary: Sometimes used on top of primary, for example in the divider 
                  between the calendar and event cards. Sorry :( 
                  (and on buttons in the login page)

    onSurface: Used for icons on search bars

    onBackground: 

    shadow: Not specified to be used anywhere, but might still be used by default somewhere.
  ),

  primaryColor: Color used for circular loading indicator in some places
                Also used in the background shape, and in many other places where previous
                developers used orange to spice things up. Don't (git) blame me if it looks bad.

  primaryColorLight: Used for the banner/background on the contact page

  appBarTheme: AppBarTheme(
    color: Color of the top bar
  ), 
  bottomAppBarTheme: Color of the bottom bar

  textTheme: TextTheme(
    displayMedium: Used for the text on the loading widget

    titleLarge: Example: all titles on top bar, titles of gallery albums, titles of news after tapping them
                The color of this is not inhereted by the titles on the top bar

    headlineMedium: Example: titles on the event page and songs

    bodyMedium: 

    displaySmall: 

    labelLarge: Example: text on image saving snackbar

    labelMedium: Example: text on author of news in news card list

  ),

  textButtonTheme: Used in cafe shift page, required to not crash

  checkboxTheme: This is here to make checkboxes have the strange colors they did before
                  the theme update. You should probably not specify this in new themes,
                  the standard colors usually look better.

  inputDecorationTheme: Used for log in page. You need this for the app to work.

  snackBarTheme: Theme for most snackbar messages. Without this the colors might be very hard to read.
);

*/












/*

// OLD THEME EXAMPLE

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

  // Theme for most snackbar messages. Without this the colors are very hard to read.
  snackBarTheme: SnackBarThemeData(
    contentTextStyle: TextStyle(color: Colors.white),
  ),

);

*/
