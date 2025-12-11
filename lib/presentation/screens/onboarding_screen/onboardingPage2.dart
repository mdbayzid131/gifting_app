import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/image_paths.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 90.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset(ImagePaths.giftZees)],
        ),
        SizedBox(height: 24.h),
        Image.asset(ImagePaths.onboarding2),
        SizedBox(height: 24.h),
        Text(
          'Family and friends can\ncelebrate achievements by\nsending monetary rewards\nthrough the app.',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xff333333),
            height: 1.22,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
