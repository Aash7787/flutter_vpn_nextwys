import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vpn/src/features/home/page/about_page.dart';
import 'package:flutter_vpn/src/features/home/page/setting_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:share_plus/share_plus.dart';

class DrawerC extends StatefulWidget {
  const DrawerC({super.key});

  @override
  State<DrawerC> createState() => _DrawerCState();
}

class _DrawerCState extends State<DrawerC> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User? user;

  Future<User?> _signInWithGoogle() async {
    // Sha1 key AA:7B:97:5F:99:8D:11:71:E7:B1:B3:2F:86:DB:5C:08:42:EF:23:34

    // project : project-506745316875

    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null; // User canceled sign-in

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      return userCredential.user;
    } catch (e) {
      log('Error signing in with Google: $e');
      if (!mounted) return null;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Check your connection and try again')),
      );
      return null;
    }
  }

  Future<bool> signOutFromGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    log('$user');
    return Drawer(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.8), // 80% transparency

      child: Column(
        children: [
          // Custom "AppBar" in the Drawer
          Container(
            color: Colors.blue,
            padding: EdgeInsets.only(top: 30, bottom: 30),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 40, color: Colors.blue),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () async {
                          user = await _signInWithGoogle();
                          if (user != null) {
                            log('$user');
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Signed in as: ${user?.displayName ?? 'Guest'}',
                                ),
                              ),
                            );
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                "assets/images/google.jpg",
                                height: 20,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Sign in",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: signOutFromGoogle,
                        icon: Icon(Icons.logout),
                      ),
                      // Using Expanded to avoid infinite width issue
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Unstable connection? Click here",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
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
