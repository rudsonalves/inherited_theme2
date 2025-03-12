import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:inherited_theme2/core/app_theme.dart';
import 'package:inherited_theme2/ui/home_page.dart';

late AppTheme appTheme;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData _themeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    brightness: Brightness.light,
  );

  @override
  void initState() {
    super.initState();

    appTheme = AppTheme(themeData: _themeData, toggleTheme: _toggleTheme);
  }

  void _toggleTheme() {
    setState(() {
      _themeData =
          appTheme.isDark
              ? _themeData = ThemeData.light()
              : _themeData = ThemeData.dark();
    });
    appTheme = AppTheme(themeData: _themeData, toggleTheme: _toggleTheme);
    log(_themeData.brightness.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme.themeData,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
