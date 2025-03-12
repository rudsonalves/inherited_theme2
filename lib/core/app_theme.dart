import 'package:flutter/material.dart';

class AppTheme {
  final ThemeData themeData;
  final void Function() toggleTheme;

  AppTheme({required this.themeData, required this.toggleTheme});

  bool get isDark => themeData.brightness == Brightness.dark;
}
