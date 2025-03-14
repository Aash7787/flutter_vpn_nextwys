import 'package:flutter/material.dart';
import 'package:flutter_vpn/src/features/auth/signup/pages/forgot_password_screen.dart';
import 'package:flutter_vpn/src/features/auth/signup/pages/login_screen.dart';
import 'package:flutter_vpn/src/features/auth/signup/pages/sign_up_screen.dart';
import 'package:flutter_vpn/src/features/auth/signup/pages/splash_screen.dart';
import 'package:flutter_vpn/src/features/home/page/country_pick_page.dart';
import 'package:flutter_vpn/src/features/home/page/home_page.dart';
import 'package:flutter_vpn/src/features/home/page/about_page.dart';
import 'package:flutter_vpn/src/features/home/page/setting_page.dart';
import 'package:flutter_vpn/src/router/error_route.dart';
import 'package:flutter_vpn/src/router/route_transition.dart';

Route<dynamic> onGenRoute(RouteSettings settings) {
  return switch (settings.name) {
    HomePage.route => buildPageWithDefaultTransition(child: HomePage()),
    AboutPage.route => buildPageWithDefaultTransition(child: AboutPage()),
    SettingPage.route => buildPageWithDefaultTransition(child: SettingPage()),
    SignUpScreen.route => buildPageWithDefaultTransition(child: SignUpScreen()),
    LoginScreen.route => buildPageWithDefaultTransition(child: LoginScreen()),
    ForgotPasswordScreen.route => buildPageWithDefaultTransition(child: ForgotPasswordScreen()),
    SplashScreen.route => buildPageWithDefaultTransition(child: SplashScreen()),
    CountryPickPage.route => buildPageWithDefaultTransition(child: CountryPickPage()),
    _ => MaterialPageRoute(builder: (_) => const ErrorPage()),
  };
}
