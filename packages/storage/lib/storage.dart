library storage;

import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static Future<void> setStorage(String key, String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, data);
  }

  static Future<List<String>?> getStorage(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key);
  }

  static Future<void> appendStorage(String key, String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var temp = prefs.getStringList(key);
    temp?.add(data);
    await prefs.setStringList(key, temp ?? []);
  }
}
