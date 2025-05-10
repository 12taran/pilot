import 'package:pilot_project/core/base_services.dart';
import 'package:pilot_project/data/models/invest_model.dart';
import 'package:pilot_project/routes/api_routes.dart';

class InvestmentRepo{
  Future<List<InvestmentModel>> getInvestments(String userId) async {
    try{
  final response = await BaseService().getData(
    endPoint: "${ApiRoutes().getInvestments}/$userId",
  
    isTokenRequired: false, // or true if needed
  );

  print(response.data);

  final json = response.data as Map<String, dynamic>;
  final List<dynamic> investmentList = json['investments']; // Adjust key based on your API response

  return investmentList
      .map((investment) => InvestmentModel.fromJson(investment))
      .toList();
}
catch(e){
      print(e);
      return [];
    }
  }

  

}