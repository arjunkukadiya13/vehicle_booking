// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, depend_on_referenced_packages, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreen extends StatelessWidget {
  final box = GetStorage();
  bool get islogged => box.read('islogged') ?? false;
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      if (islogged == true) {
        Get.offNamed("/homescreen");
      } else {
        Get.offNamed("/loginscreen");
      }
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Truck Booking',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
