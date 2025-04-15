import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/presentation/screens/email_password_sign_up.dart';
import 'package:pilot_project/presentation/screens/onboarding/onboarding.dart';

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
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
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
                Icon(
                  Icons.flutter_dash,
                  color: Theme.of(context).colorScheme.primary,
                  size: 100,
                ),
                const SizedBox(
                  height: 50,
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
