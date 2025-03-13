import 'package:flutter/material.dart';
import 'package:flutter_vpn/src/features/auth/signup/pages/forgot_password_screen.dart';
import 'package:flutter_vpn/src/features/auth/signup/pages/login_screen.dart';
import 'package:flutter_vpn/src/features/auth/signup/pages/sign_up_screen.dart';
import 'package:flutter_vpn/src/features/auth/signup/pages/splash_screen.dart';
import 'package:flutter_vpn/src/features/home/page/home_page.dart';
import 'package:flutter_vpn/src/router/route_transition.dart'
    show buildPageWithFadeTransition;
import 'package:go_router/go_router.dart';

import 'error_route.dart';

class MyAppRouter {
  static final router = GoRouter(
    initialLocation: '/${AppRoute.splashScreen}',
    routes: [
      GoRoute(
        name: AppRoute.signupScreen,
        path: '/${AppRoute.signupScreen}',
        pageBuilder:
            (context, state) => buildPageWithFadeTransition<void>(
              context: context,
              state: state,
              child: const SignUpScreen(),
            ),
      ),
      GoRoute(
        name: AppRoute.loginScreen,
        path: '/${AppRoute.loginScreen}',
        pageBuilder:
            (context, state) => buildPageWithFadeTransition<void>(
              context: context,
              state: state,
              child: const LoginScreen(),
            ),
      ),
      GoRoute(
        name: AppRoute.forgotpasswordScreen,
        path: '/${AppRoute.forgotpasswordScreen}',
        pageBuilder:
            (context, state) => buildPageWithFadeTransition<void>(
              context: context,
              state: state,
              child: const ForgotPasswordScreen(),
            ),
      ),
      GoRoute(
        name: AppRoute.homeScreen,
        path: '/${AppRoute.homeScreen}',
        pageBuilder:
            (context, state) => buildPageWithFadeTransition<void>(
              context: context,
              state: state,
              child: const HomePage(),
            ),
      ),
        GoRoute(
        name: AppRoute.splashScreen,
        path: '/${AppRoute.splashScreen}',
        pageBuilder:
            (context, state) => buildPageWithFadeTransition<void>(
              context: context,
              state: state,
              child: const SplashScreen(),
            ),
      ),
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(child: ErrorPage());
    },
  );

  static void clearAndNavigate(BuildContext context, String name) {
    while (context.canPop()) {
      context.pop();
    }
    context.pushReplacementNamed(name);
  }
}

class AppRoute {
  static const String errorPage = 'error-page';
  static const String signupScreen = "Signup_screen";
  static const String loginScreen = "Login_screen";
  static const String forgotpasswordScreen = "Forgot_Password_screen";
  static const String homeScreen = "home_screen";
  static const String splashScreen = "spalsh_screen";
}
