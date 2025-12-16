import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gifting_app/presentation/widgets/custom_elevated_button.dart';

import '../../core/constants/app_color.dart';

class LogoutPopup extends StatelessWidget {
  const LogoutPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ///<=============== BLUR BACKGROUND ==================>///
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Container(
            color: Colors.black.withOpacity(0.45),
          ),
        ),

        ///<=============== POPUP CARD ==================>///
        Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              width: 320.w,
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  SizedBox(height: 10.h),

                  ///<=============== TITLE ==================>///
                  Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 10.h),

                  ///<=============== MESSAGE ==================>///
                  Text(
                    "Are you sure you want to logout from your account?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      height: 1.5,
                      color: Colors.black54,
                    ),
                  ),

                  SizedBox(height: 25.h),

                  ///<=============== ACTION BUTTONS ==================>///
                  Row(
                    children: [
                      ///<=============== CANCEL BUTTON ==================>///
                      Expanded(
                        child: CustomElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
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
                            padding: EdgeInsets.symmetric(
                              vertical: 10.h,
                            ),
                          ), label: 'Cancel',

                        ),
                      ),

                      SizedBox(width: 12.w),

                      ///<=============== LOGOUT BUTTON ==================>///
                      Expanded(
                        child: CustomElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);

                            /// TODO: Call logout logic here
                            /// authController.logout();
                          },
                           label: 'Logout',

                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
