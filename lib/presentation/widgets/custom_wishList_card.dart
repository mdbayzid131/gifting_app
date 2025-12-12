import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishListItemCard extends StatelessWidget {
  final String cardImage;
  final String description;
  final int price;
  final VoidCallback contributeOnPressed;
  final bool? isBalanceShow;

  const WishListItemCard({
    super.key,
    required this.cardImage,
    required this.description,
    required this.price,
    required this.contributeOnPressed, this.isBalanceShow=true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      height: 108.h,
      decoration: BoxDecoration(
        color: const Color(0xffF4E9F6),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Image.asset(cardImage, width: 70.w, height: 70.h),
          SizedBox(width: 10.w),

          Expanded(
            child: Text(
              description,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xff101828),
                height: 1.3,
              ),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isBalanceShow==true ?Text(
                "\$$price",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ): Container(),
              SizedBox(height: 6.h),

              ElevatedButton(
                onPressed: contributeOnPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFFEC54),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Text("Contribute", style: TextStyle(fontSize: 12.sp)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
