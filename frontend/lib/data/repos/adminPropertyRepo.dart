import 'dart:io';

import 'package:pilot_project/core/base_services.dart';
import 'package:pilot_project/data/models/property_model.dart';
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

  Future<List<PropertyModel>> getPropertiesbyId(
    String userId,
  ) async {
    try {
      var response = await BaseService().getData(
        endPoint: "${ApiRoutes().getAdiminProperties}/${userId}",
        queryBody: {"userId": userId},
        isTokenRequired: false,
      );
      print(response.data);

      final json = response.data as Map<String, dynamic>;
      final List<dynamic> propertyList = json['properties'];

      return propertyList
          .map((property) => PropertyModel.fromMap(property))
          .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
