import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/presentation/controllers/userController.dart';
//import 'package:pilot_project/presentation/screens/onboarding/onboarding.dart';
import 'package:pilot_project/routes/page_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// @author PRINCE DUBEY
/// @email princedubey80066@gmail.com
/// @DATE 11/04/2025);

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;
  Usercontroller usercontroller = Get.put(Usercontroller());
  @override
  void initState() {
    super.initState();

    // Trigger animation
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    // Navigate after delay
    Future.delayed(const Duration(seconds: 3), () async {
      if (FirebaseAuth.instance.currentUser != null) {
        final sharedPreferences = await SharedPreferences.getInstance();
        log('User id h ${sharedPreferences.getString(Constants.USER_ID)}');
        usercontroller.getUserDetails(
            sharedPreferences.getString(Constants.USER_ID) ?? "");
        usercontroller.setuserDetail(usercontroller.userDetail.value);
        await Get.offAndToNamed(PageRoutes.bottomNav);
      } else {
        Get.offAndToNamed(PageRoutes.onboarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(seconds: 2),
          opacity: _opacity,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/icon/logo.png",
                  height: 200,
                  width: 200,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "The Best Investment on Earth is Earth",
                  style: GoogleFonts.acme(
                    textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: Constants.fontSizeHeading,
                        ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
