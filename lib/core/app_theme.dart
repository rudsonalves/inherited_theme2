import 'package:flutter/material.dart';

class AppInheritedTheme extends InheritedTheme {
  final ThemeData themeData;
  final void Function() toggleTheme;

  const AppInheritedTheme({
    super.key,
    required this.themeData,
    required this.toggleTheme,
    required super.child,
  });

  bool get isDark => themeData.brightness == Brightness.dark;

  @override
  bool updateShouldNotify(covariant AppInheritedTheme oldWidget) {
    return themeData.brightness != oldWidget.themeData.brightness;
  }

  // O método wrap é chamado para re-aplicar o tema em subárvores quando
  // necessário.
  @override
  Widget wrap(BuildContext context, Widget child) {
    return AppInheritedTheme(
      themeData: themeData,
      toggleTheme: toggleTheme,
      child: child,
    );
  }

  // Método para acessar o tema a partir do BuildContext
  factory AppInheritedTheme.of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<AppInheritedTheme>()!;
  }
}
