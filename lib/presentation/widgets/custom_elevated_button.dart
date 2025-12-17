import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_color.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final ButtonStyle? style;


  const CustomElevatedButton({super.key, required this.label, required this.onPressed, this.style});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: style ?? ElevatedButton.styleFrom(
        minimumSize: Size(
          double.infinity,
          48.h, // Set height to 48
        ),
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        padding:  EdgeInsets.symmetric(
          vertical: 10.h,
        ), // Adjusted padding
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 18.sp,
          height: 1.4,
        ),
      ),
    );
  }
}
