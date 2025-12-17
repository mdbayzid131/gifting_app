import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaqTile extends StatelessWidget {
  final String question;
  final String answer;
  final bool initiallyExpanded;

  const FaqTile({
    super.key,
    required this.question,
    required this.answer,
    this.initiallyExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xffFFFAF8),
      elevation: 2,
      shadowColor: Colors.black12,
      margin: EdgeInsets.only(bottom: 10.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Theme(
        /// remove default divider line
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          initiallyExpanded: initiallyExpanded,
          tilePadding: EdgeInsets.symmetric(
            horizontal: 14.w,
            vertical: 10.h,
          ),
          childrenPadding: EdgeInsets.only(
            left: 14.w,
            right: 14.w,
            bottom: 14.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),

          /// Question
          title: Text(
            question,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xff333333),
            ),
          ),

          /// Arrow icon customize
          iconColor: const Color(0xff333333),
          collapsedIconColor: const Color(0xff333333),

          /// Answer
          children: [
            Text(
              answer,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                height: 1.5,
                color: const Color(0xff333333),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
