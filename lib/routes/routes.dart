
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
import '../presentation/screens/home/notification_screen.dart';
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



}

final pages = [
  GetPage(
    name: RoutePages.splashScreen,
    page: () => SplashScreen(),
    // transition: Transition.noTransition,
  ),
  GetPage(
    name: RoutePages.onboardingScreen,
    page: () => OnboardingScreen(),
    // transition: Transition.noTransition,
  ),
  GetPage(
    name: RoutePages.loginScreen,
    page: () => LoginScreen(),
    // transition: Transition.noTransition,
  ),
  GetPage(
    name: RoutePages.signUpScreen,
    page: () => SignUpScreen(),///
    // transition: Transition.noTransition,
  ),
  GetPage(
    name: RoutePages.forgetPassword,
    page: () => ForgetPassword(),
    // transition: Transition.noTransition,
  ),
  GetPage(
    name: RoutePages.otpVerificationScreen,
    page: () => OtpVerificationScreen(),
    // transition: Transition.noTransition,
  ),
  GetPage(
    name: RoutePages.newPassword,
    page: () => NewPassword(),
    // transition: Transition.noTransition,
  ),
  GetPage(
    name: RoutePages.bottomNabBarScreen,
    page: () => BottomNabBarScreen(),
    // transition: Transition.noTransition,
  ),
  GetPage(
    name: RoutePages.supportFQA,
    page: () => SupportFaq(),
    // transition: Transition.noTransition,
  ),
  GetPage(
    name: RoutePages.notificationScreen,
    page: () => NotificationScreen(),
    // transition: Transition.noTransition,
  ),
  GetPage(
    name: RoutePages.createChildProfile,
    page: () => CreateChildProfile(),
    // transition: Transition.noTransition,
  ),
  GetPage(
    name: RoutePages.editChildProfile,
    page: () => EditChildProfile(),
    // transition: Transition.noTransition,
  ), GetPage(
    name: RoutePages.subscriptionPlan,
    page: () => SubscriptionPlan(),
    // transition: Transition.noTransition,
  ),


];
