import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fsek_mobile/app.dart';
import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app.dart';
import 'services/service_locator.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  setupLocator();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeDateFormatting();

  FirebaseMessaging.onBackgroundMessage(_backgroundMessagingHandler);

  CatcherOptions debugOptions = CatcherOptions(DialogReportMode(), [ConsoleHandler()]);
      
  CatcherOptions releaseOptions = CatcherOptions(SilentReportMode(), [ToastHandler()]);

  Catcher(rootWidget: FsekMobileApp(), debugConfig: debugOptions, releaseConfig: releaseOptions);
}

Future<void> _backgroundMessagingHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
  print(message.data);
  print(message.notification);
  print(message.messageType);
  print(message.category);
}
