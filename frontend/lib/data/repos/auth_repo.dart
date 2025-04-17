import 'package:http/http.dart';
import 'package:pilot_project/core/base_services.dart';
import 'package:pilot_project/core/utils.dart';
import 'package:pilot_project/routes/api_routes.dart';

class AuthRepo {
  ApiRoutes apiRoutes = ApiRoutes();
  Future<bool> userRegisterVerify(String phone) async {
    final response = await BaseService().postData(
        endPoint: apiRoutes.userRegisterVerify,
        body: {"phoneNumber": phone},
        isTokenRequired: false);
    if (response.data['success'] == true) {
      Utils.showToast(message: response.data['message']);
      return true;
    } else {
      Utils.showToast(message: response.data['message']);
      return false;
    }
  }
}
