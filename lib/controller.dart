import 'dart:convert';

import 'package:base/model/notification.dart';
import 'package:get/get.dart';
import 'package:storage/storage.dart';

class HomeController extends GetxController {
  RxList<NotificationModel> notifications = <NotificationModel>[].obs;

  @override
  onInit() {
    super.onInit();
    getNotifications();
  }

  Future<void> getNotifications() async {
    List<NotificationModel> data =
        (await StorageHelper.getStorage('notifications') ?? [])
            .map((e) => NotificationModel.fromJson(jsonDecode(e)))
            .toList();
    notifications = RxList.from(data);
    update();
    StorageHelper.getStorage('notifications').then((value) {
      print(value);
    });
  }
}
