// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:get/get.dart';

// class FirebaseAPI {
//   final _firebaseMessaging = FirebaseMessaging.instance;
//   Future<void> initNotifications() async {
//     await _firebaseMessaging.requestPermission();
//     final fCToken = _firebaseMessaging.getToken();
//     print('Token: $fCToken.toString()');
//   }

//   void handleMessage(RemoteMessage? message) {
//     if (message == null) return;
//     Get.to(RootApp());
//   }

//   Future pushNotifications() async {
//     FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
//     FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
//   }
// }
