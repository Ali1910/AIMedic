import 'package:gbsub/Core/utilts/constans.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sharedhelper {
  static late SharedPreferences preferences;
  static sharedPreferencesinit() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putBooldata(String key, bool value) async {
    return await preferences.setBool(key, value);
  }

  static Future<bool> putIntdata(String key, int value) async {
    return await preferences.setInt(key, value);
  }

  static getbooldata(String key) {
    return preferences.getBool(key);
  }

  static getintdata(String key) {
    return preferences.getInt(key);
  }

  static deleteInt(String key) async {
    return await preferences.remove(key);
  }

  static bool loggedIN = Sharedhelper.getbooldata(boolkey) ?? false;
}
