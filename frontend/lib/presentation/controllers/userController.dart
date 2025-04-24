import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilot_project/core/utils.dart';
import 'package:pilot_project/data/models/user_model.dart';
import 'package:pilot_project/data/repos/user_repo.dart';

class Usercontroller extends GetxController {
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final mobileController = TextEditingController();
  Future<void> setuserDetail(User user) async {
    nameController.text = user.fullname ?? "User";
    addressController.text = user.address ?? "Address";
    mobileController.text = user.phoneNumber ?? "Mobile";
  }

  Rx<User> userDetail = User().obs;
  UserRepo userRepo = UserRepo();
  Future<void> getUserDetails(String userId) async {
    final userResponse = await userRepo.getUserDetails(userId);
    if (userResponse != null) {
      userDetail.value = userResponse.user!;
      setuserDetail(userResponse.user ?? User());
    } else {
      Utils.showToast(message: "Something went wrong");
      return;
    }
  }

  Future<bool> editUser(String fullname, String address, String userId) async {
    bool isSuccess = await UserRepo().userEdit(userId, fullname, address);
    if (isSuccess) {
      await getUserDetails(userId);
    }
    return isSuccess;
  }
}
