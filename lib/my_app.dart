import 'package:flutter/material.dart';
import 'package:inherited_theme2/core/app_theme.dart';
import 'package:inherited_theme2/data/repository/local_repository.dart';
import 'package:inherited_theme2/ui/home_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final localRepository = LocalRepository();
  ThemeData _themeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    brightness: Brightness.light,
  );

  @override
  void initState() {
    super.initState();

    initLocalPreferences();
  }

  Future<void> initLocalPreferences() async {
    await localRepository.initalize();

    final brightness = localRepository.getTheme();
    if (brightness == Brightness.dark) _toggleTheme();
  }

  void _toggleTheme() {
    setState(() {
      _themeData =
          _themeData.brightness == Brightness.dark
              ? ThemeData.light()
              : ThemeData.dark();
      localRepository.setTheme(_themeData.brightness);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppInheritedTheme(
      themeData: _themeData,
      toggleTheme: _toggleTheme,
      child: MaterialApp(
        theme: _themeData,
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
