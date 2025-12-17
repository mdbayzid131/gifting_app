import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/image_paths.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

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
            ImagePaths.onboarding2,
            height: 223.h,
            width: 335.w,
          ),
        ),

        SizedBox(height: 10.h),



        ///<================= DESCRIPTION TEXT =========================>///
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'Family and friends can\ncelebrate achievements by\nsending monetary rewards\nthrough the app.',
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
