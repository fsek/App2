import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';


class MooseService {
  // Save a value for the highscore
  static Future<void> saveDouble(String key, double value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(key, value);
  }

  // Load a value for the highscore
  static Future<double?> loadDouble(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key);
  }
}