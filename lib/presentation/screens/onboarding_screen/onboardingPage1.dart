import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/image_paths.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

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
        SizedBox(height: 24),
        Image.asset(ImagePaths.onboarding1),
        SizedBox(height: 24),
        Text(
          'Empower your child to reach\ntheir goals with rewards that\nturn into meaningful gifts and\nexperiences.',
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
