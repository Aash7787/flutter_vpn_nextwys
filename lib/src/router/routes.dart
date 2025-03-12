import 'package:flutter/material.dart';
import 'package:flutter_vpn/src/features/home/page/home_page.dart';
import 'package:flutter_vpn/src/router/error_route.dart';
import 'package:flutter_vpn/src/router/route_transition.dart';

Route<dynamic> onGenRoute(RouteSettings settings) {
  return switch (settings.name) {
    HomePage.route => buildPageWithSlideTransition(child: HomePage()),

    _ => buildPageWithDefaultTransition(child: ErrorPage()),
  };
}
