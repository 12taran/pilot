

import 'package:pilot_project/core/base_services.dart';
import 'package:pilot_project/data/models/property_model.dart';

import '../../routes/api_routes.dart';

class PropertyRepo {
 
  Future<List<PropertyModel>> getProperties() async {
  final response = await BaseService().getData(
    endPoint: ApiRoutes().getProperties,
    isTokenRequired: false,
  );

  print(response.data);

  final json = response.data as Map<String, dynamic>;
  final List<dynamic> propertyList = json['properties'];

  return propertyList
      .map((property) => PropertyModel.fromMap(property))
      .toList();
}

}