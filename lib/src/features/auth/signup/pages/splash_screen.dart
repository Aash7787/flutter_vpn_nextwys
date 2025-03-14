import 'package:flutter/material.dart';
import 'package:flutter_vpn/src/features/auth/signup/pages/login_screen.dart';
import 'package:flutter_vpn/src/features/home/page/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const route = 'splash/screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? uid = prefs.getString("uid"); // Check if user is logged in

    Future.delayed(Duration(seconds: 3), () {
      if (uid != null && uid.isNotEmpty) {
        Navigator.pushNamed(context, HomePage.route); // Go to Home if logged in
      } else {
        Navigator.pushNamed(
          context,
          LoginScreen.route,
        ); // Go to Login if not logged in
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "NextWaysVPN",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
