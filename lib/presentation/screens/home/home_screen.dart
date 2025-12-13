import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:gifting_app/core/constants/image_paths.dart';

import '../../../routes/routes.dart';
import '../../widgets/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> profiles = [
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
          // -------------------------
          // BACKGROUND DECORATION
          // -------------------------
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

          // -------------------------
          // MAIN BODY
          // -------------------------
          SafeArea(

            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed(RoutePages.userProfileScreen);
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors
                                  .white, //
                              width: 2, // border thickness
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(
                                  0,
                                  3,
                                ), // changes position of shadow
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              ImagePaths.avatarProfile1,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Hello!",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffFD7839),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          Get.toNamed(RoutePages.notificationScreen);
                        },
                        icon: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xffFD7839),
                              width: 2, // border thickness
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(
                                  0,
                                  3,
                                ), // changes position of shadow
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: SvgPicture.asset(
                              ImagePaths.notificationIcon,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        //
                        // Row(
                        //   children: [
                        //     InkWell(
                        //       onTap: () {
                        //         Get.toNamed(RoutePages.userProfileScreen);
                        //       },
                        //       child: Container(
                        //         width: 50,
                        //         height: 50,
                        //         decoration: BoxDecoration(
                        //           shape: BoxShape.circle,
                        //           border: Border.all(
                        //             color: Colors
                        //                 .white, //
                        //             width: 2, // border thickness
                        //           ),
                        //           boxShadow: [
                        //             BoxShadow(
                        //               color: Colors.black.withValues(alpha: 0.2),
                        //               spreadRadius: 5,
                        //               blurRadius: 7,
                        //               offset: Offset(
                        //                 0,
                        //                 3,
                        //               ), // changes position of shadow
                        //             ),
                        //           ],
                        //         ),
                        //         child: ClipOval(
                        //           child: Image.asset(
                        //             ImagePaths.avatarProfile1,
                        //             fit: BoxFit.cover,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     Spacer(),
                        //     Text(
                        //       "Hello!",
                        //       style: TextStyle(
                        //         fontSize: 32,
                        //         fontWeight: FontWeight.w700,
                        //         color: Color(0xffFD7839),
                        //       ),
                        //     ),
                        //     Spacer(),
                        //     IconButton(
                        //       onPressed: () {
                        //         Get.toNamed(RoutePages.notificationScreen);
                        //       },
                        //       icon: Container(
                        //         width: 40,
                        //         height: 40,
                        //         decoration: BoxDecoration(
                        //           shape: BoxShape.circle,
                        //           border: Border.all(
                        //             color: Color(0xffFD7839),
                        //             width: 2, // border thickness
                        //           ),
                        //           boxShadow: [
                        //             BoxShadow(
                        //               color: Colors.black.withValues(alpha: 0.2),
                        //               spreadRadius: 5,
                        //               blurRadius: 7,
                        //               offset: Offset(
                        //                 0,
                        //                 3,
                        //               ), // changes position of shadow
                        //             ),
                        //           ],
                        //         ),
                        //         child: ClipOval(
                        //           child: SvgPicture.asset(
                        //             ImagePaths.notificationIcon,
                        //             fit: BoxFit.cover,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        //
                        // const SizedBox(height: 50),

                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: profiles.length,
                          itemBuilder: (context, index) {
                            final profile = profiles[index];

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // 🔵 Profile Header (image + name)
                                Row(
                                  children: [
                                    Container(
                                      width: 57.w, // avatar size
                                      height: 57.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white, // outline color
                                          width: 3, // outline thickness
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withValues(
                                              alpha: 0.2,
                                            ),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(
                                              0,
                                              3,
                                            ), // changes position of shadow
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
                                    const SizedBox(width: 14),
                                    Text(
                                      "${profile["name"]}'s Latest Activity",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff101828),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 16),

                                // 🟠 Activity Card
                                Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFBEACB),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: profile["activities"].length,
                                    itemBuilder: (context, i) {
                                      final act = profile["activities"][i];
                                      return Padding(
                                        padding: const EdgeInsets.only(bottom: 18),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              act["icon"],
                                              style: const TextStyle(fontSize: 26),
                                            ),
                                            const SizedBox(width: 16),
                                            Expanded(
                                              child: Text(
                                                act["text"],
                                                style: const TextStyle(
                                                  fontSize: 16,
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
                                const SizedBox(height: 20),
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
