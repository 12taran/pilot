import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KycController extends GetxController {
  final TextEditingController aadharController = TextEditingController();
  final TextEditingController panController = TextEditingController();

  var aadharError = RxnString();
  var panError = RxnString();

  void validateAadhar() {
    if (aadharController.text.isEmpty || aadharController.text.length != 12) {
      aadharError.value = "Enter a valid 12-digit Aadhar number";
    } else {
      aadharError.value = null;
    }
  }

  void validatePan() {
    if (panController.text.isEmpty ||
        !RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$').hasMatch(panController.text)) {
      panError.value = "Enter a valid PAN number";
    } else {
      panError.value = null;
    }
  }

  void clearControllers() {
    aadharController.clear();
    panController.clear();
    aadharError.value = null;
    panError.value = null;
  }

  @override
  void onClose() {
    aadharController.dispose();
    panController.dispose();
    super.onClose();
  }
}
