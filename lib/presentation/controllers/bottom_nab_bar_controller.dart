import 'package:get/get.dart';
import '../screens/create_user/create_user.dart';
import '../screens/find_profile/find_profile.dart';
import '../screens/home/home_screen.dart';
import '../screens/setting/setting_screen.dart';



class BottomNabBarController extends GetxController{
  /// <=========== Bottom Navigation Bar ===============>///

  RxInt currentIndex = 0.obs;


  RxList pages = [
    HomeScreen(),
    FindProfile(),
    CreateUser(),
    SettingScreen(),

  ].obs;

  void changePage(int index) {
    currentIndex.value = index;
  }
}