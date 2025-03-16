import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vpn/src/common/widgets/custom_elevated_button.dart';
import 'package:flutter_vpn/src/common/widgets/text_widget.dart';
import 'package:flutter_vpn/src/features/auth/signup/controller/auth_controller.dart';
import 'package:flutter_vpn/src/features/auth/login/login_screen.dart';
import 'package:flutter_vpn/src/features/home/page/home_page.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const route = 'sign/up/screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String email = "", name = "", phone = "", password = "";
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isSecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 15),
            TextWidget(
              text: "Signup",
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 50),
            SizedBox(
              height: 42,
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  label: Text(
                    "Enter Your Name",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue,
                    ),
                  ),
                  labelStyle: TextStyle(),
                  prefixIcon: Icon(Icons.person, color: Colors.blue),
                  // focusColor: Colors.grey,
                  contentPadding: EdgeInsets.all(0),

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
                  prefixIcon: Icon(Icons.email, color: Colors.blue),

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
                controller: phoneController,
                decoration: InputDecoration(
                  label: Text(
                    "Enter Your Phone",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue,
                    ),
                  ),

                  prefixIcon: Icon(Icons.phone, color: Colors.blue),

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
            SizedBox(height: 42.0),
            CustomElevatedButton(
              onPressed: () {
                AuthController().signup(
                  context,
                  nameController.text.trim(),
                  emailController.text.trim(),
                  phoneController.text.trim(),
                );
              },
              text: "SignUp",
              borderRadius: 8,
              backgroundColor: Colors.blue,
            ),
            SizedBox(height: 24.0),

            Container(
              alignment: Alignment.center,
              child: TextWidget(text: "Or Signup with", color: Colors.black),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    var user = await AuthController().signInWithGoogle();
                    if (user != null) {
                      Navigator.pushNamed(context,
                        HomePage.route,
                      ); // Navigate to home screen
                    }
                  },
                  child: Image.asset(
                    "assets/icons/google.png",
                    height: 32,
                    width: 32,
                  ),
                ),
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
                      text: "Already have an account?",
                      color: Colors.black,
                      textAlign: TextAlign.center,
                    ),
                    TextWidget(
                      text: "SignIn",
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
