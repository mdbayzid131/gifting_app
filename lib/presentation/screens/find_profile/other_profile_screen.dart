import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../core/constants/image_paths.dart';
import '../../../routes/routes.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_fund_container.dart';

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
              child: Container(
                width: 102.w, // avatar size
                height: 102.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white, // outline color
                    width: 3, // outline thickness
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
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
            const SizedBox(height: 24),
            Center(
              child: Text(
                "Hello!",
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
                  image: Image.asset(ImagePaths.wishListFund),
                  viewOnPressed: () {
                    Get.toNamed(RoutePages.otherWishListView);
                  },
                  isMyProfile: false,
                ),
                CustomFundContainer(
                  title: 'Reward Fund',
                  image: Image.asset(ImagePaths.rewardFund),
                  viewOnPressed: () {
                    Get.toNamed(RoutePages.otherRewardFund);
                  },
                  isMyProfile: false,
                ),
                CustomFundContainer(
                  title: 'Dream & Support Fund',
                  image: Image.asset(ImagePaths.dremFund),
                  viewOnPressed: () {
                    Get.toNamed(RoutePages.otherDreamAndSupportFund);
                  },
                  isMyProfile: false,
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),

              height: 34,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffE2C1F3),
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              ),

              child: const Text(
                'Recent Activity',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: activities.length,
                    itemBuilder: (context, index) {
                      final item = activities[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Container(
                                width: 8,
                                height: 8,
                                margin: const EdgeInsets.only(top: 7),
                                decoration: BoxDecoration(
                                  color: getRandomColor(),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
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
          ],
        ),
      ),
    );
  }
}
