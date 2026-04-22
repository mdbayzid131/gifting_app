<<<<<<< HEAD
=======
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
>>>>>>> api-integration
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
<<<<<<< HEAD
import 'package:gifting_app/core/constants/image_paths.dart';

=======
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:gifting_app/core/utils/custom_snackbar.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../../core/constants/image_paths.dart';
import '../../../core/utils/app_constants.dart';
import '../../../data/helper/prefs_helper.dart';
>>>>>>> api-integration
import '../../../routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
<<<<<<< HEAD
=======
  StreamSubscription<List<ConnectivityResult>>? _subscription;
  bool _hasNavigated = false;
>>>>>>> api-integration

  @override
  void initState() {
    super.initState();
<<<<<<< HEAD
    jumpToNextScreen();
  }

  void jumpToNextScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(RoutePages.onboardingScreen);
    });
  }
=======
    _listenInternet();
  }

  /// ================= INTERNET LISTENER =================
  void _listenInternet() {
    _subscription = Connectivity().onConnectivityChanged.listen((
      results,
    ) async {
      // No network interface
      if (results.isEmpty || results.contains(ConnectivityResult.none)) {
        _showNoInternet();
        return;
      }

      // Actual internet check
      bool hasInternet = await InternetConnection().hasInternetAccess;

      if (hasInternet && !_hasNavigated) {
        _hasNavigated = true;
        Get.closeCurrentSnackbar();
        _navigate();
      } else if (!hasInternet) {
        _showNoInternet();
      }
    });
  }

  /// ================= NO INTERNET =================
  void _showNoInternet() {
    if (Get.isSnackbarOpen) return;

    showCustomSnackBar(
      isError: true,
      'No Internet Connection Please turn on internet to continue',
      duration: const Duration(days: 1),
    );
  }

  /// ================= NAVIGATION =================
  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 2));

    String token = await PrefsHelper.getString(AppConstants.bearerToken);

    if (!mounted) return;

    if (token.isNotEmpty) {
      Get.offAllNamed(RoutePages.bottomNabBarScreen);
    } else {
      Get.offAllNamed(RoutePages.onboardingScreen);
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

>>>>>>> api-integration
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
<<<<<<< HEAD
        padding:  EdgeInsets.symmetric(horizontal: 20.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(ImagePaths.splashImage,height: 101.h,width: 359.w,),
            )
=======
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagePaths.splashImage, height: 101.h, width: 359.w),
>>>>>>> api-integration
          ],
        ),
      ),
    );
  }
}
