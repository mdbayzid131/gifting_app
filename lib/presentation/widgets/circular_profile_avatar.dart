import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularProfileAvatar extends StatelessWidget {
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

  const CircularProfileAvatar({
    super.key,
    this.imageUrl,
    this.assetImage,
    this.size = 102,
    this.borderColor = Colors.white,
    this.borderWidth = 2,
    this.showShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    final double avatarSize = size.w;

    return Container(
      width: avatarSize,
      height: avatarSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: borderWidth.w,
        ),
        boxShadow: showShadow
            ? [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 7.r,
            offset: Offset(0, 3.h),
          ),
        ]
            : [],
      ),
      child: ClipOval(
        child: _buildImage(avatarSize),
      ),
    );
  }

  /// IMAGE HANDLER
  Widget _buildImage(double avatarSize) {
    /// ✅ Network image priority
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return Image.network(
        imageUrl!,
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
    if (assetImage != null && assetImage!.isNotEmpty) {
      return Image.asset(
        assetImage!,
        fit: BoxFit.cover,
      );
    }

    /// ✅ Default person icon
    return _fallback(avatarSize);
  }

  /// DEFAULT ICON
  Widget _fallback(double avatarSize) {
    return Container(
      color: Colors.grey.shade200,
      alignment: Alignment.center,
      child: Icon(
        Icons.person,
        size: avatarSize * 0.5,
        color: Colors.grey,
      ),
    );
  }
}
