import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class cachehelper {
  static late SharedPreferences sharedprefrence;

  static init() async {
    sharedprefrence = await SharedPreferences.getInstance();
  }

  static   dynamic getdata(
      {
        required String key
      }
      )
  {
    return sharedprefrence.get(key);
  }
  static Future<bool> removedata({required String key})
  {
    return  sharedprefrence.remove(key);

  }

  static   Future<bool?> savedata({
    required String key,
    required dynamic value,
  }) async
  {
    if (value is String)
      return await sharedprefrence.setString(key, value);
    if (value is int)
      return await sharedprefrence.setInt(key, value);
    if (value is bool)
      return await sharedprefrence.setBool(key, value);
    return await sharedprefrence.setDouble(key, value);
  }
  static String uId=' ';
}