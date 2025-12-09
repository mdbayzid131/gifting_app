import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants/image_paths.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color:Color(0xffFFFAF8),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          navItem(
            index: 0,
            icon: ImagePaths.homeIcon,
            label: "Home",
            color: Color(0xff0D8BD6),
          ),
          navItem(
            index: 1,
            icon: ImagePaths.findProfileIcon,
            label: "Find Profile",
            color: Color(0xffFF89CA),
          ),
          navItem(
            index: 2,
            icon: ImagePaths.createUserIcon,
            label: "Create Profile",
            color: Color(0xff19B23F),
          ),
          navItem(
            index: 3,
            icon: ImagePaths.settingIcon,
            label: "Setting",
            color: Color(0xffFD7839),
          ),
        ],
      ),
    );
  }

  Widget navItem({
    required int index,
    required String icon,
    required String label,
    required Color color,
  }) {
    bool isSelected = currentIndex == index;

    return InkWell(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(icon,),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 3),

          // underline if selected
          if (isSelected)
            Container(height: 2, width: 60, color: color)
          else
            Container(height: 2,width: 60, color: Colors.transparent),
        ],
      ),
    );
  }
}
