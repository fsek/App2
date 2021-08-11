import 'dart:async';

import 'package:fsek_mobile/app.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsek_mobile/screens/home/home.dart';
import 'package:fsek_mobile/screens/home/calendar.dart';
import 'package:fsek_mobile/screens/other/other.dart';
import 'package:fsek_mobile/themes.dart';
import 'app.dart';
import 'models/destination.dart';
import 'screens/nollning/adventure_missions.dart';
import 'screens/nollning/emergency_contacts.dart';
import 'screens/nollning/nollning.dart';
import 'services/navigation.service.dart';
import 'services/service_locator.dart';
import 'services/theme.service.dart';

// Shows the transitions between currentstate and nextstate for all blocs
class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition.toString());
    super.onTransition(bloc, transition);
  }
}

void main() {
  setupLocator();
  var route = locator<NavigationService>();
  final List<Destination> navbarDestinations = <Destination>[
    Destination(0, 'Hem', Icons.home, HomePage()),
    Destination(1, 'Kalender', Icons.calendar_today, Calendar()),
    Destination(2, 'Notiser', Icons.notifications, Container()),
    Destination(3, 'Övrigt', Icons.list, OtherContent()),
    Destination(4, 'Nollning', Icons.home, NollningPage()),
  ];
  route.navbarDestinations = navbarDestinations;
  route.routes = {
    '/adventure_missions': (context) => AdventureMissionsPage(),
    '/emergency_contacts': (context) => EmergencyContactsPage(),
  };

  locator<ThemeService>().theme = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.orange[800],
      accentColor: Colors.orangeAccent,
      buttonColor: Colors.orange,
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
        labelStyle: TextStyle(color: Colors.orange),
        hintStyle: TextStyle(color: Colors.grey[600]),
      ));
  locator<ThemeService>().backgroundColors = [
    Color(0xFFf77e14),
    Color(0xFFe6660b),
  ];
  locator<ThemeService>().theme = fsekTheme;
  locator<ThemeService>().backgroundColors = fsekBackground;
  locator<ThemeService>().loginIcon = [
    CircleAvatar(
      radius: 40.0,
      backgroundImage: AssetImage("assets/img/f_logo.png"),
      backgroundColor: Colors.transparent,
    ),
    SizedBox(width: 16),
    Text("F-sektionen",
        style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 28.0,
            color: Colors.grey[700]))
  ];
  // This captures errors reported by the Flutter framework.
  FlutterError.onError = (FlutterErrorDetails details) {
    if (isInDebugMode) {
      // In development mode, simply print to console.
      FlutterError.dumpErrorToConsole(details);
    } else {
      // In production mode, send it to the FlutterError.onError function
      // which we have overwritten
      Zone.current.handleUncaughtError(details.exception, details.stack!);
    }
  };

  Bloc.observer = SimpleBlocObserver();

  runZonedGuarded<Future<void>>(() async {
    runApp(FsekMobileApp());
  }, (Object error, StackTrace stackTrace) {
    // Whenever an error occurs, call the `_reportError` function. This sends
    // Dart errors to the dev console or Sentry depending on the environment.
    _reportError(error, stackTrace);
  });
}

bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

Future<void> _reportError(dynamic error, dynamic stackTrace) async {
  // Print the exception to the console.
  print('Caught error: $error');
  if (isInDebugMode) {
    // Print the full stacktrace in debug mode.
    print(stackTrace);
  } else {
    // Send the Exception and Stacktrace to Sentry in Production mode. (fuck sentry, all my homies hate sentry, use catcher instead)
    /*_sentry.captureException(
      exception: error,
      stackTrace: stackTrace,
    );*/
  }
}
