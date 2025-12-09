import 'package:get/get.dart';

import '../presentation/controllers/auth_controller.dart';
import '../presentation/controllers/bottom_nab_bar_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<AuthController>(() => AuthController());
    Get.put(AuthController());
    Get.put(BottomNabBarController());
    // Get.put(DailyTrackingController());
  }
}
