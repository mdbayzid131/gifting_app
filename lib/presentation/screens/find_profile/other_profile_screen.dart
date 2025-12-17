import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../core/constants/image_paths.dart';
import '../../../core/constants/navigator.dart';
import '../../../core/utils/app_dialog.dart';
import '../../../routes/routes.dart';
import '../../widgets/VoiceRecordDialog.dart';
import '../../widgets/circular_profile_avatar.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_fund_container.dart';
import 'other_dream_and_support_fund.dart';
import 'other_reward_fund.dart';
import 'other_wish_list_view.dart';

class OtherProfileScreen extends StatefulWidget {
  const OtherProfileScreen({super.key});

  @override
  State<OtherProfileScreen> createState() => _OtherProfileScreenState();
}

class _OtherProfileScreenState extends State<OtherProfileScreen> {
  final List activities = [
    'Auntie Cherise bought you your Hello Kitty toy! Say thanks with a video or voice note!',
    'Mum & Dad gave you \$10 for your good grades! Say thanks with a video or voice note!',
    'Friend gifted you a new football!',
  ];

  final List<Color> _activityColors = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.blue,
  ];

  Color getRandomColor() {
    final Random random = Random();
    // Pick a random color from the list
    return _activityColors[random.nextInt(_activityColors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidgets.customAppBar(title: "Profile"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: CircularProfileAvatar(
                assetImage: ImagePaths.avatarProfile2,
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Text(
                "Jone Doe",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffFD7839),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomFundContainer(
                  title: 'Wish List',
                  image: Image.asset(ImagePaths.wishListFund,height: 82.h,width: 82.w,fit: BoxFit.contain,),
                  viewOnPressed: () {
                    navigateTo(context, OtherWishListView());
                  },
                  isMyProfile: false,
                ),
                CustomFundContainer(
                  title: 'Reward Fund',
                  image: Image.asset(ImagePaths.rewardFund,height: 82.h,width: 82.w,fit: BoxFit.contain,),
                  viewOnPressed: () {
                    navigateTo(context, OtherRewardFund());
                  },
                  isMyProfile: false,
                ),
                CustomFundContainer(
                  title: 'Support Fund',
                  image: Image.asset(ImagePaths.dremFund,height: 82.h,width: 82.w,fit: BoxFit.contain,),
                  viewOnPressed: () {
                    navigateTo(context, OtherDreamAndSupportFund());
                  },
                  isMyProfile: false,
                ),
              ],
            ),
            const SizedBox(height: 24),
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

                        return Row(
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
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
