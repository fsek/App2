import 'dart:async';

import 'package:fsek_mobile/app.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';

// Shows the transitions between currentstate and nextstate for all blocs
class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition.toString());
    super.onTransition(bloc, transition);
  }
}

void main() {
  // This captures errors reported by the Flutter framework.
  FlutterError.onError = (FlutterErrorDetails details) {
    if (isInDebugMode) {
      // In development mode, simply print to console.
      FlutterError.dumpErrorToConsole(details);
    } else {
      // In production mode, send it to the FlutterError.onError function
      // which we have overwritten
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };

  BlocSupervisor.delegate = SimpleBlocDelegate();

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