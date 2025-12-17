import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gifting_app/core/constants/image_paths.dart';
import 'package:gifting_app/presentation/screens/home/user_profile_screen.dart';

import '../../../core/constants/navigator.dart';
import '../../../routes/routes.dart';
import '../../widgets/circular_profile_avatar.dart';
import '../find_profile/other_profile_screen.dart';
import 'notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ///<================= DUMMY PROFILE DATA =========================>///
  final List<Map<String, dynamic>> profiles = [
    {
      "name": "Zoe",
      "image": ImagePaths.avatarProfile4,
      "activities": [
        {"icon": "🎨", "text": "You added art lessons to Dream/Support Fund"},
        {
          "icon": "📜",
          "text":
          "Mum & Dad gave you \$10 for your good grades in your Reward Fund",
        },
        {
          "icon": "🐱",
          "text":
          "Auntie Cherese bought you your Hello Kitty toy from your Wishlist Fund",
        },
      ],
    },
    {
      "name": "Zoe",
      "image": ImagePaths.avatarProfile4,
      "activities": [
        {"icon": "🎨", "text": "You added art lessons to Dream/Support Fund"},
        {
          "icon": "📜",
          "text":
          "Mum & Dad gave you \$10 for your good grades in your Reward Fund",
        },
        {
          "icon": "🐱",
          "text":
          "Auntie Cherese bought you your Hello Kitty toy from your Wishlist Fund",
        },
      ],
    },
    {
      "name": "Zoe",
      "image": "assets/images/zoe.png",
      "activities": [
        {"icon": "🎨", "text": "You added art lessons to Dream/Support Fund"},
        {
          "icon": "📜",
          "text":
          "Mum & Dad gave you \$10 for your good grades in your Reward Fund",
        },
        {
          "icon": "🐱",
          "text":
          "Auntie Cherese bought you your Hello Kitty toy from your Wishlist Fund",
        },
      ],
    },
    {
      "name": "Zavier",
      "image": "assets/images/boy.png",
      "activities": [
        {"icon": "⚽", "text": "You added Soccer lessons to Dream/Support Fund"},
        {
          "icon": "🧹",
          "text":
          "Mum & Dad gave you \$10 for cleaning your room in your Reward Fund",
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ///<================= BACKGROUND DECORATION =========================>///
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(ImagePaths.homeLeft),
                SvgPicture.asset(ImagePaths.homeRight),
              ],
            ),
          ),

          ///<================= MAIN CONTENT =========================>///
          SafeArea(
            child: Column(
              children: [
                ///<================= TOP BAR =========================>///
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      ///<================= PROFILE AVATAR =========================>///
                      InkWell(
                        onTap: () {

                          navigateTo(context, const UserProfileScreen());
                        },
                        child: Container(
                          width: 50.w,
                          height: 50.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Color(0xffFD7839), width: 2),
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

                      const Spacer(),

                      ///<================= GREETING =========================>///
                      Text(
                        "Hello!",
                        style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xffFD7839),
                        ),
                      ),

                      const Spacer(),

                      ///<================= NOTIFICATION ICON =========================>///
                      IconButton(
                        onPressed: () {
                          navigateTo(context, const NotificationScreen());
                        },
                        icon: Container(
                          width: 40.w,
                          height: 40.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xffFD7839),
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.2),
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: SvgPicture.asset(
                              ImagePaths.notificationIcon,
                              height: 40.w,
                              width: 40.w,
                              fit: BoxFit.cover,



                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ///<================= BODY SCROLL AREA =========================>///
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),

                        ///<================= ACTIVITY LIST =========================>///
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: profiles.length,
                          itemBuilder: (context, index) {
                            final profile = profiles[index];

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ///<================= PROFILE HEADER =========================>///
                                GestureDetector(
                                  onTap: () {
                                    navigateTo(context, OtherProfileScreen());
                                  },
                                  child: Row(
                                    children: [
                                      CircularProfileAvatar(
                                        assetImage: ImagePaths.avatarProfile2,
                                        size: 57,
                                      ),
                                      SizedBox(width: 14.w),
                                      Text(
                                        "${profile["name"]}'s Latest Activity",
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xff101828),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 16.h),

                                ///<================= ACTIVITY CARD =========================>///
                                Container(
                                  padding: EdgeInsets.all(20.w),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFBEACB),
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                    const NeverScrollableScrollPhysics(),
                                    itemCount:
                                    profile["activities"].length,
                                    itemBuilder: (context, i) {
                                      final act =
                                      profile["activities"][i];
                                      return Padding(
                                        padding:
                                        EdgeInsets.only(bottom: 18.h),
                                        child: Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              act["icon"],
                                              style:
                                              TextStyle(fontSize: 26.sp),
                                            ),
                                            SizedBox(width: 16.w),
                                            Expanded(
                                              child: Text(
                                                act["text"],
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  height: 1.3,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),

                                SizedBox(height: 20.h),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
