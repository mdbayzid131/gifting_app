import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:gifting_app/core/constants/image_paths.dart';

import '../../../core/utils/app_constants.dart';
import '../../../data/helper/prefs_helper.dart';
import '../../../routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 3));

    String token = await PrefsHelper.getString(AppConstants.bearerToken);
    if (token.isNotEmpty) {
      Get.offAllNamed(RoutePages.bottomNabBarScreen);
    }
    else {
      Get.offAllNamed(RoutePages.onboardingScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                ImagePaths.splashImage,
                height: 101.h,
                width: 359.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
