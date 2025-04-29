import 'dart:io';

import 'package:pilot_project/core/base_services.dart';
import 'package:pilot_project/core/utils.dart';
import 'package:pilot_project/data/models/user_model.dart';
import 'package:pilot_project/routes/api_routes.dart';

class UserRepo {
  ApiRoutes apiRoutes = ApiRoutes();
  Future<bool> userEdit(
      String userId, String fullname, String address, File? image) async {
    Map<String, dynamic> body = {
      "fullname": fullname,
      "address": address,
    };

    Map<String, File> files = {};

    if (image != null) {
      files["image"] = image;
    }

    final response = await BaseService().patchMultiPartData(
      endPoint: "${apiRoutes.userEdit}/$userId",
      body: body,
      files: files.isNotEmpty ? files : null, // Important!
      isTokenRequired: false,
    );

    if (response?.data['success'] == true) {
      Utils.showToast(message: response?.data['message']);
      return true;
    } else {
      Utils.showToast(
          message: response?.data['message'] ?? 'Something went wrong');
      return false;
    }
  }

  Future<UserResponse?> getUserDetails(String userId) async {
    final userResponse = await BaseService().getData(
      endPoint: "${apiRoutes.getUser}/$userId",
    );
    if (userResponse.data['success'] == true) {
      return UserResponse.fromJson(userResponse.data);
    } else {
      Utils.showToast(message: 'User not found');
      return null;
    }
  }
}
