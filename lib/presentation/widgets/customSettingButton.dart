import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomSettingButton extends StatelessWidget {
  final String label;
  final String imagePath;
  final void Function() onPressed;

  const CustomSettingButton({
    super.key,
    required this.label,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          double.infinity,
          55.h, // Set height to 48
        ),
        backgroundColor: Color(0xffFFFAF8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        padding:  EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: 10.w,
        ), // Adjusted padding
        side: BorderSide(color: Color(0xffF3F3F3), width: 1),
        shadowColor: Color(0xffF3F3F3),
      ),
      child: Row(
        children: [
          SvgPicture.asset(imagePath, fit: BoxFit.scaleDown),
          SizedBox(width: 10.w),
          Text(
            label,
            style: TextStyle(
              color: Color(0xff333333),
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              height: 1.4,
            ),
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios, color: Color(0xff333333)),
        ],
      ),
    );
  }
}