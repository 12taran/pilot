import 'package:pilot_project/core/base_services.dart';
import 'package:pilot_project/core/utils.dart';
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

  Future<void> buyProperty({
    required String propertyId,
    required String userId,
    required double areaToBuy,
  }) async {
    final response = await BaseService().postData(
      endPoint: ApiRoutes().buyProperty, // Define this in ApiRoutes
      body: {
        'propertyId': propertyId,
        'userId': userId,
        'areaToBuy': areaToBuy,
      },
      isTokenRequired: false, // or true if needed
    );

    print(response.data);

    final json = response.data as Map<String, dynamic>;
    final success = json['success'] ?? false;

    if (success) {
      final message = json['message'];
      print("✅ Success: $message");
      Utils.showToast(message: message);
    } else {
      final message = json['message'];
      print("❌ Failed: $message");
      Utils.showToast(message: message);
    }
  }
}
