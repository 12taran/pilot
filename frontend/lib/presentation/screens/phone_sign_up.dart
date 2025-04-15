import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/components/MyTextField.dart';
import 'package:pilot_project/core/components/custom_buttons.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/presentation/controllers/authController.dart';
import 'package:pilot_project/routes/page_route.dart';

class PhoneSignUpScreen extends StatefulWidget {
  const PhoneSignUpScreen({super.key});

  @override
  PhoneSignUpScreenState createState() => PhoneSignUpScreenState();
}

class PhoneSignUpScreenState extends State<PhoneSignUpScreen> {
  final AuthController authController = Get.put(AuthController());

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  int start = 30;
  Timer? _timer;
  void startTimer() {
    start = 30;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (start == 0) {
        timer.cancel();
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Obx(() => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome,',
                    style: GoogleFonts.acme(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontSize: Constants.fontSizeHeading * 1.5),
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    'Sign Up to Continue!',
                    style: GoogleFonts.acme(
                      fontSize: Constants.fontSizeHeading,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).textTheme.labelMedium?.color,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.1),
                  MyTextField(
                    labelText: "Mobile Number",
                    controller: authController.phoneController,
                    textStyle:
                        GoogleFonts.acme(fontSize: Constants.fontSizeBody),
                    onChanged: (v) {},
                    focusedBorderColor: Colors.green.withBlue(200),
                    isLabelEnabled: false,
                    validator: (v) =>
                        v!.isEmpty ? 'Mobile Number is required' : null,
                    keyboardType: TextInputType.phone,
                  ),
                  if (authController.isOtpSent.value) ...[
                    const SizedBox(height: 16),
                    MyTextField(
                      labelText: "Enter OTP",
                      controller: authController.otpController,
                      textStyle:
                          GoogleFonts.acme(fontSize: Constants.fontSizeBody),
                      onChanged: (v) {},
                      focusedBorderColor: Colors.green.withBlue(200),
                      isLabelEnabled: false,
                      validator: (v) => v!.isEmpty ? 'OTP is required' : null,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: start == 0
                          ? () {
                              authController.sendOtp();
                              startTimer();
                            }
                          : null,
                      child: Text(
                        start > 0 ? "Resend OTP in $start sec" : "Resend OTP",
                        style: TextStyle(
                          color: start > 0 ? Colors.grey : Colors.blue,
                          decoration: start > 0
                              ? TextDecoration.none
                              : TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 30),
                  CustomButtons(
                    text: authController.isOtpSent.value
                        ? "Verify OTP"
                        : "Send OTP",
                    onPressed: authController.isOtpSent.value
                        ? authController.verifyOtp
                        : () {
                            print('Sending Otp');
                            authController.sendOtp();
                            startTimer();
                          },
                  ),
                ],
              ),
            )));
  }
}
