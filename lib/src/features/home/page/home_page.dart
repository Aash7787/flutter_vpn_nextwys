import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const route = 'home/page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(route)));
  }
}
