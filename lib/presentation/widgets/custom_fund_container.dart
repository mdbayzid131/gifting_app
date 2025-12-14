import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///<===================Custom Fund Container=========================>///
class CustomFundContainer extends StatelessWidget {
  final String title;
  final Widget image;
  final VoidCallback viewOnPressed;
  final VoidCallback? addOnPressed;
  final bool? isMyProfile;

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
    return Container(
      padding: EdgeInsets.all(10.w),

      height: isMyProfile == true ? 240.h : 180.h,
      width: 102.w,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xffE2C1F3), Color(0xffFFFDEB)],
        ),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: const Color(0xffF2F2F2),
          width: 1.w,
        ),
      ),

      //<===================Column=========================>///
      child: Column(
        children: [
          ///<===================Title=========================>///
          Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xff101828),
            ),

            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,

          ),

          SizedBox(height: 15.h),

          ///<===================Image=========================>///
          Expanded(child: image),

          SizedBox(height: 20.h),

          ///<===================View Button=========================>///
          ElevatedButton(
            onPressed: viewOnPressed,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(82.w, 36.h),
              backgroundColor: const Color(0xffFFEC54),
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            child: const Text("View"),
          ),

          SizedBox(height: 4.h),

          ///<===================Add Button=========================>///
          isMyProfile == true
              ? ElevatedButton(
            onPressed: addOnPressed,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(82.w, 36.h),
              backgroundColor: const Color(0xffE2C1F3),
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            child: const Text("Add"),
          )
              : Container(),
        ],
      ),
    );
  }
}
