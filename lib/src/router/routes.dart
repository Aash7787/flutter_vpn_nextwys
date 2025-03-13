import 'package:flutter/material.dart';
import 'package:flutter_vpn/src/features/home/page/about_page.dart';
import 'package:flutter_vpn/src/features/home/page/home_page.dart';
import 'package:flutter_vpn/src/features/home/page/setting_page.dart';
import 'package:flutter_vpn/src/router/error_route.dart';
import 'package:flutter_vpn/src/router/route_transition.dart';

Route<dynamic> onGenRoute(RouteSettings settings) {
  return switch (settings.name) {
    HomePage.route => buildPageWithSlideTransition(child: HomePage()),
    AboutPage.route => buildPageWithSlideTransition(child: AboutPage()),
    SettingPage.route => buildPageWithSlideTransition(child: SettingPage()),

    _ => buildPageWithDefaultTransition(child: ErrorPage()),
  };
}
