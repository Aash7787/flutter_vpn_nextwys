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
    seedColor: Colors.transparent,
    primary: Color.fromARGB(255, 255, 72, 72),
    onPrimary: Colors.white,
    secondary: Color(0xffFFE6A7),
    onSecondary: Color(0xff222222),
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Color(0xff222222),
    outline: Color(0xffD9D9D9),
    outlineVariant: Color.fromRGBO(247, 249, 249, 1),

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
