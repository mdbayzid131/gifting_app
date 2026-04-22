import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/utils/app_dialog.dart';
import '../controllers/creat_profile_controller.dart';
import '../controllers/homepgeController.dart';
import 'avatar_profile_popup.dart';
import 'creat_child_avatar_profile_popup.dart';

class ChildCreateUplodePicturePopup extends StatelessWidget {
  ChildCreateUplodePicturePopup({super.key, });

  ///<================= CONTROLLER =========================>///

  final HomePageController _homePageController = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ///<================= BLUR BACKGROUND =========================>///
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color: Colors.black.withOpacity(0.4),
          ),
        ),

        ///<================= POPUP CARD =========================>///
        Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              width: 320.w,
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: const Color(0xffFFFAF8),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ///<================= HEADER =========================>///
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Upload Picture',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      InkWell(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.close,
                          size: 20.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16.h),

                  ///<================= GALLERY BUTTON =========================>///
                  buildActionButton(
                    label: 'Upload from Gallery',
                    onPressed: _homePageController.childCreatePickImageFromGallery,
                  ),

                  SizedBox(height: 12.h),

                  ///<================= AVATAR BUTTON =========================>///
                  buildActionButton(
                    label: 'Choose Avatar',
                    onPressed: (){
                      Get.back();
                      AppDialog.show(context: context, child: CreatChildAvatarProfilePopup(),animation: DialogAnimation.fade);

                    },

                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  ///<================= COMMON BUTTON =========================>///
  Widget buildActionButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffEDE8FC),
          foregroundColor: Colors.black,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
