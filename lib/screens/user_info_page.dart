// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, depend_on_referenced_packages, sort_child_properties_last, must_be_immutable, prefer_final_fields
import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vehicle_booking/services/fire_base_service.dart';
import 'package:vehicle_booking/theme/color.dart';

class UserInfoScreen extends StatelessWidget {
  UserInfoScreen({Key? key});
  final box = GetStorage();
  String get email => box.read('useremail') ?? "";
  String get password => box.read('userpassword') ?? "";
  // box.remove("useremail");
  TextEditingController _name = TextEditingController();
  TextEditingController _mobileno = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TextField for Full Name
            TextField(
              controller: _name,
              decoration: InputDecoration(
                labelText: "Full Name",
                border: OutlineInputBorder(),
                fillColor: AppColor.textBoxColor,
                filled: true,
              ),
            ),
            SizedBox(height: 20),
            // TextField for Mobile Number
            TextField(
              controller: _mobileno,
              decoration: InputDecoration(
                labelText: "Mobile Number",
                border: OutlineInputBorder(),
                fillColor: AppColor.textBoxColor,
                filled: true,
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            // Next Button
            ElevatedButton(
              onPressed: () {
                box.write("username", _name.text);
                box.write("usermobile", _mobileno.text);
                String output = FirebaseOperations.addUserData(
                    _mobileno.text, _name.text, email, password);
                log(output + "data output");
                Get.offNamed('/homescreen');
              },
              child: Text("Submit"),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.buttonColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
