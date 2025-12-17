import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_color.dart';
import '../../../routes/routes.dart';
import '../../widgets/custom_elevated_button.dart';
import 'onboardingPage1.dart';
import 'onboardingPage2.dart';
import 'onboardingPage3.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  ///<================= PAGE CONTROLLER =========================>///
  final PageController _pageController = PageController();

  ///<================= CURRENT PAGE INDEX =========================>///
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///<================= BODY =========================>///
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              ///<================= PAGE VIEW =========================>///
              Expanded(
                flex: 3,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() => _currentPage = index);
                  },
                  children: const [
                    OnboardingPage1(),
                    OnboardingPage2(),
                    OnboardingPage3(),
                  ],
                ),
              ),

              ///<================= BOTTOM SECTION =========================>///
              Flexible(
                fit: FlexFit.loose,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 8.h),

                    ///<================= PAGE INDICATOR =========================>///
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                            (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          width: 10.w,
                          height: 10.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index
                                ? AppColors.primary
                                : Colors.white,
                            border: Border.all(
                              color: _currentPage == index
                                  ? Colors.black
                                  : AppColors.primary,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 16.h),

                    ///<================= BUTTON SECTION =========================>///
                    _currentPage == 1
                        ? Row(
                      children: [
                        Expanded(
                          child: CustomElevatedButton(
                            label: 'Back',
                            onPressed: () {
                              _pageController.previousPage(
                                duration:
                                const Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize:
                              Size(double.infinity, 48.h),
                              backgroundColor:
                              const Color(0xffFDFCFA),
                              elevation: 0,
                              padding:  EdgeInsets.symmetric(
                                vertical: 10.h,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(10.r),
                                side: BorderSide(
                                  color: AppColors.primary,
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: CustomElevatedButton(
                            label: 'Next',
                            onPressed: () {
                              _pageController.nextPage(
                                duration:
                                const Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                          ),
                        ),
                      ],
                    )
                        : CustomElevatedButton(
                      label: "Get Started",
                      onPressed: () {
                        if (_currentPage < 2) {
                          _pageController.nextPage(
                            duration:
                            const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        } else {
                          Get.toNamed(RoutePages.loginScreen);
                        }
                      },
                    ),

                    SizedBox(height: 12.h),

                    ///<================= SKIP BUTTON =========================>///
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Get.toNamed(RoutePages.loginScreen);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Skip",
                              style: TextStyle(
                                color: const Color(0xff333333),
                                fontSize: 13.sp,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 14.sp,
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 6.h),
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
