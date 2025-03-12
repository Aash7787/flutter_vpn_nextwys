import 'package:flutter/material.dart';

PageRoute<T> buildPageWithDefaultTransition<T>({
  required Widget child,
}) {
  return MaterialPageRoute<T>(
    builder: (context) => child,
  );
}

PageRoute<T> buildPageWithSlideTransition<T>({
  required Widget child,
}) {
  return PageRouteBuilder<T>(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    ),
  );
}

PageRoute<T> buildPageWithFadeTransition<T>({
  required Widget child,
}) {
  return PageRouteBuilder<T>(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}

