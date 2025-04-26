import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pilot_project/core/session_manager.dart';
import 'package:pilot_project/core/utils.dart';
import 'package:pilot_project/data/repos/auth_repo.dart';
import 'package:pilot_project/routes/page_route.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthController extends GetxController {
  TextEditingController otpController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  RxBool isOtpSent = false.obs;
  RxBool verifyngOtp = false.obs;
  String verificationIds = "";
  RxBool isGuest = true.obs;

  // 🔽 Google Sign-In instance
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> sendOtp(bool isLogin) async {
    String phoneRaw = phoneController.text.trim();

    if (phoneRaw == "") {
      Utils.showGetXToast(
          title: "Mobile Number Required",
          message: "Please enter Mobile Number");
      isOtpSent.value = false;
      return;
    }

    if (phoneRaw.length != 10) {
      Utils.showGetXToast(
          title: "Invalid mobile Number",
          message: "Please enter a valid 10-digit Mobile Number");
      isOtpSent.value = false;
      return;
    }

    String phone = "+91$phoneRaw";

    bool doesExist = await AuthRepo().userLogin(phoneRaw);
    if (!doesExist && isLogin) {
      return;
    } else {
      print('I am here');
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (credential) {},
        verificationFailed: (FirebaseAuthException ex) {
          print("OTP verification failed: ${ex.code} - ${ex.message}");
          Utils.showToast(message: ex.code.toString());
          isOtpSent.value = false;
        },
        codeSent: (verificationId, resendToken) {
          verificationIds = verificationId;
          isOtpSent.value = true;
        },
        codeAutoRetrievalTimeout: (verificationId) {},
        timeout: const Duration(seconds: 30),
      );
    }
  }

  void verifyOtp(bool isLogin) async {
    String otp = otpController.text.trim();
    if (otp.length < 6) {
      Utils.showToast(message: 'Enter 6 Digit OTP');
    } else {
      verifyngOtp.value = true;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationIds,
        smsCode: otp,
      );
      verificationIds = '';
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        if (userCredential.user != null) {
          isGuest.value = false;
          //  phoneController.clear();
          otpController.clear();
          if (!isLogin) {
            bool verified = await userRegisterVerify(
                phoneController.text.trim(),
                nameController.text,
                addressController.text);
            if (verified) {
              Get.offAndToNamed(PageRoutes.bottomNav);
            }
          } else {
            Get.offAndToNamed(PageRoutes.bottomNav);
          }

          print(nameController.text);
        }
      } on FirebaseAuthException catch (e) {
        print(e.code.toString());
        Utils.showToast(
          message: "Unable to login at this moment. Please try again later.",
        );
      } finally {
        verifyngOtp.value = false;
      }
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        Utils.showToast(message: 'Google Sign-In canceled');
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (userCredential.user != null) {
        Get.offAllNamed(PageRoutes.bottomNav);
      }
    } catch (e) {
      print("Google Sign-In error: $e");
      Utils.showToast(message: 'Google Sign-In failed. Please try again.');
    }
  }

  Future<bool> userRegisterVerify(
      String phone, String name, String address) async {
    bool isSuccess = await AuthRepo().userRegisterVerify(phone, name, address);
   
    return isSuccess;
  }

  Future<UserCredential?> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      log('Facebook Login Status: ${loginResult.status}');
      if (loginResult.status == LoginStatus.failed) {
        log('Facebook Login Error: ${loginResult.message}');
        return null;
      }

      if (loginResult.accessToken != null) {
        log('Facebook Access Token: ${loginResult.accessToken!.tokenString}');
      }

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      final userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);

      Get.offAndToNamed(PageRoutes.bottomNav);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        final email = e.email;
        final pendingCred = e.credential;

        // Fetch the list of providers linked to this email
        final signInMethods =
            await FirebaseAuth.instance.fetchSignInMethodsForEmail(email!);

        if (signInMethods.contains('google.com')) {
          // Ask user to sign in with Google and link Facebook
          Get.defaultDialog(
            title: 'Account Conflict',
            middleText:
                'This account already exists with Google. Do you want to sign in with Google and link Facebook?',
            textConfirm: 'Continue',
            textCancel: 'Cancel',
            onConfirm: () {
              Get.back(); // close dialog
              signInWithGoogleAndLinkFacebook(pendingCred!);
            },
            onCancel: () {
              Get.back();
            },
          );
        } else {
          log('Conflicting email: $email');

          print('Linked with another provider: $signInMethods');
        }
      } else {
        print('Firebase Auth Error: ${e.message}');
      }
    } catch (e) {
      print('Error during Facebook sign-in: $e');
    }

    return null;
  }

  Future<void> signInWithGoogleAndLinkFacebook(
      AuthCredential pendingCredential) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        Utils.showToast(message: 'Google Sign-In canceled');
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final googleCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with Google
      UserCredential googleUserCredential =
          await FirebaseAuth.instance.signInWithCredential(googleCredential);

      // Now link Facebook credential to this user
      await googleUserCredential.user?.linkWithCredential(pendingCredential);

      Utils.showToast(message: 'Facebook account linked successfully!');
      Get.offAllNamed(PageRoutes.bottomNav);
    } catch (e) {
      print("Error linking Facebook with Google account: $e");
      Utils.showToast(message: 'Failed to link accounts.');
    }
  }
}
