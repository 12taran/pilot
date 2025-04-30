import 'package:pilot_project/core/base_services.dart';
import 'package:pilot_project/data/models/board_member.dart';
import 'package:pilot_project/routes/api_routes.dart';

class BoardMemberRepo {
  Future<MemberResponse> getBoardMembers() async {
    final response = await BaseService().getData(
      endPoint: ApiRoutes().getBoardMembers,
      isTokenRequired: false,
    );
    return MemberResponse.fromJson(response.data);
  }
}
