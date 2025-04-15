import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:pilot_project/core/utils.dart';
import 'package:pilot_project/routes/page_route.dart';

class AuthController extends GetxController {
  TextEditingController otpController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  RxBool isOtpSent = false.obs;

  void sendOtp() {
    isOtpSent.value = true;
    if (phoneController.text.trim() == "") {
      Utils.showGetXToast(
          title: "Mobile Number Required",
          message: "Please enter Mobile Number");
      isOtpSent.value = false;
    } else {
      if (phoneController.text.trim().length < 10 ||
          phoneController.text.trim().length > 10) {
        Utils.showGetXToast(
            title: "Invalid mobile Number",
            message: "Please enter Mobile Number");
        isOtpSent.value = false;
      }
    }
  }

  void verifyOtp() {
    if (otpController.text.trim() == "0000") {
      Get.offAndToNamed(PageRoutes.bottomNav);
    }
  }
}
