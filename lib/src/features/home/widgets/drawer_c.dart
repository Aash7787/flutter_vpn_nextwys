import 'package:flutter/material.dart';
import 'package:flutter_vpn/src/features/home/page/about_page.dart';
import 'package:flutter_vpn/src/features/home/page/setting_page.dart';
import 'package:share_plus/share_plus.dart';

class DrawerC extends StatelessWidget {
  const DrawerC({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.8), // 80% transparency

      child: Column(
        children: [
          // Custom "AppBar" in the Drawer
          Container(
            color: Colors.blue,
            padding: EdgeInsets.only(top: 40, bottom: 20),
            child: Row(
              children: [
                SizedBox(width: 10),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Colors.blue),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    // Handle Google Sign-In
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset("assets/images/google.jpg", height: 20),
                        SizedBox(width: 5),
                        Text(
                          "Sign in",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                // Using Expanded to avoid infinite width issue
                Expanded(
                  child: ListTile(
                    title: Text(
                      "Unstable connection? Click here",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow:
                          TextOverflow
                              .ellipsis, // Ensures text doesn't overflow
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),

          // Drawer Menu Items
          ListTile(
            leading: Icon(Icons.bolt, color: Colors.blue),
            title: Text("Smart proxy", style: TextStyle(fontSize: 16)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.share, color: Colors.blue),
            title: Text("Share", style: TextStyle(fontSize: 16)),
            onTap: () {
              Share.share('https://flutter.dev/');
            },
          ),
          ListTile(
            leading: Icon(Icons.star, color: Colors.blue),
            title: Text("Rate us", style: TextStyle(fontSize: 16)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.question_answer, color: Colors.blue),
            title: Text("FAQ", style: TextStyle(fontSize: 16)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blue),
            title: Text("Settings", style: TextStyle(fontSize: 16)),
            onTap: () => Navigator.pushNamed(context, SettingPage.route),
          ),
          ListTile(
            leading: Icon(Icons.info, color: Colors.blue),
            title: Text("About", style: TextStyle(fontSize: 16)),
            onTap: () => Navigator.pushNamed(context, AboutPage.route),
          ),
        ],
      ),
    );
  }
}
