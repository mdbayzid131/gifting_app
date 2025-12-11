import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:gifting_app/presentation/widgets/custom_elevated_button.dart';

import '../../../core/constants/app_color.dart';
import '../../../routes/routes.dart';
import '../auth_screen/login_screen.dart';
import 'onboardingPage1.dart';
import 'onboardingPage2.dart';
import 'onboardingPage3.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SafeArea(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() => _currentPage = index);
                  },
                  children: [
                    OnboardingPage1(),
                    OnboardingPage2(),
                    OnboardingPage3(),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                          width: 12.w,
                          height: 12.h,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? AppColors.primary
                                : Colors.white,
                            border: Border.all(
                              color: _currentPage == index
                                  ? Colors.black
                                  : AppColors.primary,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    _currentPage == 1
                        ? Row(
                            children: [
                              Expanded(
                                child: CustomElevatedButton(
                                  label: 'Back',
                                  onPressed: () {
                                    if (_currentPage < 2) {
                                      _pageController.previousPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    } else {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => LoginScreen(),
                                        ),
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(double.infinity, 48),
                                    backgroundColor: const Color(0xffFDFCFA),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      side: BorderSide(
                                        color: AppColors.primary,
                                        width: 2.w,
                                      ),
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.h),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: CustomElevatedButton(
                                  label: 'Next',
                                  onPressed: () {
                                    if (_currentPage < 2) {
                                      _pageController.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    } else {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => LoginScreen(),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          )
                        : CustomElevatedButton(
                            onPressed: () {
                              if (_currentPage < 2) {
                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              } else {
                                Get.toNamed(RoutePages.loginScreen);
                              }
                            },
                            label: _currentPage < 2 ? "Get Started" : "Get Started",
                          ),

                    SizedBox(height: 22.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {Get.toNamed(RoutePages.loginScreen);},
                          child: Row(
                            children: [
                              Text(
                                "Skip",
                                style: TextStyle(
                                    color: Color(0xff333333), fontSize: 14.sp),
                              ),
                              SizedBox(width: 6.w),
                              Icon(Icons.arrow_forward_ios_outlined),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
