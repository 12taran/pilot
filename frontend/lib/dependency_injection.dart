import 'package:get/get.dart';
import 'package:pilot_project/presentation/controllers/no_internet_controller.dart';

class DependencyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
