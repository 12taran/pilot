import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pilot_project/core/utils.dart';
import 'package:pilot_project/data/repos/auth_repo.dart';
import 'package:pilot_project/routes/page_route.dart';

class AuthController extends GetxController {
  TextEditingController otpController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController=TextEditingController();
  RxBool isOtpSent = false.obs;
  RxBool verifyngOtp = false.obs;
  String verificationIds = "";
  RxBool isGuest = true.obs;

  // 🔽 Google Sign-In instance
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> sendOtp() async {
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
    bool doesExist=await AuthRepo().userLogin(phoneRaw);
     if (doesExist) {
            Get.offAndToNamed(PageRoutes.bottomNav);
          }

   else{
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
  }}

  void verifyOtp() async {
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
          bool verified = await userRegisterVerify(
              phoneController.text.trim());
              print(nameController.text);
          if (verified) {
            Get.offAndToNamed(PageRoutes.register);
          }
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

  Future<bool> userRegisterVerify(String phone) async {
    bool isSuccess = await AuthRepo().userRegisterVerify(phone);
    return isSuccess;
  }

  Future<bool> editUser(String fullname,String address ) async
  {bool isSuccess=await AuthRepo().userEdit("6805e94a873ed5bd0c51f356",
    fullname, address);
  return isSuccess;
  }
}
