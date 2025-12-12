import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:gifting_app/presentation/screens/auth_screen/login_screen.dart';

import '../presentation/screens/auth_screen/forget_password.dart';
import '../presentation/screens/auth_screen/new_password.dart';
import '../presentation/screens/auth_screen/otp_verification_screen.dart';
import '../presentation/screens/auth_screen/sign_up_screen.dart';
import '../presentation/screens/buttomNabBar_screen/bottom_nab_bar_screen.dart';
import '../presentation/screens/create_user/create_child_profile.dart';
import '../presentation/screens/create_user/edit_child_profile.dart';
import '../presentation/screens/create_user/subscription_plan.dart';
import '../presentation/screens/find_profile/other_dream_and_support_fund.dart';
import '../presentation/screens/find_profile/other_profile_screen.dart';
import '../presentation/screens/find_profile/other_reward_fund.dart';
import '../presentation/screens/find_profile/other_wish_list_view.dart';
import '../presentation/screens/home/notification_screen.dart';
import '../presentation/screens/home/rewarrd_fund_view.dart';
import '../presentation/screens/home/support_fund.dart';
import '../presentation/screens/home/total_submit.dart';
import '../presentation/screens/home/user_profile_screen.dart';
import '../presentation/screens/home/wish_list_view.dart';
import '../presentation/screens/onboarding_screen/onboarding_screen.dart';
import '../presentation/screens/setting/supportFAQ.dart';
import '../presentation/screens/splash_screen/splash_screen.dart';

class RoutePages {
  static String splashScreen = '/';

  static String onboardingScreen = '/OnboardingScreen';
  static String loginScreen = '/loginScreen';
  static String signUpScreen = '/SignUpScreen';
  static String forgetPassword = '/ForgetPassword';
  static String otpVerificationScreen = '/OtpVerificationScreen';
  static String newPassword = '/NewPassword';
  static String bottomNabBarScreen = '/BottomNabBarScreen';

  static String supportFQA = '/SupportFQA';
  static String notificationScreen = '/NotificationScreen';
  static String createChildProfile = '/CreateChildProfile';
  static String editChildProfile = '/EditChildProfile';
  static String subscriptionPlan = '/SubscriptionPlan';
  static String userProfileScreen = '/UserProfileScreen';
  static String wishListView = '/WishListView';
  static String rewardFundView = '/RewardFundView';
  static String supportFund = '/SupportFund';
  static String otherProfileScreen = '/OtherProfileScreen';
  static String otherWishListView = '/OtherWishListView';
  static String otherRewardFund = '/OtherRewardFund';
  static String otherDreamAndSupportFund = '/OtherDreamAndSupportFund';
  static String totalSubmit = '/TotalSubmit';
}

final pages = [
  GetPage(
    name: RoutePages.splashScreen,
    page: () => SplashScreen(),
     transition: Transition.native,
  ),
  GetPage(
    name: RoutePages.onboardingScreen,
    page: () => OnboardingScreen(),
     transition: Transition.native,
  ),
  GetPage(
    name: RoutePages.loginScreen,
    page: () => LoginScreen(),
    transition: Transition.native,
  ),
  GetPage(
    name: RoutePages.signUpScreen,
    page: () => SignUpScreen(),
   transition: Transition.native,
  ),
  GetPage(
    name: RoutePages.forgetPassword,
    page: () => ForgetPassword(),
     transition: Transition.native,
  ),
  GetPage(
    name: RoutePages.otpVerificationScreen,
    page: () => OtpVerificationScreen(),
     transition: Transition.native,
  ),
  GetPage(
    name: RoutePages.newPassword,
    page: () => NewPassword(),
    transition: Transition.native,
  ),
  GetPage(
    name: RoutePages.bottomNabBarScreen,
    page: () => BottomNabBarScreen(),
     transition: Transition.native,
  ),
  GetPage(
    name: RoutePages.supportFQA,
    page: () => SupportFaq(),
    transition: Transition.native,
  ),
  GetPage(
    name: RoutePages.notificationScreen,
    page: () => NotificationScreen(),
     transition: Transition.native,
  ),
  GetPage(
    name: RoutePages.createChildProfile,
    page: () => CreateChildProfile(),
     transition: Transition.native,
  ),
  GetPage(
    name: RoutePages.editChildProfile,
    page: () => EditChildProfile(),
     transition: Transition.native,
  ),
  GetPage(
    name: RoutePages.subscriptionPlan,
    page: () => SubscriptionPlan(),
     transition: Transition.native,
  ),
  GetPage(
    name: RoutePages.userProfileScreen,
    page: () => UserProfileScreen(),
     transition: Transition.native,
  ),
  GetPage(
    name: RoutePages.wishListView,
    page: () => WishListView(),
     transition: Transition.native,
  ),
  GetPage(
    name: RoutePages.rewardFundView,
    page: () => RewardFundView(),
     transition: Transition.native,
  ),
  GetPage(
    name: RoutePages.supportFund,
    page: () => SupportFund(),
    transition: Transition.native,
  ),
  GetPage(
    name: RoutePages.otherProfileScreen,
    page: () => OtherProfileScreen(),
    transition: Transition.native,
  ), GetPage(
    name: RoutePages.otherWishListView,
    page: () => OtherWishListView(),
    transition: Transition.native,
  ), GetPage(
    name: RoutePages.otherRewardFund,
    page: () => OtherRewardFund(),
     transition: Transition.native,
  ), GetPage(
    name: RoutePages.otherDreamAndSupportFund,
    page: () => OtherDreamAndSupportFund(),
     transition: Transition.native,
  ), GetPage(
    name: RoutePages.totalSubmit,
    page: () => TotalSubmitPage(),
     transition: Transition.native,
  ),

];
