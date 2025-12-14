import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/creat_profile_controller.dart';

class AvatarProfilePopup extends StatelessWidget {
  AvatarProfilePopup({super.key});

  ///<================= CONTROLLER =========================>///
  final CreateProfileController controller =
  Get.find<CreateProfileController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ///<================= BLUR BACKGROUND =========================>///
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color: Colors.black.withOpacity(0.45),
          ),
        ),

        ///<================= POPUP CARD =========================>///
        Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              width: 340.w,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: const Color(0xffFFFAF8),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ///<================= HEADER =========================>///
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Choose Avatar',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(20.r),
                        onTap: () => Get.back(),
                        child: Padding(
                          padding: EdgeInsets.all(4.w),
                          child: Icon(
                            Icons.close,
                            size: 20.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16.h),

                  ///<================= AVATAR GRID =========================>///
                  SizedBox(
                    height: 220.h,
                    child: GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 12.h,
                        crossAxisSpacing: 12.w,
                        childAspectRatio: 1,
                      ),
                      itemCount: controller.avatarList.length,
                      itemBuilder: (context, index) {
                        final avatar = controller.avatarList[index];

                        return InkWell(
                          borderRadius: BorderRadius.circular(50.r),
                          onTap: () {
                            controller.selectedAvatar.value = avatar;
                            Get.back();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xffFD7839),
                                width: 1.2,
                              ),
                            ),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(avatar),
                              backgroundColor: Colors.grey.shade200,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
