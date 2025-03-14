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
      textTheme: textTheme.apply(
        bodyColor: Colors.black, // Change overall body text color
        displayColor: Colors.black, // Change headings and display text color
      ),
    );
  }

  ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorSchemeDark,
      textTheme: textTheme.apply(
        bodyColor: Colors.white, // Change overall body text color
        displayColor: Colors.white, // Change headings and display text color
      ),
    );
  }

  static final ColorScheme colorSchemeLight = ColorScheme(
    primary: Colors.blue,
    onPrimary: Colors.white,
    secondary: Colors.orange,
    onSecondary: Colors.white,
    surface: Colors.grey[100]!,
    onSurface: Colors.black,
    error: Colors.red,
    onError: Colors.white,
    brightness: Brightness.light,
  );

  static final ColorScheme colorSchemeDark = ColorScheme(
    primary: Colors.blue[700]!,
    onPrimary: Colors.black,
    secondary: Colors.orange[700]!,
    onSecondary: Colors.black,
    surface: Colors.grey[900]!,
    onSurface: Colors.white,
    error: Colors.red[400]!,
    onError: Colors.black,
    brightness: Brightness.dark,
  );

  static final TextTheme textTheme = TextTheme(
    bodyLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(fontSize: 14.0),
  );
}
