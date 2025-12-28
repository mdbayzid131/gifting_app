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
import '../../../core/utils/app_dialog.dart';
import '../../../routes/routes.dart';
import '../../widgets/VoiceRecordDialog.dart';
import '../../widgets/circular_profile_avatar.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_fund_container.dart';
import 'add_item_popUp.dart';
import 'followers_list_page.dart';

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
                child: CircularProfileAvatar(
                  assetImage: ImagePaths.avatarProfile2,
                ),
              ),

              SizedBox(height: 24.h),

              ///<================= GREETING TEXT =========================>///
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Hello!",
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffFD7839),
                    ),
                  ),
                  SizedBox(width: 42.w),
                  GestureDetector(
                    onTap: (){
                      navigateTo(context, FollowersPage());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffCFF1F6),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        'Followers',
                        style: TextStyle(
                          color: const Color(0xff4E6E85),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),


                ],
              ),

              SizedBox(height: 24.h),

              ///<================= TOTAL EARNED CARD =========================>///
              GestureDetector(
                onTap: () {
                  navigateTo(context, TotalSubmitPage());
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
                    image: Image.asset(
                      ImagePaths.wishListFund,
                      height: 82.h,
                      width: 82.w,
                      fit: BoxFit.contain,
                    ),
                    viewOnPressed: () {
                      navigateTo(context, WishListView());
                    },
                    addOnPressed: () {
                      AppDialog.show(
                        context: context,
                        child: const PopupBody(),
                        animation: DialogAnimation.fade,
                      );
                    },
                  ),
                  CustomFundContainer(
                    title: 'Reward Fund',
                    image: Image.asset(
                      ImagePaths.rewardFund,
                      height: 82.h,
                      width: 82.w,
                      fit: BoxFit.contain,
                    ),
                    viewOnPressed: () {
                      navigateTo(context, RewardFundView());
                    },
                    addOnPressed: () {
                      AppDialog.show(
                        context: context,
                        child: const PopupBody(),
                        animation: DialogAnimation.fade,
                      );
                    },
                  ),
                  CustomFundContainer(
                    title: 'Support Fund',
                    image: Image.asset(
                      ImagePaths.dremFund,
                      height: 82.h,
                      width: 82.w,
                      fit: BoxFit.contain,
                    ),
                    viewOnPressed: () {
                      navigateTo(context, SupportFund());
                    },
                    addOnPressed: () {
                      AppDialog.show(
                        context: context,
                        child: const PopupBody(),
                        animation: DialogAnimation.fade,
                      );
                    },
                  ),
                ],
              ),

              SizedBox(height: 24.h),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ///<================= RECENT ACTIVITY HEADER =========================>///
                    Container(
                      height: 44.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: const Color(0xffE2C1F3),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(12.r),
                        ),
                      ),
                      child: Text(
                        'Recent Activity',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    ///<================= ACTIVITY LIST =========================>///
                    Padding(
                      padding: EdgeInsets.fromLTRB(14.w, 12.h, 14.w, 14.h),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: activities.length,
                        separatorBuilder: (_, __) => SizedBox(height: 14.h),
                        itemBuilder: (context, index) {
                          final item = activities[index];

                          return GestureDetector(
                            onTap: () {
                              AppDialog.show(
                                context: context,
                                child: const SendVoicePopup(),
                                animation: DialogAnimation.fade,
                              );
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ///<================= DOT =========================>///
                                Container(
                                  margin: EdgeInsets.only(top: 6.h),
                                  width: 10.w,
                                  height: 10.w,
                                  decoration: BoxDecoration(
                                    color: getRandomColor(),
                                    shape: BoxShape.circle,
                                  ),
                                ),

                                SizedBox(width: 10.w),

                                ///<================= TEXT =========================>///
                                Expanded(
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                      height: 1.45,
                                      color: const Color(0xff333333),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
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
