import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gifting_app/data/models/user_profile_model.dart';

import '../../../core/constants/image_paths.dart';
import '../../../data/models/children_data_model.dart';
import '../../../routes/routes.dart';
import '../../controllers/homepgeController.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_child_profile.dart';
import '../../widgets/custom_parent_profile.dart';
import '../../widgets/uplode_picture_popup.dart';
import 'edit_child_profile.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  ///<================= PROFILE LIST =========================>///
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

  final HomePageController homePageController = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xffFD7839);

    return Scaffold(
      appBar: CustomWidgets.customAppBar(title: 'Create Profile'),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Obx(() {
            final UserProfileModel? prentData =
                homePageController.profile.value;
            final List<ChildData> childData = homePageController.childData;
            if (prentData == null) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              children: [
                SizedBox(height: 20.h),

                ///<================= MAIN PROFILE AVATAR =========================>///
                CustomParentProfile(
                  imagePath: prentData.profilePicture,
                  onEditTap: () {
                    Get.toNamed(RoutePages.editParentProfile);
                  },
                  isNetworkImage: true,
                ),

                SizedBox(height: 10.h),

                ///<================= USER NAME =========================>///
                Text(
                  prentData.name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff444444),
                  ),
                ),

                SizedBox(height: 30.h),

                ///<================= PROFILE GRID =========================>///
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10.h,
                      crossAxisSpacing: 10.w,
                      childAspectRatio: 0.85,
                    ),
                    itemCount: childData.length + 1,
                    itemBuilder: (context, index) {
                      if (index == childData.length) {
                        return addProfileButton();
                      } else {
                        final ChildData child = childData[index];
                        return profileItem(
                          name: child.name,
                          image: child.profileImage ?? '',
                          userId: child.id,
                        );
                      }
                    },
                  ),
                ),

                SizedBox(height: 10.h),

                ///<================= NOTICE BOX =========================>///
                Container(
                  padding: EdgeInsets.all(12.w),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xfffd8e56),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    'Notice : You can create one child profile for free. For any additional profiles you’ll need to make a payment.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),

                SizedBox(height: 16.h),
              ],
            );
          }),
        ),
      ),
    );
  }

  ///<================= ADD PROFILE BUTTON =========================>///
  Widget addProfileButton() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RoutePages.createChildProfile);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60.w,
            width: 60.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xffFD7839), width: 2),
            ),
            child: const Icon(Icons.add, color: Color(0xffFD7839), size: 30),
          ),
          SizedBox(height: 8.h),
          Text(
            'Create Profile',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xff444444),
            ),
          ),
        ],
      ),
    );
  }

  ///<================= PROFILE ITEM =========================>///
  Widget profileItem({
    required String name,
    required String image,
    required String userId,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// ================= PROFILE AVATAR =================
        CustomChildProfile(
          isNetworkImage: true,
          imagePath: image,
          onEditTap: () {
            Get.to(() => EditChildProfile(childId: userId, name:name, image:image,));
          },
        ),

        SizedBox(height: 8.h),

        /// ================= PROFILE NAME =================
        Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xff444444),
          ),
        ),
      ],
    );
  }
}
