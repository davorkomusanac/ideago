import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';

class SharedPrefsDb {
  late SharedPreferences _preferences;

  Future<void> initDb() async {
    _preferences = await SharedPreferences.getInstance();
  }

  bool getIdeaTabViewPref() => _preferences.getBool(kSharedPrefsIdeaTabViewKey) ?? true;

  Future<void> writeIdeaTabViewPref(bool value) async {
    try {
      _preferences = await SharedPreferences.getInstance();
      await _preferences.setBool(kSharedPrefsIdeaTabViewKey, value);
    } catch (e) {
      log(e.toString());
    }
  }
}
