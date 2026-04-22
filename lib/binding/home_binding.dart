import 'package:get/get.dart';

<<<<<<< HEAD
=======
import '../data/repo/auth_repo.dart';
import '../data/repo/user_profile_manage_repo.dart';
import '../data/services/api_client.dart';
>>>>>>> api-integration
import '../presentation/controllers/auth_controller.dart';
import '../presentation/controllers/bottom_nab_bar_controller.dart';
import '../presentation/controllers/contribute_controller.dart';
import '../presentation/controllers/creat_profile_controller.dart';
import '../presentation/controllers/homepgeController.dart';
<<<<<<< HEAD
=======
import '../presentation/controllers/internet_controller.dart';
>>>>>>> api-integration
import '../presentation/controllers/settingController.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
<<<<<<< HEAD
    // Get.lazyPut<AuthController>(() => AuthController());
    Get.put(AuthController());
    Get.put(BottomNabBarController());
    Get.put(SettingController());
    Get.put(HomePageController());
    Get.put(CreateProfileController());
    Get.put(ContributeController());
=======
     // Get.lazyPut<AuthController>(() => AuthController());
    Get.put(ApiClient());
    Get.put(UserProfileManageRepo(apiClient: Get.find<ApiClient>()));
    Get.put(AuthRepo(apiClient: Get.find<ApiClient>()));

    Get.put(AuthController(Get.find<AuthRepo>()));

    Get.put(BottomNabBarController());
    Get.put(SettingController());
     Get.put(HomePageController(Get.find<UserProfileManageRepo>()), permanent: true);
     Get.put(CreateProfileController());
    Get.put(ContributeController());
    Get.put(NetworkController(), permanent: true);

>>>>>>> api-integration
  }
}
