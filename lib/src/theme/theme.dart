import 'package:flutter/material.dart';
class AppTheme {
  AppTheme._();

  factory AppTheme() {
    return instance;
  }

  static final AppTheme instance = AppTheme._();

  ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorSchemeLight,
      textTheme: textTheme,
    );
  }

  ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorSchemeDark,
      textTheme: textTheme,
    );
  }

  static final ColorScheme colorSchemeLight = ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.light,
  );

  static final ColorScheme colorSchemeDark = ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.dark,
  );

  static final TextTheme textTheme = TextTheme(
    bodyLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(fontSize: 14.0),
  );
}
