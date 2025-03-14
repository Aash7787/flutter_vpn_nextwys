import 'package:flutter/material.dart';
import 'package:flutter_vpn/src/features/home/page/about_page.dart';
import 'package:flutter_vpn/src/features/home/page/setting_page.dart';

class DrawerC extends StatelessWidget {
  const DrawerC({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
           ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: () => Navigator.pushNamed(context, SettingPage.route),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => Navigator.pushNamed(context, SettingPage.route),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () => Navigator.pushNamed(context, AboutPage.route),
          ),
        ],
      ),
    );
  }
}
