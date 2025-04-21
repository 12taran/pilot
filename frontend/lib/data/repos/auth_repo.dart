//import 'package:http/http.dart';
import 'package:pilot_project/core/base_services.dart';
import 'package:pilot_project/core/utils.dart';
import 'package:pilot_project/routes/api_routes.dart';

class AuthRepo {
  ApiRoutes apiRoutes = ApiRoutes();
  Future<bool> userRegisterVerify(String phone, ) async {
    final response = await BaseService().postData(
        endPoint: apiRoutes.userRegisterVerify,
        body: {
          "phoneNumber": phone,
 "fullname":'Sks',
          "address":"Gorakhpur"
        },
        isTokenRequired: false);
    print(response);
    print("Helllooo");
    if (response.data['success'] == true) {
      Utils.showToast(message: response.data['message']);
      return true;
    } else {
      Utils.showToast(message: response.data['message']);
      return false;
    }
  }

  Future<bool> registerUser(String phone, String name, {String? address}) async {
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
    return true;
  } else {
    Utils.showToast(message: response.data['message']);
    return false;
  }
}

}
