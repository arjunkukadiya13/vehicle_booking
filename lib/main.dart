// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vehicle_booking/firebase_options.dart';
import 'package:vehicle_booking/screens/account_screen.dart';
import 'package:vehicle_booking/screens/home_screen.dart';
import 'package:vehicle_booking/screens/list_transactions.dart';
import 'package:vehicle_booking/screens/login_screen.dart';
import 'package:get/get.dart';
import 'package:vehicle_booking/screens/search_screen.dart';
import 'package:vehicle_booking/screens/signup_screen.dart';
import 'package:vehicle_booking/screens/single_cart_screen.dart';
import 'package:vehicle_booking/screens/splash_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vehicle_booking/screens/truck_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vehicle_booking/screens/user_info_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: LoginScreen(),
      getPages: [
        GetPage(
          name: '/',
          page: () => SplashScreen(),
        ),
        GetPage(
          name: '/loginscreen',
          page: () => LoginScreen(),
        ),
        GetPage(
          name: '/homescreen',
          page: () => HomeScreen(),
        ),
        GetPage(
          name: '/truckscreen',
          page: () => TruckScreen(),
        ),
        GetPage(
          name: '/searchscreen',
          page: () => SearchScreen(),
        ),
        GetPage(
          name: '/signupscreen',
          page: () => SignUpScreen(),
        ),
        GetPage(
          name: '/userinfoscreen',
          page: () => UserInfoScreen(),
        ),
        GetPage(
          name: '/listtransactions',
          page: () => ListTranscation(),
        ),
        GetPage(
            name: '/accountscreen',
            page: () => AccountPage(),
            transition: Transition.downToUp),
      ],
      initialRoute: '/',
    );
  }
}
