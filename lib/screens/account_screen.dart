// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vehicle_booking/utils/data.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final box = GetStorage();
  // String? userEmail = profile["email"];
  String? userProfilePhoto = profile["image"];
  // String? userMobileNo = profile["mobile"];
  // String? userPassword = profile["password"];
  bool showPassword = false;
  // String username = "";
  String get userEmail => box.read('useremail') ?? "";
  String get userMobileNo => box.read('usermobile') ?? "";
  String get userPassword => box.read('userpassword') ?? "";
  String get username => box.read('username') ?? "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16),
              CircleAvatar(
                backgroundImage: NetworkImage(userProfilePhoto!),
                radius: 60,
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildInfoRow('Full name', username),
                  SizedBox(height: 16),
                  buildInfoRow('Email', userEmail),
                  SizedBox(height: 16),
                  buildInfoRow('Mobile Number', userMobileNo),
                  SizedBox(height: 16),
                  buildPasswordRow(),
                  SizedBox(height: 16),
                  buildLogoutRow(context),
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis
                  .horizontal, // Scroll horizontally if the content overflows
              child: Text(
                value,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPasswordRow() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            'Password: ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              obscureText: !showPassword,
              controller: TextEditingController(text: userPassword),
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                hintText: 'Password',
                border: InputBorder.none,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
            child: Icon(
              showPassword ? Icons.visibility_off : Icons.visibility,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLogoutRow(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Logout: ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () {
              final box = GetStorage();
              // box.write("islogged", false);
              box.remove("islogged");
              box.remove("useremail");
              box.remove("usermobile");
              box.remove("userpassword");
              box.remove("username");
              Get.offNamed("/loginscreen");
            },
            child: Icon(
              Icons.logout,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
