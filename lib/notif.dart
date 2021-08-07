import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// ignore: non_constant_identifier_names
FlutterLocalNotificationsPlugin GlobalFlutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('launch_background');
final InitializationSettings initializationSettings = InitializationSettings(
  android: initializationSettingsAndroid,
);

const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.max, priority: Priority.high, showWhen: false);
const NotificationDetails platformChannelSpecifics = NotificationDetails(
  android: androidPlatformChannelSpecifics,
);

FirebaseMessaging globalFirebaseMessaging = FirebaseMessaging.instance;
