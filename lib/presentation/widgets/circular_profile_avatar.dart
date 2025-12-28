import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/constants/image_paths.dart';

class CircularProfileAvatar extends StatefulWidget {
  /// Network image URL
  final String? imageUrl;

  /// Asset image path (fallback)
  final String? assetImage;

  /// Base size (responsive via ScreenUtil)
  final double size;

  /// Border color
  final Color borderColor;

  /// Border width
  final double borderWidth;

  /// Shadow enable / disable
  final bool showShadow;
  final bool? showFollowButton;

  const CircularProfileAvatar({
    super.key,
    this.imageUrl,
    this.assetImage,
    this.size = 102,
    this.borderColor = Colors.white,
    this.borderWidth = 2,
    this.showShadow = true,
    this.showFollowButton = false,
  });

  @override
  State<CircularProfileAvatar> createState() => _CircularProfileAvatarState();
}

class _CircularProfileAvatarState extends State<CircularProfileAvatar> {
  RxBool isFollow = true.obs;
  @override
  Widget build(BuildContext context) {
    final double avatarSize = widget.size.w;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: avatarSize,
          height: avatarSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: widget.borderColor,
              width: widget.borderWidth.w,
            ),
            boxShadow: widget.showShadow
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 7.r,
                      offset: Offset(0, 3.h),
                    ),
                  ]
                : [],
          ),

          child: ClipOval(child: _buildImage(avatarSize)),
        ),
        if (widget.showFollowButton == true)
          Obx(
            () => Positioned(
              bottom: 5.w,
              right: -15.w,
              child: GestureDetector(
                onTap: () {
                  isFollow.value = !isFollow.value;
                },
                child: Container(
                  width: 77.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                    color: const Color(0xffCFF1F6),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(
                      isFollow.value ? "Following" : "  Follow  ",
                      style: TextStyle(
                        color: const Color(0xff4A6B83),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  /// IMAGE HANDLER
  Widget _buildImage(double avatarSize) {
    /// ✅ Network image priority
    if (widget.imageUrl != null && widget.imageUrl!.isNotEmpty) {
      return Image.network(
        widget.imageUrl!,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _fallback(avatarSize),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: SizedBox(
              width: 20.w,
              height: 20.w,
              child: CircularProgressIndicator(strokeWidth: 2.w),
            ),
          );
        },
      );
    }

    /// ✅ Asset image fallback
    if (widget.assetImage != null && widget.assetImage!.isNotEmpty) {
      return Image.asset(widget.assetImage!, fit: BoxFit.cover);
    }

    /// ✅ Default person icon
    return _fallback(avatarSize);
  }

  /// DEFAULT ICON
  Widget _fallback(double avatarSize) {
    return Container(
      color: Colors.grey.shade200,
      alignment: Alignment.center,
      child: Icon(Icons.person, size: avatarSize * 0.5, color: Colors.grey),
    );
  }
}
