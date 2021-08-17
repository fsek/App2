import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsManager {
  PushNotificationsManager._();

  factory PushNotificationsManager() => getInstance()!;

  static PushNotificationsManager? _instance;

  static PushNotificationsManager? getInstance() {
    if (_instance == null) {
      _instance = PushNotificationsManager._();
    }

    return _instance;
  }

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  bool _initialized = false;

  Future<void> init() async {
    if (!_initialized) {
      // For iOS request permission first.
      await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      _initialized = true;
    }
  }

  Future<String> getToken() async {
    if (_initialized) {
      // For testing purposes print the Firebase Messaging token
      String? token = await _firebaseMessaging.getToken();
      if (token == null) throw new Exception("Could not get token");

      print("FirebaseMessaging token: $token"); //send to server
      return token;
    } else {
      throw new Exception("PushNotificationsManager not initialized.");
    }
  }
}
