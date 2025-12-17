import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/image_paths.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///<================= TOP SPACE =========================>///
        const Spacer(flex: 2),

        ///<================= APP LOGO =========================>///
        Image.asset(
          ImagePaths.giftZees,
          height: 63.h,
          width: 218.w,
        ),

        const Spacer(flex: 1),

        ///<================= MAIN ILLUSTRATION =========================>///
        Expanded(
          flex: 5,
          child: Image.asset(
            ImagePaths.onboarding3,
            height: 271.h,
            width: 231.w,
          ),
        ),
        SizedBox(height: 10.h),



        ///<================= DESCRIPTION TEXT =========================>///
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'Children use these funds\ntowards Wishlist items they\nchoose and enriching\nexperiences they truly value.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xff333333),
              height: 1.3,
            ),
          ),
        ),

        const Spacer(flex: 2),
      ],
    );
  }
}
