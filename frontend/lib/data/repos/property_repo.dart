

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
    return (response.data as List)
        .map((property) => PropertyModel.fromMap(property))
        .toList();
  }

  
}