import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gifting_app/presentation/widgets/voice_play_popup.dart';

import '../../core/constants/image_paths.dart';
import '../../data/models/NotificationItemModel.dart';
import 'CustomAddUserPopup.dart';
import 'CustomRejectUserPopUp.dart';

class NotificationCard extends StatelessWidget {
  final NotificationItem item;

  const NotificationCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final style =
        categoryStyles[item.category] ??
        NotificationStyle(
          backgroundColor: Colors.grey.shade200,
          icon: Icons.notifications,
        );

    return Container(
      width: 335,
      height: item.category == 'follow_request' ? 115.h : 100.h,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 45.h,
            width: 45.w,
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
                    backgroundImage: AssetImage(item.imagePath),
                  ),
                ),
                Positioned(
                  bottom: -1,
                  right: 0,
                  child: InkWell(
                    onTap: () {},

                    ///=======================
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xffFD7839),
                          width: 1.5,
                        ),
                        color: const Color(0xffFD7839),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        item.category == 'voice_note'
                            ? Icons.mic_outlined
                            : item.category == 'approval_request'
                            ? Icons.notifications_outlined
                            : item.category == 'follow_request'
                            ? Icons.person_add_alt
                            : Icons.help_outline,
                        size: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              children: [
                Center(
                  child: item.category == 'voice_note'? GestureDetector(
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (context) => PlayVoicePopup(path:item.voicePath!, name: item.name,),
                      );

                    },
                    child: Text(
                      item.message,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff333333),
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ): Text(
                    item.message,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff333333),
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 4),

                if (item.category == 'follow_request') ...[
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => AddUserPopup(name:item.name),
                          );

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffFFFFFF),
                          foregroundColor: Color(0xffFD7839),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(
                              color: Color(0xffFFAA82),
                              width: 1,
                            ),
                          ),
                          minimumSize: Size(61, 30),
                        ),
                        child: const Text(
                          "Accept",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      OutlinedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => CustomRejectUserPopup(name: item.name),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffCC4343),
                          foregroundColor: Color(0xffFFFFFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(
                              color: Color(0xffFFFFFF),
                              width: 1,
                            ),
                          ),
                          minimumSize: Size(61, 30),
                        ),
                        child: const Text(
                          "Reject",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        item.timestamp,
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ] else ...[
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        item.timestamp,
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationStyle {
  final Color backgroundColor;
  final IconData icon;

  NotificationStyle({required this.backgroundColor, required this.icon});
}

Map<String, NotificationStyle> categoryStyles = {
  'voice_note': NotificationStyle(
    backgroundColor: Color(0xffFFEC54),
    icon: Icons.mic,
  ),
  'approval_request': NotificationStyle(
    backgroundColor: Color(0xffFFFAF8),
    icon: Icons.person_add,
  ),
  'follow_request': NotificationStyle(
    backgroundColor: Color(0xffFD7839),
    icon: Icons.check_circle_outline,
  ),
};
