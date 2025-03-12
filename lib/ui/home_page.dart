import 'package:flutter/material.dart';
import 'package:inherited_theme2/core/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final appTheme = AppInheritedTheme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Inherited Widget'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: appTheme.toggleTheme,
            icon: Icon(appTheme.isDark ? Icons.dark_mode : Icons.light_mode),
          ),
        ],
      ),
      body: Center(
        child: Column(
          spacing: 64,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 100),
            Text(
              "Olá, Flutter!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            FilledButton.icon(
              onPressed: () {},
              label: Text("Clique Aqui"),
              icon: Icon(Icons.done),
            ),
          ],
        ),
      ),
    );
  }
}
