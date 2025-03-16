import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vpn/firebase_options.dart';

import 'package:flutter_vpn/src/router/routes.dart';
import 'package:flutter_vpn/src/theme/theme.dart';

import 'src/features/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      builder: (context, child) {
        return SafeArea(
          child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            theme: AppTheme.instance.lightTheme,
            darkTheme: AppTheme.instance.darkTheme,
            onGenerateRoute: onGenRoute, // Using onGenRoute for navigation
            initialRoute: SplashScreen.router,
            // initialRoute: CountryPickPage.route,
          ),
        );
      },
    );
  }
}