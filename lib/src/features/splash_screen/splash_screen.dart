import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vpn/src/common/image_url/image_url.dart';
import 'package:flutter_vpn/src/features/home/page/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const router = '/splash/screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(
        context,
        HomePage.route,
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Center(child: Image.asset(OtherImagesUrl.vpn)),
            Center(child: CupertinoActivityIndicator()),
          ],
        ),
      ),
    );
  }
}
