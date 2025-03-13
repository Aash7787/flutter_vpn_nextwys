import 'package:flutter/material.dart';
import 'package:flutter_vpn/src/features/home/page/home_page.dart';
import 'package:flutter_vpn/src/router/routes.dart';
import 'package:flutter_vpn/src/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: AppTheme.instance.lightTheme, // Light Theme
      darkTheme: AppTheme.instance.darkTheme, // Dark Theme
      onGenerateRoute: onGenRoute,
      initialRoute: HomePage.route,
    );
  }
}
