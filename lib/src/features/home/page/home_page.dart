import 'package:flutter/material.dart';
import 'package:flutter_vpn/src/features/auth/signup/controller/auth_controller.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const route = 'home/page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            AuthController().logout(context);
          },
          child: Icon(Icons.logout),
        ),
      ),
      body: Center(child: Text("Hellow World")),
    );
  }
}
