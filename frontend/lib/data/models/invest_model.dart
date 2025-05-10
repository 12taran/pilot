import 'package:pilot_project/data/models/property_model.dart';
import 'package:pilot_project/data/models/user_model.dart';

class InvestmentModel {
  final String id;
  final UserResponse user;
  final PropertyModel property;
  final double areaInvested;
  final double priceAtPurchase;
  final UserResponse admin;

  InvestmentModel({
    required this.id,
    required this.user,
    required this.property,
    required this.areaInvested,
    required this.priceAtPurchase,
    required this.admin,
  });

  factory InvestmentModel.fromJson(Map<String, dynamic> json) {
    // If 'propertyId' is missing or null, return a PropertyModel with default values
    final property = json['propertyId'] != null
        ? PropertyModel.fromMap(json['propertyId'])
        : PropertyModel(id: '', projectName: '', images: [], address: '', latitude: 0.0, longitude: 0.0, price: 0, type: '', description: '', createdAt: '', updatedAt: '');

    return InvestmentModel(
      id: json['_id'] ?? '', // Default to empty string if '_id' is null
      user: UserResponse.fromJson(json['userId'] ?? {}), // If 'userId' is null, use an empty map
      property: property,
      areaInvested: (json['areaInvested'] as num?)?.toDouble() ?? 0.0, // Default to 0.0 if null
      priceAtPurchase: (json['priceAtPurchase'] as num?)?.toDouble() ?? 0.0, // Default to 0.0 if null
      admin: json['adminId'] != null
          ? UserResponse.fromJson(json['adminId'])
          : UserResponse(), // Use an empty UserResponse if 'adminId' is null
    );
  }
}


