import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/image_paths.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 104),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset(ImagePaths.giftZees)],
        ),
        SizedBox(height: 24.h),
        Image.asset(ImagePaths.onboarding3),
        SizedBox(height: 24.h),
        Text(
          'Children use these funds\ntowards Wishlist items they\nchoose and enriching\nexperiences they truly value.',
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