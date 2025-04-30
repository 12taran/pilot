import 'package:get/get.dart';
import 'package:pilot_project/data/models/board_member.dart';
import 'package:pilot_project/data/repos/boardmember_repo.dart';

class BoardMemberController extends GetxController {
  Rx<MemberResponse?> boardMembers = Rx<MemberResponse?>(null);
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadMembers();
  }

  Future<void> loadMembers() async {
    MemberResponse response = await BoardMemberRepo().getBoardMembers();
    boardMembers.value = response;
  }
}
