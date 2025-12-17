import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// It's good practice to centralize your colors.
// For this example, I'll define them as constants here.
const Color _gradientStart = Color(0xffE2C1F3);
const Color _gradientEnd = Color(0xffFFFDEB);
const Color _borderColor = Color(0xffF2F2F2);
const Color _textColor = Color(0xff101828);
const Color _viewButtonColor = Color(0xffFFEC54);

/// A container that displays a fund with an image, title, and action buttons.
class CustomFundContainer extends StatelessWidget {
  final String title;
  final Widget image;
  final VoidCallback viewOnPressed;
  final VoidCallback? addOnPressed;

  /// Determines whether the "Add" button is visible.
  /// Defaults to `true`.
  final bool isMyProfile;

  const CustomFundContainer({
    super.key,
    required this.title,
    required this.image,
    required this.viewOnPressed,
    this.addOnPressed,
    this.isMyProfile = true,
  });

  @override
  Widget build(BuildContext context) {
    // Height changes based on whether the second button is shown.
    final containerHeight = isMyProfile ? 240.h : 180.h;

    return Container(
      padding: EdgeInsets.all(10.w),
      height: containerHeight,
      width: 102.w,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [_gradientStart, _gradientEnd],
        ),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: _borderColor, width: 1.w),
      ),
      child: Column(
        children: [
          // Title
          Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: _textColor,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 15.h),

          // Image
          Expanded(child: image),
          SizedBox(height: 20.h),

          // View Button
          SizedBox(
            height: 36.h,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: viewOnPressed,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),

                backgroundColor: _viewButtonColor,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: Text(
                "View",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),

          // Add Button (conditionally shown)
          if (isMyProfile)
            SizedBox(
              height: 36.h,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: addOnPressed,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  backgroundColor: _gradientStart, // Re-using existing color
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child:  Text("Add",style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),),
              ),
            ),
        ],
      ),
    );
  }
}
