// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, depend_on_referenced_packages, sort_child_properties_last, dead_code, no_leading_underscores_for_local_identifiers
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vehicle_booking/theme/color.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool _isObscure = true;

    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        backgroundColor: AppColor.appBarColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TextField for Full Name
            TextField(
              controller: _email,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
                fillColor: AppColor.textBoxColor,
                filled: true,
              ),
            ),
            SizedBox(height: 20),
            // TextField for Password
            TextField(
              controller: _password,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
                fillColor: AppColor.textBoxColor,
                filled: true,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                    color: AppColor.labelColor, // You can use any color here
                  ),
                  onPressed: () {
                    // Toggle password visibility

                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
              ),
              obscureText: _isObscure,
            ),
            SizedBox(height: 20),
            // TextField for Confirm Password
            TextField(
              decoration: InputDecoration(
                labelText: "Confirm Password",
                border: OutlineInputBorder(),
                fillColor: AppColor.textBoxColor,
                filled: true,
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            // Sign-Up Button
            ElevatedButton(
              onPressed: () {
                final box = GetStorage();
                box.write("useremail", _email.text);
                box.write("userpassword", _password.text);
                Get.offNamed('/userinfoscreen');
              },
              child: Text("Sign Up"),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.buttonColor,
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Get.offNamed('/loginscreen');
              },
              child: Text(
                "Already have an account? Login",
                style: TextStyle(
                  color: AppColor.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
