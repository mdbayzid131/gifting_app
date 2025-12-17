import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/image_paths.dart';
import '../../../core/utils/app_dialog.dart';
import '../../widgets/circular_profile_avatar.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_wishList_card.dart';
import 'add_item_popUp.dart';

///<===================Support Fund View=========================>///
class SupportFund extends StatefulWidget {
  const SupportFund({super.key});

  @override
  State<SupportFund> createState() => _SupportFundState();
}

class _SupportFundState extends State<SupportFund> {
  List<Map<String, Object>> itemList = [
    {
      "image": "assets/dummy_image/car_image.png",
      "description": "Barbie Deluxe Style Fashion Doll",
      "price": 100,
    },
    {
      "image": 'assets/dummy_image/img.png',
      "description": "Lego Star Wars Mini Pack",
      "price": 45,
    },
    {
      "image": 'assets/dummy_image/img_1.png',
      "description": "Lego Star Wars Mini Pack",
      "price": 45,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidgets.customAppBar(title: "Support Fund"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),

            ///<===================Avatar=========================>///
            Center(
              child: CircularProfileAvatar(
                assetImage: ImagePaths.avatarProfile2,
              ),
            ),

            SizedBox(height: 20.h),

            ///<===================Greeting=========================>///
            Text(
              'John Deu',
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xffFD7839),
              ),
            ),

            SizedBox(height: 20.h),

            ///<===================Decoration Images=========================>///
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImagePaths.supportFundBg,
                  height: 88.h,
                  width: 335.w,
                ),
              ],
            ),


            Image.asset(
              ImagePaths.dremFund,
              width: 46.w,
              height: 46.w,
            ),

            SizedBox(height: 24.h),

            ///<===================Fund Items=========================>///
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                final Map item = itemList[index];

                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: WishListItemCard(
                    cardImage: item["image"],
                    description: item["description"],
                    price: item["price"],
                    isBalanceShow: false,
                  ),
                );
              },
            ),

            SizedBox(height: 16.h),

            ///<===================Add Button=========================>///
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  AppDialog.show(context: context, child: const PopupBody(),animation: DialogAnimation.fade);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffE2C1F3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12.h),
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
