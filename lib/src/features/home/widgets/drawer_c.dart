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

  // Listen to auth state changes to update user state automatically.
  @override
  void initState() {
    super.initState();
    // Get the initial user from FirebaseAuth
    user = _auth.currentUser;
    _auth.authStateChanges().listen((User? newUser) {
      setState(() {
        user = newUser;
      });
      log("Auth state changed: $newUser");
    });
  }

  Future<User?> _signInWithGoogle() async {
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
        const SnackBar(content: Text('Check your connection and try again')),
      );
      return null;
    }
  }

  Future<bool> signOutFromGoogle() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      return true;
    } catch (e) {
      log('Error signing out: $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    log('Current user: $user');
    return Drawer(
      backgroundColor: const Color.fromRGBO(
        255,
        255,
        255,
        0.8,
      ), // 80% transparency
      child: Column(
        children: [
          // Custom header in the Drawer
          Container(
            color: Colors.blue,
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 40, color: Colors.blue),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () async {
                          final signedInUser = await _signInWithGoogle();
                          if (signedInUser != null) {
                            // No need to manually update 'user' here because
                            // the authStateChanges listener will update it.
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Signed in as: ${signedInUser.displayName ?? 'Guest'}',
                                ),
                              ),
                            );
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
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
                              const SizedBox(width: 5),
                              const Text(
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
                      const Spacer(),
                      IconButton(
                        onPressed: () async {
                          final result = await signOutFromGoogle();
                          if (result) {
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Signed out successfully'),
                              ),
                            );
                          } else {
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Sign out failed')),
                            );
                          }
                        },
                        icon: const Icon(Icons.logout),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Unstable connection? Click here",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 10),
                  // The welcome text now always reflects the persisted user state
                  Text(
                    'Welcome ${user?.displayName ?? 'Guest'}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Drawer Menu Items
          ListTile(
            leading: const Icon(Icons.bolt, color: Colors.blue),
            title: const Text("Smart proxy", style: TextStyle(fontSize: 16)),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.share, color: Colors.blue),
            title: const Text("Share", style: TextStyle(fontSize: 16)),
            onTap: () {
              Share.share('https://flutter.dev/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.star, color: Colors.blue),
            title: const Text("Rate us", style: TextStyle(fontSize: 16)),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.question_answer, color: Colors.blue),
            title: const Text("FAQ", style: TextStyle(fontSize: 16)),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.blue),
            title: const Text("Settings", style: TextStyle(fontSize: 16)),
            onTap: () => Navigator.pushNamed(context, SettingPage.route),
          ),
          ListTile(
            leading: const Icon(Icons.info, color: Colors.blue),
            title: const Text("About", style: TextStyle(fontSize: 16)),
            onTap: () => Navigator.pushNamed(context, AboutPage.route),
          ),
        ],
      ),
    );
  }
}
