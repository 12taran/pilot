//import 'package:http/http.dart';
import 'package:pilot_project/core/base_services.dart';
import 'package:pilot_project/core/session_manager.dart';
import 'package:pilot_project/core/utils.dart';
import 'package:pilot_project/routes/api_routes.dart';

class AuthRepo {
  ApiRoutes apiRoutes = ApiRoutes();
  Future<bool> userRegisterVerify(
      String phone, String name, String address) async {
    final response = await BaseService().postData(
        endPoint: apiRoutes.userRegisterVerify,
        body: {"phoneNumber": phone, "fullname": name, "address": address},
        isTokenRequired: false);
    print(response);
    print("Helllooo");
    if (response.data['success'] == true) {
      Utils.showToast(message: response.data['message']);
      await SessionManager().setUserId(response.data['userId']);
      return true;
    } else {
      Utils.showToast(message: response.data['message']);
      return false;
    }
  }

  Future<bool> registerUser(String phone, String name,
      {String? address}) async {
    final response = await BaseService().postData(
      endPoint: apiRoutes.userRegister,
      body: {
        "phoneNumber": phone,
        "username": name,
        if (address != null && address.isNotEmpty) "address": address,
      },
      isTokenRequired: false,
    );

    if (response.data['success'] == true) {
      Utils.showToast(message: response.data['message']);
      await SessionManager().setUserId(response.data['userId']);
      return true;
    } else {
      Utils.showToast(message: response.data['message']);
      return false;
    }
  }

  Future<bool> userLogin(String phone) async {
    try {
      // Attempt the network call
      final response = await BaseService().postData(
        endPoint: apiRoutes.userLogin,
        body: {"phoneNumber": phone},
        isTokenRequired: false,
      );

      // Handle the response
      if (response.data['success'] == true) {
        // Success case
        // Utils.showToast(message: response.data['message']);
        await SessionManager().setUserId(response.data['userId']);
        return true;
      } else {
        // Failure case
        Utils.showToast(message: response.data['message']);

        return false;
      }
    } catch (e) {
      // Handle any exceptions during the network call
      Utils.showToast(message: "An error occurred: ${e.toString()}");
      return false; // Indicate failure
    }
  }
}
