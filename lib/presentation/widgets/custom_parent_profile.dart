import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/constants/image_paths.dart';

class CustomParentProfile extends StatelessWidget {
  final double size;
  final String imagePath;
  final bool isNetworkImage;
  final VoidCallback? onEditTap;
  final Color borderColor;
  final Color editBgColor;
  final bool? isShowPositioned;
  final bool? isShowImagePicker;

  const CustomParentProfile({
    super.key,
    this.size = 90,
    required this.imagePath,
    this.isNetworkImage = false,
    this.onEditTap,
    this.borderColor = Colors.orange,
    this.editBgColor = const Color(0xffF2F2F2), this.isShowPositioned = true, this.isShowImagePicker= false,
  });

  @override
  Widget build(BuildContext context) {
    final avatarSize = size.w;

    return Container(
      height: avatarSize,
      width: avatarSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: 1.5),
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
              radius: (avatarSize / 2),
              backgroundColor: Colors.grey.shade200,
              backgroundImage: imagePath.isEmpty
                  ? AssetImage(ImagePaths.settingPp)
                  : isNetworkImage
                  ? NetworkImage(imagePath)
                  : AssetImage(imagePath) as ImageProvider,
            ),
          ),

          /// EDIT ICON
          if(isShowPositioned == true)
          Positioned(
            bottom: -2,
            right: -2,
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: onEditTap,
              child: Container(
                height: 30.w,
                width: 30.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: editBgColor,
                  border: Border.all(color: borderColor, width: 1.2),
                ),
                child: Center(
                  child: isShowImagePicker == false ? SvgPicture.asset(
                    ImagePaths.editImage,
                    height: 17.w,
                    width: 17.w,
                  ): Icon(
                    Icons.camera_alt_outlined,
                    size: 17.sp,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
