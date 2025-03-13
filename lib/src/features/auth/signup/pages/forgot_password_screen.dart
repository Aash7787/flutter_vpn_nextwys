import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../../common/widgets/custom_elevated_button.dart';
import '../../../../common/widgets/text_widget.dart';
import '../../../../router/routes.dart';
import '../controller/auth_controller.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final AuthController _authController = AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 15),
            TextWidget(
              text: "Forgot Password",
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 50),
            Align(
              alignment: Alignment.centerLeft,
              child: TextWidget(
                text: "Enter your email to get \nrecovery mail",
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
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

            SizedBox(height: 42.0),
            CustomElevatedButton(
              onPressed: () {
                _authController.forgotPassword(
                  context,
                  emailController.text.trim(),
                );
              },
              text: "Send recovery mail",
              borderRadius: 8,
              backgroundColor: Colors.blue,
            ),
            SizedBox(height: 24.0),

            SizedBox(height: 24),

            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  context.pushNamed(AppRoute.signupScreen);
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
