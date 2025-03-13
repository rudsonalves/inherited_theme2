import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepository {
  late final SharedPreferences prefs;

  static const keyTheme = 'theme';

  Future<void> initialize() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> setTheme(Brightness brightness) async {
    prefs.setString(keyTheme, brightness.name);
  }

  Brightness getTheme() {
    final themeName = prefs.getString(keyTheme) ?? 'light';

    return themeName == Brightness.dark.name
        ? Brightness.dark
        : Brightness.light;
  }
}
