// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vehicle_booking/theme/color.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TextField for Username or Email
            TextField(
              decoration: InputDecoration(
                labelText: "Username or Email",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.primary),
                ),
                filled: true,
                fillColor: AppColor.textBoxColor,
              ),
            ),
            SizedBox(height: 20),
            // TextField for Password
            TextField(
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.primary),
                ),
                filled: true,
                fillColor: AppColor.textBoxColor,
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),

            ElevatedButton(
                onPressed: () {
                  final box = GetStorage();
                  box.write("islogged", true);

                  Get.offNamed('/homescreen');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.buttonColor,
                ),
                child: Text("Login")),

            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Get.offNamed('/listtransactions');
              },
              child: Text(
                "Don't have an account? Sign up",
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
