import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vpn/src/features/auth/signup/controller/auth_controller.dart';
import 'package:flutter_vpn/src/features/auth/signup/pages/forgot_password_screen.dart';

import '../../../common/widgets/custom_elevated_button.dart';
import '../../../common/widgets/text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const route = 'login/screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isSecure = true;
  String email = "", password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 15),
            TextWidget(
              text: "SignIn",
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 50),

            SizedBox(height: 16.0),
            SizedBox(
              height: 42,
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  label: Text(
                    "Enter Your Email",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue,
                    ),
                  ),
                  prefixIcon: Icon(Icons.email_outlined, color: Colors.blue),

                  labelStyle: TextStyle(),
                  focusColor: Colors.grey,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 102, 177, 239),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 16.0),
            SizedBox(
              height: 42,
              child: TextFormField(
                controller: passwordController,
                obscureText: _isSecure,
                decoration: InputDecoration(
                  label: Text(
                    "Enter Your Password",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue,
                    ),
                  ),

                  prefixIcon: Icon(Icons.lock, color: Colors.blue),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSecure = !_isSecure;
                      });
                    },
                    child: Icon(
                      _isSecure ? Icons.visibility : Icons.visibility_off_sharp,
                      color: Colors.blue,
                    ),
                  ),

                  labelStyle: TextStyle(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 102, 177, 239),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context,ForgotPasswordScreen.route);
                },
                child: TextWidget(
                  text: "Forgot Password?",
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 42.0),
            CustomElevatedButton(
              onPressed: () {
                String email = emailController.text.trim();
                String password = passwordController.text.trim();

                AuthController().login(context, email, password);
              },
              text: "Sign In",
              borderRadius: 8,
              backgroundColor: Colors.blue,
            ),
            SizedBox(height: 24.0),

            Container(
              alignment: Alignment.center,
              child: TextWidget(text: "Or SignIn with", color: Colors.black),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/icons/google.png", height: 32, width: 32),
                SizedBox(width: 12),
                SvgPicture.asset(
                  "assets/icons/facebook.svg",
                  height: 32,
                  width: 32,
                ),
                SizedBox(width: 12),
                SvgPicture.asset(
                  "assets/icons/linkedin.svg",
                  height: 36,
                  width: 36,
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context,LoginScreen.route);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: "Don't have an account?",
                      color: Colors.black,
                      textAlign: TextAlign.center,
                    ),
                    TextWidget(
                      text: "Sign Up",
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
