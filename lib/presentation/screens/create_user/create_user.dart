import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:gifting_app/presentation/widgets/custom_appbar.dart';

import '../../../core/constants/image_paths.dart';
import '../../../routes/routes.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  List profiles = [
    {"name": "Zoe", "image": "assets/zoe.png"},
  ];

  void addProfile() {
    setState(() {
      profiles.add({
        "name": "New User ${profiles.length}",
        "image": "assets/default.png",
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidgets.customAppBar(title: 'Create Profile'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffFD7839), width: 1.5),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(ImagePaths.settingPp),
                      ),
                    ),
                    Positioned(
                      bottom: -1,
                      right: 0,
                      child: InkWell(
                        onTap: () {},

                        ///=======================
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xffFD7839),
                              width: 1.5,
                            ),
                            color: const Color(0xffEBE9E9),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: SvgPicture.asset(
                            ImagePaths.editImage,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'john doe',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff444444),
                ),
              ),
            ),
            SizedBox(height: 38),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  childAspectRatio: 0.85,
                ),
                itemCount: profiles.length + 1, // last item = add button
                itemBuilder: (context, index) {
                  // If last index → Add Profile Button
                  if (index == profiles.length) {
                    return addProfileButton();
                  }
                  // Otherwise Profile Item
                  final p = profiles[index];
                  return profileItem(p["name"], p["image"]);
                },
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 77,
                    width: 332,
                    decoration: BoxDecoration(
                      color: Color(0xffFD7839),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Notice : You can create one child profile for free. For any additional profiles you’ll need to make a payment.',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
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

  /// 🔵 Create Profile Button
  Widget addProfileButton() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RoutePages.createChildProfile);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Color(0xffFD7839), width: 2),
            ),
            child: Center(
              child: Icon(Icons.add, color: Color(0xffFD7839), size: 30),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Create Profile',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff444444),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔴 Profile Item Widget
  Widget profileItem(String name, String image) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffFD7839), width: 1.5),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(ImagePaths.settingPp),
                  ),
                ),
                Positioned(
                  bottom: -1,
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(RoutePages.editChildProfile);
                    },

                    ///=======================
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xffFD7839),
                          width: 1.5,
                        ),
                        color: const Color(0xffEBE9E9),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: SvgPicture.asset(
                        ImagePaths.editImage,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Center(
          child: Text(
            'john doe',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xff444444),
            ),
          ),
        ),
      ],
    );
  }
}
