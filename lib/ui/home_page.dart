import 'package:flutter/material.dart';
import 'package:inherited_theme2/my_app.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Inherited Widget'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: appTheme.toggleTheme,
            icon: Icon(Icons.light_mode),
          ),
        ],
      ),
      body: Center(
        child: Column(
          spacing: 48,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 100),
            Text(
              "Olá, Flutter!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
