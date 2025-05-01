import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BankController extends GetxController {
  // Observable variables
 
  final TextEditingController accountHolderController = TextEditingController();
  final TextEditingController ifscController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController confirmAccountNumberController = TextEditingController();
  RxString accountType = ''.obs;

  // Method to update name
 
}