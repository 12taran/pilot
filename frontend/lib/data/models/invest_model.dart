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
    return InvestmentModel(
      id: json['_id'],
      user: UserResponse.fromJson(json['userId']),
      property: PropertyModel.fromMap(json['propertyId']),
      areaInvested: (json['areaInvested'] as num).toDouble(),
      priceAtPurchase: (json['priceAtPurchase'] as num).toDouble(),
      admin: UserResponse.fromJson(json['adminId']),
    );
  }
}
