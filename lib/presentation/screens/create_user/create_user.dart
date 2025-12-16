import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constants/image_paths.dart';
import '../../../routes/routes.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/uplode_picture_popup.dart';

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

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xffFD7839);
    return Scaffold(
      appBar: CustomWidgets.customAppBar(title: 'Create Profile'),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),

              ///<================= MAIN PROFILE AVATAR =========================>///
              Container(
                height: 90.h,
                width: 90.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: primaryColor, width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    /// PROFILE IMAGE
                    Center(
                      child: CircleAvatar(
                        radius: 50.r,
                        backgroundColor: Colors.grey.shade200,
                        backgroundImage: AssetImage(ImagePaths.settingPp),
                      ),
                    ),

                    /// EDIT ICON
                    Positioned(
                      bottom: -2,
                      right: -2,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          Get.toNamed(RoutePages.editParentProfile);
                        },
                        child: Container(
                          height: 30.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xffF2F2F2),
                            border: Border.all(color: primaryColor, width: 1.2),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              ImagePaths.editImage,
                              height: 17.h,
                              width: 17.w,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10.h),

              ///<================= USER NAME =========================>///
              Text(
                'john doe',
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
                  itemCount: profiles.length + 1,
                  itemBuilder: (context, index) {
                    if (index == profiles.length) {
                      return addProfileButton();
                    }
                    final p = profiles[index];
                    return profileItem(p["name"], p["image"]);
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
          ),
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
  Widget profileItem(String name, String image) {
    const Color primaryColor = Color(0xffFD7839);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// ================= PROFILE AVATAR =================
        Container(
          height: 60.w,
          width: 60.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: primaryColor, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              /// PROFILE IMAGE
              Center(
                child: CircleAvatar(
                  radius: 30.r,
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage: AssetImage(
                    image.isEmpty ? image : ImagePaths.avatarProfile3,
                  ),
                ),
              ),

              /// EDIT ICON
              Positioned(
                bottom: -2,
                right: -2,
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    Get.toNamed(RoutePages.editChildProfile);
                  },
                  child: Container(
                    height: 22.w,
                    width: 22.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xffF2F2F2),
                      border: Border.all(color: primaryColor, width: 1.2),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        ImagePaths.editImage,
                        height: 13.h,
                        width: 13.w,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
