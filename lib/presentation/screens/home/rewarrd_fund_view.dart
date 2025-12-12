import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/image_paths.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_wishList_card.dart';

class RewardFundView extends StatefulWidget {
  const RewardFundView({super.key});

  @override
  State<RewardFundView> createState() => _RewardFundViewState();
}

class _RewardFundViewState extends State<RewardFundView> {

  List<Map<String, Object>> itemList = [
    {
      "image": ImagePaths.otpVerify,
      "description": "Barbie Deluxe Style Fashion Doll",
      "price": 100,
    },
    {
      "image": ImagePaths.otpVerify,
      "description": "Lego Star Wars Mini Pack",
      "price": 45,
    },
    {
      "image": ImagePaths.otpVerify,
      "description": "Lego Star Wars Mini Pack",
      "price": 45,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidgets.customAppBar(title: "Reward Fund"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),

            /// Avatar
            Center(
              child: Container(
                width: 102.w,
                height: 102.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3.w),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      spreadRadius: 5.r,
                      blurRadius: 7.r,
                      offset: Offset(0, 3.h),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    ImagePaths.avatarProfile3,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20.h),

            /// Greeting
            Text(
              'John Deu',
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xffFD7839),
              ),
            ),

            SizedBox(height: 24.h),


            /// ------------------- Decoration images -------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImagePaths.rewardFundBg,height: 88,width: 335,),
              ],
            ),

            Image.asset(
              ImagePaths.rewardFund,
              width: 46.w,
              height: 46.h,
            ),

            SizedBox(height: 24.h),

            /// Wish List Items
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                final Map item = itemList[index];

                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),

                  child: WishListItemCard(cardImage: item["image"], description: item["description"], price: item["price"], contributeOnPressed: () {  },isBalanceShow: false,),

                );
              },
            ),

            SizedBox(height: 16.h),

            /// Add Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffE2C1F3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Text(
                  "+ Add Item",
                  style: TextStyle(fontSize: 16.sp, color: Colors.black),
                ),
              ),
            ),

            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
