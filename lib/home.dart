import 'package:flutter/material.dart';

import 'notif.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () async {
            await GlobalFlutterLocalNotificationsPlugin.show(
                0,
                'Title Notification',
                'Lorem ipsum dolor sit amet',
                platformChannelSpecifics,
                payload: '{"status": "Notification Success"}');
          },
          child: Text("Create Notification"),
        ),
      ),
    );
  }
}
