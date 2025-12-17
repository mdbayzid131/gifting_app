import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gifting_app/presentation/widgets/custom_elevated_button.dart';

import '../../core/constants/app_color.dart';
import '../../routes/routes.dart';

///<===================Add Confirm Popup=========================>///


class AddConfirmPopUp extends StatelessWidget {
  const AddConfirmPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ///<===================Blur Background=========================>///
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(color: Colors.black.withOpacity(0.4)),
        ),

        ///<===================Popup Card=========================>///
        Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              width: 320.w,
              height: 200.h,
              padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 15.h),
              decoration: BoxDecoration(
                color: const Color(0xffFFFAF8),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Column(
                children: [
                  ///<===================Close Button=========================>///
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child:  Icon(
                          Icons.close,
                          size: 20.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10.h),

                  ///<===================Message=========================>///
                  Expanded(
                    child: Text(
                      'If you want to add more than 3 products, you’ll need to get a subscription.',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333),
                        decoration: TextDecoration.none,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  SizedBox(height: 10.h),

                  ///<===================Confirm Button=========================>///
                  Row(
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          label: 'Back',
                          onPressed: () {
                            Navigator.pop(context);
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
                          label: 'Confirm',
                          onPressed: () {
                            Navigator.pop(context);
                            Get.toNamed(RoutePages.subscriptionPlan);
                          },
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
