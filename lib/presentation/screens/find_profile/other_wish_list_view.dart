import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/image_paths.dart';
import '../../widgets/circular_profile_avatar.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_wishList_card.dart';

class OtherWishListView extends StatefulWidget {
  const OtherWishListView({super.key});

  @override
  State<OtherWishListView> createState() => _OtherWishListViewState();
}

class _OtherWishListViewState extends State<OtherWishListView> {
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
      appBar: CustomWidgets.customAppBar(title: "Wish List Fund"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),

            /// Avatar
            Center(
              child: CircularProfileAvatar(
                assetImage: ImagePaths.avatarProfile2,
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
                Image.asset(
                  ImagePaths.wishListBg,
                  height: 88.h,
                  width: 335.w,
                ),
              ],
            ),

            Image.asset(
              ImagePaths.wishListFund,
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

                  child: WishListItemCard(cardImage: item["image"], description: item["description"], price: item["price"],),

                );
              },
            ),

            SizedBox(height: 16.h),
          ],
        ),
      ),

    );
  }
}
