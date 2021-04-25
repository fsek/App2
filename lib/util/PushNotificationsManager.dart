import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsManager {

  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;

  static final PushNotificationsManager _instance = PushNotificationsManager._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  bool _initialized = false;

  Future<void> init() async {
    if (!_initialized) {
      // For iOS request permission first.
      await _firebaseMessaging.requestNotificationPermissions();
      _firebaseMessaging.configure();
      
      _initialized = true;
    }
  }

  Future<String> getToken() async {
    if (_initialized) {
      // For testing purposes print the Firebase Messaging token
      String token = await _firebaseMessaging.getToken();
      if(token == null)
        throw new Exception("Could not get token");

      print("FirebaseMessaging token: $token"); //send to server
      return token;
    }
    else {
      throw new Exception("PushNotificationsManager not initialized.");
    }
  }
}