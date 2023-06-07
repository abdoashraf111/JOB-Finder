import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class MyCache {
  static SharedPreferences? preferences;
  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  // ignore: non_constant_identifier_names
  static void SetString({required MyChachKey key, required String value}) {
    preferences?.setString(key.name, value);

  }
  // ignore: non_constant_identifier_names
  static String GetString({required MyChachKey key}) {
    return preferences?.getString(key.name) ?? "";
  }


  // ignore: non_constant_identifier_names
  static void SetInt({required MyChachKey key, required int value}) {
    preferences?.setInt(key.name, value);
  }
  // ignore: non_constant_identifier_names
  static int GetInt({required MyChachKey key}) {
    return preferences?.getInt(key.name) ?? 0;
  }


  // ignore: non_constant_identifier_names
  static void SetBool({required MyChachKey key, required bool value}) {
    preferences?.setBool(key.name, value);
  }
  // ignore: non_constant_identifier_names
  static bool? GetBool({required MyChachKey key}) {
    return preferences?.getBool(key.name)?? false;
  }


  // ignore: non_constant_identifier_names
  static void SetDouble({required MyChachKey key, required double value}) {
    preferences?.setDouble(key.name, value);
  }
  // ignore: non_constant_identifier_names
  static double? GetDouble({required MyChachKey key}) {
    return preferences?.getDouble(key.name)?? 0.0;
  }




  // static void SetStringList({required MyChachKey key, required String value}) {
  //     preferences?.setStringList(key.name, value as List<String>);
  // }
  // static List<String>? GetStringList({required MyChachKey key}) {
  //   return preferences?.getStringList(key.name);
  // }



}
enum MyChachKey{

  email,
  password,
  name,
  checked,
  onBoarding,
  token,
  userId,
  faveList
}