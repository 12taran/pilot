import 'package:pilot_project/core/base_services.dart';
import 'package:pilot_project/core/utils.dart';
import 'package:pilot_project/data/models/user_model.dart';
import 'package:pilot_project/routes/api_routes.dart';

class UserRepo {
  ApiRoutes apiRoutes = ApiRoutes();
  Future<bool> userEdit(String userId, String fullname, String address) async {
    final response = await BaseService().patchData(
        endPoint: "${apiRoutes.userEdit}/$userId",
        body: {"fullname": fullname, "address": address},
        isTokenRequired: false);
    if (response.data['success'] == true) {
      Utils.showToast(message: response.data['message']);
      
      return true;
    } else {
      Utils.showToast(message: response.data['message']);
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
