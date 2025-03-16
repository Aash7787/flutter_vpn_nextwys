import 'package:flutter/material.dart';
import 'package:flutter_vpn/src/common/image_url/image_url.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset(OtherImagesUrl.vpn)));
  }
}
