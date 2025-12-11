import 'package:get/get.dart';

import '../presentation/controllers/auth_controller.dart';
import '../presentation/controllers/bottom_nab_bar_controller.dart';
import '../presentation/controllers/creat_profile_controller.dart';
import '../presentation/controllers/homepgeController.dart';
import '../presentation/controllers/settingController.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<AuthController>(() => AuthController());
    Get.put(AuthController());
    Get.put(BottomNabBarController());
    Get.put(SettingController());
    Get.put(HomePageController());
    Get.put(CreateProfileController());
  }
}
