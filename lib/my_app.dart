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
  final repository = LocalRepository();
  ThemeData _themeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    brightness: Brightness.light,
  );

  @override
  void initState() {
    super.initState();

    initRepository();
  }

  Future<void> initRepository() async {
    await repository.initialize();

    final brightness = repository.getTheme();
    if (brightness != Brightness.light) {
      _toggleTheme();
    }
  }

  Future<void> _toggleTheme() async {
    setState(() {
      _themeData =
          _themeData.brightness == Brightness.dark
              ? ThemeData.light()
              : ThemeData.dark();
      repository.setTheme(_themeData.brightness);
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
