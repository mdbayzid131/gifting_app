import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gifting_app/presentation/screens/home/rewarrd_fund_view.dart';
import 'package:gifting_app/presentation/screens/home/support_fund.dart';
import 'package:gifting_app/presentation/screens/home/total_submit.dart';
import 'package:gifting_app/presentation/screens/home/wish_list_view.dart';

import '../../../core/constants/image_paths.dart';
import '../../../core/constants/navigator.dart';
import '../../../routes/routes.dart';
import '../../widgets/VoiceRecordDialog.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_fund_container.dart';
import 'add_item_popUp.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  ///<================= RECENT ACTIVITIES =========================>///
  final List activities = [
    'Auntie Cherise bought you your Hello Kitty toy! Say thanks with a video or voice note!',
    'Mum & Dad gave you \$10 for your good grades! Say thanks with a video or voice note!',
    'Friend gifted you a new football!',
  ];

  ///<================= ACTIVITY DOT COLORS =========================>///
  final List<Color> _activityColors = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.blue,
  ];

  Color getRandomColor() {
    final Random random = Random();
    return _activityColors[random.nextInt(_activityColors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidgets.customAppBar(title: "User Profile"),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 20.h),

              ///<================= USER AVATAR =========================>///
              Center(
                child: Container(
                  width: 102.w,
                  height: 102.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 7,
                        offset: const Offset(0, 3),
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

              SizedBox(height: 24.h),

              ///<================= GREETING TEXT =========================>///
              Text(
                "Hello!",
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xffFD7839),
                ),
              ),

              SizedBox(height: 24.h),

              ///<================= TOTAL EARNED CARD =========================>///
              GestureDetector(
                onTap: () {

                  navigateTo(context,  TotalSubmitPage());

                },
                child: Container(
                  height: 54.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xff07BDFF),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(
                      'Money earnt so far: \$85.00',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 24.h),

              ///<================= FUND CONTAINERS =========================>///
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomFundContainer(
                    title: 'Wish List',
                    image: Image.asset(ImagePaths.wishListFund,height: 82.h,width: 82.w,fit: BoxFit.contain,),
                    viewOnPressed: () {
                      navigateTo(context, WishListView());
                    },
                    addOnPressed: () {
                      WishlistPopup.show(context);
                    },
                  ),
                  CustomFundContainer(
                    title: 'Reward Fund',
                    image: Image.asset(ImagePaths.rewardFund,height: 82.h,width: 82.w,fit: BoxFit.contain,),
                    viewOnPressed: () {
                      navigateTo(context, RewardFundView());
                    },
                    addOnPressed: () {
                      WishlistPopup.show(context);
                    },
                  ),
                  CustomFundContainer(
                    title: 'Support Fund',
                    image: Image.asset(ImagePaths.dremFund,height: 82.h,width: 82.w,fit: BoxFit.contain,),
                    viewOnPressed: () {
                      navigateTo(context, SupportFund());
                    },
                    addOnPressed: () {
                      WishlistPopup.show(context);
                    },
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              ///<================= RECENT ACTIVITY HEADER =========================>///
              Container(
                height: 34.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: const Color(0xffE2C1F3),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10.r),
                  ),
                ),
                child: Text(
                  'Recent Activity',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              ///<================= ACTIVITY LIST =========================>///
              Container(
                padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 10.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10.r),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 12.h),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: activities.length,
                      itemBuilder: (context, index) {
                        final item = activities[index];

                        return Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 8.w,
                                height: 8.w,
                                margin: EdgeInsets.only(top: 7.h),
                                decoration: BoxDecoration(
                                  color: getRandomColor(),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    SendVoicePopup.show();
                                  },
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
