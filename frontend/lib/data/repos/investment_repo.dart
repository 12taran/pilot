import 'package:pilot_project/core/base_services.dart';
import 'package:pilot_project/data/models/invest_model.dart';
import 'package:pilot_project/routes/api_routes.dart';

class InvestmentRepo {
  Future<List<InvestmentModel>> getInvestments(String userId) async {
  try {
    final response = await BaseService().getData(
      endPoint: "${ApiRoutes().getInvestments}/$userId",
      isTokenRequired: false,
    );

    print(response.data);

    final json = response.data as Map<String, dynamic>;

    if (json['investments'] == null || json['investments'] is! List) {
      return [];
    }

    final List<dynamic> investmentList = json['investments'];

    return investmentList
        .map((investment) => InvestmentModel.fromJson(investment))
        .toList();
  } catch (e) {
    print("Error fetching investments: $e");
    return [];
  }
}

}
