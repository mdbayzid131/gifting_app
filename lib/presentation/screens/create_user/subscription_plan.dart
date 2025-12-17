import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/image_paths.dart';
import '../../widgets/custom_appbar.dart';

class SubscriptionPlan extends StatefulWidget {
  const SubscriptionPlan({super.key});

  @override
  State<SubscriptionPlan> createState() => _SubscriptionPlanState();
}

class _SubscriptionPlanState extends State<SubscriptionPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///<================= APP BAR =========================>///
      appBar: CustomWidgets.customAppBar(title: 'Subscription Plan'),

      ///<================= BODY =========================>///
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),

              ///<================= TITLE =========================>///
              Center(
                child: Text(
                  'Get Premium',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff333333),
                  ),
                ),
              ),

              SizedBox(height: 12.h),

              ///<================= SUB TITLE =========================>///
              Center(
                child: Text(
                  'Subscribe to premium for exclusive features\nand an ad-free experience!',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff555555),
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 24.h),

              ///<================= PREMIUM CARD =========================>///
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(14.r),
                decoration: BoxDecoration(
                  color: const Color(0xffFD7839),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
                    ///<================= ICON =========================>///
                    Container(
                      height: 48.w,
                      width: 48.w,
                      decoration: BoxDecoration(
                        color: const Color(0xffEBE9E9),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          ImagePaths.king,
                          height: 28.h,
                          width: 28.w,
                        ),
                      ),
                    ),

                    SizedBox(height: 12.h),

                    ///<================= PRICE =========================>///
                    Text(
                      'Only \$4.99 / Monthly',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 6.h),

                    ///<================= DESCRIPTION =========================>///
                    Text(
                      'Unlock unlimited child profiles and premium gifting options',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 14.h),

                    ///<================= SUBSCRIBE BUTTON =========================>///
                    SizedBox(
                      width: double.infinity,
                      height: 42.h,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child: Text(
                          'Subscribe Now',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xffFD7839),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24.h),

              ///<================= BENEFITS TITLE =========================>///
              Text(
                'Benefits List :',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 14.h),

              ///<================= BENEFITS ITEMS =========================>///
              _buildBenefitItem('Create unlimited child profiles'),
              _buildBenefitItem('Access premium gift themes instantly'),
              _buildBenefitItem('Priority support when you need it'),
              _buildBenefitItem('Cancel anytime, no strings'),

              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }

  ///<================= BENEFIT ROW WIDGET =========================>///
  Widget _buildBenefitItem(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.done_outlined,
            size: 22.sp,
            color: const Color(0xff333333),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
