import 'package:flutter/material.dart';
import 'package:flutter_vpn/src/common/image_url/image_url.dart';
import 'package:flutter_vpn/src/common/widgets/custom_app_bar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  static const route = '/about/page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'About'),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            SizedBox(height: 150, child: Image.asset(OtherImagesUrl.vpn)),
            Text(
              'SuperVpn',
              style: TextTheme.of(
                context,
              ).headlineMedium!.copyWith(color: Colors.blue),
            ),
            SizedBox(height: 10),
            Text('Version 1.0.0'),
            SizedBox(height: 20),
            Text(
              'Privacy Policy',
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
