import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/components/CustomContainer.dart';
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
    authController.phoneController.clear();
    authController.nameController.clear();
    authController.otpController.clear();

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
        body: Obx(() => !authController.verifyngOtp.value
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome,',
                      style: GoogleFonts.acme(
                        fontWeight: FontWeight.bold,
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(
                                fontSize: Constants.fontSizeHeading * 1.5),
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
                      labelText: "Name",
                      controller: authController.nameController,
                      textStyle: GoogleFonts.acme(
                          fontSize: Constants.fontSizeBody,
                          color: Colors.black),
                      onChanged: (v) {},
                      focusedBorderColor: Theme.of(context).colorScheme.primary,
                      isLabelEnabled: false,
                      validator: (v) => v!.isEmpty ? ' Name is required' : null,
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: Get.height * 0.02),
                    MyTextField(
                      labelText: "Mobile Number",
                      maxLength: 10,
                      controller: authController.phoneController,
                      textStyle:
                          GoogleFonts.acme(fontSize: Constants.fontSizeBody,
                          color: Colors.black),
                      onChanged: (v) {},
                      focusedBorderColor: Theme.of(context).colorScheme.primary,
                      isLabelEnabled: false,
                      validator: (v) =>
                          v!.isEmpty ? 'Mobile Number is required' : null,
                      keyboardType: TextInputType.phone,
                    ),
                    MyTextField(
                      maxLength: 50,
                      labelText: "Address",
                      controller: authController.addressController,
                      textStyle:
                          GoogleFonts.acme(fontSize: Constants.fontSizeBody),
                      onChanged: (v) {},
                      focusedBorderColor: Theme.of(context).colorScheme.primary,
                      isLabelEnabled: false,
                      validator: (v) =>
                          v!.isEmpty ? ' Address is required' : null,
                      keyboardType: TextInputType.name,
                    ),
                    if (authController.isOtpSent.value) ...[
                      const SizedBox(height: 16),
                      MyTextField(
                        labelText: "Enter OTP",
                        maxLength: 6,
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
                                authController.sendOtp(false);
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
                    Center(
                      child: CustomButtons(
                          width: Get.width * 0.8,
                          fontSize: 14,
                          height: Get.height * 0.09,
                          text: authController.isOtpSent.value
                              ? "Verify OTP"
                              : "Send OTP",
                          onPressed: () async {
                            authController.isOtpSent.value
                                ? authController.verifyOtp(false)
                                : await authController.sendOtp(false);
                            print('Otp sends');
                          }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: CustomContainer(
                          padding: 0,
                          height: 50,
                          width: Get.width * 0.7,
                          borderRadius: 15,
                          borderColor: Theme.of(context).colorScheme.primary,
                          margin: const EdgeInsets.all(8),
                          child: TextButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.person, size: 20),
                                Text(
                                  'Continue as Guest',
                                  style: GoogleFonts.acme(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {
                              Get.offAndToNamed(PageRoutes.bottomNav);
                            },
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: CustomContainer(
                              padding: 0,
                              height: 50,
                              width: Get.width * 0.2,
                              borderRadius: 5,
                              borderColor: Colors.grey,
                              margin: const EdgeInsets.all(8),
                              child: TextButton(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset('assets/images/google.png'),
                                  ],
                                ),
                                onPressed: () async {
                                  await authController.signInWithGoogle();
                                },
                              )),
                        ),
                        Center(
                          child: CustomContainer(
                              padding: 0,
                              height: 50,
                              width: Get.width * 0.2,
                              borderRadius: 5,
                              borderColor: Colors.grey,
                              margin: const EdgeInsets.all(8),
                              child: TextButton(
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.facebook,
                                      size: 20,
                                      color: Colors.indigo,
                                    ),
                                  ],
                                ),
                                onPressed: () async {
                                  await authController.signInWithFacebook();
                                },
                              )),
                        ),
                      ],
                    ),
                    Center(
                      child: TextButton(
                        child: Text(
                          'Already a User? Sign In',
                          style: GoogleFonts.acme(
                              color: Theme.of(context).colorScheme.primary,
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  Theme.of(context).colorScheme.primary),
                        ),
                        onPressed: () {
                          Get.toNamed(PageRoutes.phonesignin);
                        },
                      ),
                    ),
                    /*Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.symmetric(vertical:5),
                      decoration: BoxDecoration(
                       color: Colors.white, // background color (optional)
    border: Border.all(
      color: Colors.blue, // border color
      width: 2.0,         // border width
    ),

                        borderRadius: BorderRadius.circular(5)
                      ),
                      width: Get.width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          Center(
                        child: InkWell(
                            onTap: () {
                              authController.signInWithGoogle();
                            },
                            child: Image.asset(
                              'assets/images/google.png',
                              height: 30,
                            )),
                      ),
                      const SizedBox(width: 10),
                       Center(
                            child: Text('Continue with Google'),
                          ),
                          
                        ],
                      ),
                    ),*/
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              )));
  }
}
