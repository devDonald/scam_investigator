import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scam_investigator/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startTime();
  }

// //update firebase token for every user for push notification
//   Future<bool> getUserLoginStatus() async {
//     if (auth.currentUser != null) {
//       _fcm.getToken().then((token) {
//         // print("Firebase Messaging Token: $token\n");
//         root
//             .collection('users')
//             .doc(auth.currentUser!.uid)
//             .update({"token": token});
//       });
//       return true;
//     } else {
//       return false;
//     }
//   }

  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() async {
    Get.offAll(() => HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    // initializePushNotification(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                child: Hero(tag: 'logo', child: Image.asset('images/logo.png')),
              ),
            ],
          ),
        ));
  }
}
