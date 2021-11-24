import 'dart:convert';

import 'package:base/base.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:storage/storage.dart';

import 'controller.dart';
import 'home.dart';
import 'notif.dart';

Future selectNotification(String? payload) async {
  if (payload != null) {
    debugPrint('notification payload: $payload');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GlobalFlutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onSelectNotification: selectNotification,
  );
  globalFirebaseMessaging.getToken().then((value) {
    print('TOKEN: $value');
  }).catchError((err) {
    print('Error $err');
  });

  runApp(Application());
}

class Application extends StatefulWidget {
  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        GlobalFlutterLocalNotificationsPlugin.show(
          0,
          message.notification?.title,
          message.notification?.body,
          platformChannelSpecifics,
          payload: '${message.data}',
        );

        await StorageHelper.appendStorage(
          "notifications",
          jsonEncode(
            NotificationModel(
                    message.notification?.title ?? "",
                    message.notification?.title ?? "",
                    message.notification?.body ?? "")
                .toJson(),
          ),
        );
        controller.getNotifications();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}
