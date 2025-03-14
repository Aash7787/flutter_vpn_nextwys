import 'package:flutter/material.dart';
import 'package:flutter_vpn/src/features/auth/signup/pages/forgot_password_screen.dart';
import 'package:flutter_vpn/src/features/auth/signup/pages/login_screen.dart';
import 'package:flutter_vpn/src/features/auth/signup/pages/sign_up_screen.dart';
import 'package:flutter_vpn/src/features/auth/signup/pages/splash_screen.dart';
import 'package:flutter_vpn/src/features/home/page/home_page.dart';
import 'package:flutter_vpn/src/features/home/page/about_page.dart';
import 'package:flutter_vpn/src/features/home/page/setting_page.dart';
import 'package:flutter_vpn/src/router/error_route.dart';
import 'package:flutter_vpn/src/router/route_transition.dart';

Route<dynamic> onGenRoute(RouteSettings settings) {
  return switch (settings.name) {
    HomePage.route => buildPageWithSlideTransition(child: HomePage()),
    AboutPage.route => buildPageWithSlideTransition(child: AboutPage()),
    SettingPage.route => buildPageWithSlideTransition(child: SettingPage()),
    SignUpScreen.route => buildPageWithSlideTransition(child: SignUpScreen()),
    LoginScreen.route => buildPageWithSlideTransition(child: LoginScreen()),
    ForgotPasswordScreen.route => buildPageWithSlideTransition(child: ForgotPasswordScreen()),
    SplashScreen.route => buildPageWithSlideTransition(child: SplashScreen()),
    _ => MaterialPageRoute(builder: (_) => const ErrorPage()),
  };
}
