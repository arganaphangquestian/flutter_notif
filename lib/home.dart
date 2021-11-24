import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notif/controller.dart';

class Home extends StatelessWidget {
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        init: controller,
        builder: (controller) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: EdgeInsets.all(7),
                  child: Text('${controller.notifications[index].title}'),
                ),
              );
            },
            itemCount: controller.notifications.length,
          );
        },
      ),
    );
  }
}
