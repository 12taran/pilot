import 'dart:io';

import 'package:pilot_project/core/base_services.dart';
import 'package:pilot_project/routes/api_routes.dart';

class AdminpropertyRepo {
  Future<bool> createProperties(
      Map<String, String> body, List<File> files) async {
    try {
      var response = await BaseService().postMultiPartData2(
          endPoint: ApiRoutes().addProperties,
          body: body,
          isTokenRequired: false,
          files: {"images": files});
      print(response.data);

      return response.data['success'];
    } catch (e) {
      print(e);
      return false;
    }
  }
}
