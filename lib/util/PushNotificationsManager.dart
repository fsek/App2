// // import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class PushNotificationsManager {
//   PushNotificationsManager._();

//   factory PushNotificationsManager() => getInstance()!;

//   static PushNotificationsManager? _instance;

//   static PushNotificationsManager? getInstance() {
//     if (_instance == null) {
//       _instance = PushNotificationsManager._();
//     }

//     return _instance;
//   }

//   // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//   bool _initialized = false;

//   Future<void> init() async {
//     if (!_initialized) {
//       // For iOS request permission first.
//       await _firebaseMessaging.requestPermission(
//         alert: true,
//         announcement: false,
//         badge: true,
//         carPlay: false,
//         criticalAlert: false,
//         provisional: false,
//         sound: true,
//       );
//       await _firebaseMessaging.setForegroundNotificationPresentationOptions(
//         alert: true, // Required to display a heads up notification
//         badge: true,
//         sound: true,
//       );

//       const AndroidNotificationChannel channel = AndroidNotificationChannel(
//         'high_importance_channel', // id
//         'High Importance Notifications', // title
//         description:
//             'This channel is used for important notifications.', // description
//         importance: Importance.max,
//       );

//       final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//           FlutterLocalNotificationsPlugin();

//       await flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//               AndroidFlutterLocalNotificationsPlugin>()
//           ?.createNotificationChannel(channel);

//       FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//         RemoteNotification? notification = message.notification;
//         AndroidNotification? android = message.notification?.android;

//         // If `onMessage` is triggered with a notification, construct our own
//         // local notification to show to users using the created channel.
//         if (notification != null && android != null) {
//           flutterLocalNotificationsPlugin.show(
//               notification.hashCode,
//               notification.title,
//               notification.body,
//               NotificationDetails(
//                 android: AndroidNotificationDetails(
//                   channel.id,
//                   channel.name,
//                   channelDescription: channel.description,
//                   icon: android.smallIcon,
//                   // other properties...
//                 ),
//               ));
//         }
//       });

//       _initialized = true;
//     }
//   }

//   Future<String> getToken() async {
//     if (_initialized) {
//       // For testing purposes print the Firebase Messaging token
//       String? token = await _firebaseMessaging.getToken();
//       if (token == null) throw new Exception("Could not get token");

//       print("FirebaseMessaging token: $token"); //send to server
//       return token;
//     } else {
//       throw new Exception("PushNotificationsManager not initialized.");
//     }
//   }
// }
