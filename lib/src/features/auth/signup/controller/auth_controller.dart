import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vpn/src/features/auth/login/login_screen.dart';
import 'package:flutter_vpn/src/features/home/page/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  //  Signup Function
  Future<void> signup(
    BuildContext context,
    String name,
    String email,
    String password,
  ) async {
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      showMessage(context, "All fields are required.");
      return;
    }

    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      String uid = userCredential.user!.uid;

      await _firestore.collection("users").doc(uid).set({
        "uid": uid,
        "name": name,
        "email": email,
        "created_at": DateTime.now(),
      });

      // Store login status
      SharedPreferences prefers = await SharedPreferences.getInstance();
      await prefers.setString("uid", uid);
      await prefers.setBool("isLoggedIn", true);

      context.go('/home'); // Navigate to Home
    } catch (e) {
      showMessage(context, "Signup failed: ${e.toString()}");
    }
  }

  // Login Function
  Future<void> login(
    BuildContext context,
    String email,
    String password,
  ) async {
    if (email.isEmpty || password.isEmpty) {
      showMessage(context, "All fields are required.");
      return;
    }

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = userCredential.user!.uid;

      // Store user data in SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      DocumentSnapshot userDoc =
          await _firestore.collection("users").doc(uid).get();

      if (userDoc.exists) {
        await prefs.setString("uid", uid);
        await prefs.setString("name", userDoc["name"]);
        await prefs.setString("email", userDoc["email"]);
        await prefs.setBool("isLoggedIn", true);
      }

      context.go('/home');
    } catch (e) {
      // showMessage(context, "Invalid email or password.");
    }
  }

  //  Forgot Password Function
  Future<void> forgotPassword(BuildContext context, String email) async {
    if (email.isNotEmpty) {
      try {
        await _auth.sendPasswordResetEmail(email: email);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Password reset email sent! Check your inbox."),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error: ${e.toString()}")));
      }
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please enter your email.")));
    }
  }

  //  Logout Function
  Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clears all stored data
    await _auth.signOut();

    context.pushNamed(LoginScreen.route);
  }

  // Check if user is already logged in (For Splash Screen)
  Future<void> checkLoginStatus(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool("isLoggedIn");

    if (isLoggedIn == true) {
      context.pushNamed(HomePage.route);
    } else {
      context.pushNamed(LoginScreen.route);
    }
  }

  // google auth

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the Google Sign-In flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null; // If user cancels login

      // Get Google Auth details
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create Firebase credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase
      UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      // Store user info in SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("uid", userCredential.user!.uid);
      await prefs.setString("name", userCredential.user!.displayName ?? "");
      await prefs.setString("email", userCredential.user!.email ?? "");
      await prefs.setString("photoUrl", userCredential.user!.photoURL ?? "");

      return userCredential;
    } catch (e) {
      print("Google Sign-In Error: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut(); // Sign out from Firebase
      await GoogleSignIn().disconnect(); // Disconnect Google account
      await GoogleSignIn().signOut(); // Sign out from Google Sign-In
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear(); // Clear user data from SharedPreferences

      print("User signed out successfully");
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  //  Show SnackBar Messages
  void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
