import 'package:get/get.dart';

import '../data/repo/auth_repo.dart';
import '../data/services/api_client.dart';
import '../presentation/controllers/auth_controller.dart';
import '../presentation/controllers/bottom_nab_bar_controller.dart';
import '../presentation/controllers/contribute_controller.dart';
import '../presentation/controllers/creat_profile_controller.dart';
import '../presentation/controllers/homepgeController.dart';
import '../presentation/controllers/settingController.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<AuthController>(() => AuthController());
    /// Dependency Injection (GetX)
    Get.put(ApiClient());
    /// // ApiClient instance
    Get.put(AuthRepo(apiClient: Get.find<ApiClient>()));
    /// // AuthRepo instance
    Get.put(AuthController(Get.find<AuthRepo>()));
    /// // AuthController instance
    Get.put(BottomNabBarController());
    Get.put(SettingController());
    Get.put(HomePageController());
    Get.put(CreateProfileController());
    Get.put(ContributeController());
  }
}
