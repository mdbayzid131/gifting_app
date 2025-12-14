import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/constants/image_paths.dart';
import '../../data/models/NotificationItemModel.dart';
import 'CustomAddUserPopup.dart';
import 'CustomRejectUserPopUp.dart';
import '../widgets/voice_play_popup.dart';

class NotificationCard extends StatelessWidget {
  final NotificationItem item;

  const NotificationCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // get style for the notification category
    final style = categoryStyles[item.category] ??
        NotificationStyle(
          backgroundColor: Colors.grey.shade200,
          icon: Icons.notifications,
        );

    return Container(
      width: double.infinity, // make full width responsive
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6.r,
            offset: Offset(0, 3.h),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //=================== Avatar + Category Icon ===================//
          Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffA0C4FF), width: 1.2.w), // soft blue border
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Avatar Image
                Center(
                  child: CircleAvatar(
                    radius: 25.r,
                    backgroundImage: AssetImage(item.imagePath),
                  ),
                ),
                // Category Icon
                Positioned(
                  bottom: -2.h,
                  right: -2.w,
                  child: Container(
                    height: 20.h,
                    width: 20.w,
                    decoration: BoxDecoration(
                      color: item.category == 'voice_note'
                          ? Color(0xfffbbf2c) // soft yellow
                          : item.category == 'contribute_alert'
                          ? Color(0xff06D6A0) // soft green
                          : item.category == 'follow_request'
                          ? Color(0xffEF476F) // soft red/pink
                          : Color(0xffFFD166), // default soft yellow
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Icon(
                    style.icon,
                      size: 12.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 12.w),

          //=================== Message + Actions ===================//
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Message Text
                GestureDetector(
                  onTap: item.category == 'voice_note'
                      ? () {
                    showDialog(
                      context: context,
                      builder: (context) => PlayVoicePopup(
                        path: item.voicePath!,
                        name: item.name,
                      ),
                    );
                  }
                      : null,
                  child: Text(
                    item.message,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff333333),
                      height: 1.4,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 8.h),

                // Follow request buttons
                if (item.category == 'follow_request') ...[
                  Row(
                    children: [
                      // Accept Button → Soft Blue (friendly feel)
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => AddUserPopup(name: item.name),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF4A90E2), // soft blue
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                            side: BorderSide(color: Colors.white, width: 1.w), // only rounded
                          ),
                          minimumSize: Size(65.w, 32.h),
                        ),
                        child: Text(
                          "Accept",
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(width: 6.w),

                      // Reject Button → Soft Red
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => CustomRejectUserPopup(name: item.name),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE94E4E), // soft red
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                            side: BorderSide(color: Colors.white, width: 1.w), // only rounded
                          ),
                          minimumSize: Size(65.w, 32.h),
                        ),
                        child: Text(
                          "Reject",
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Spacer(),

                      // Timestamp
                      Text(
                        item.timestamp,
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),


                ] else ...[
                  // Timestamp for other categories
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      item.timestamp,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.grey.shade600,
                      ),
                    ),
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

///=================== Notification Styles ===================//
class NotificationStyle {
  final Color backgroundColor;
  final IconData icon;

  NotificationStyle({required this.backgroundColor, required this.icon});
}

Map<String, NotificationStyle> categoryStyles = {
  // Voice note → soft yellow, attention grabbing but easy on eyes
  'voice_note': NotificationStyle(
    backgroundColor: Color(0xFFFFF4C2), // soft yellow
    icon: Icons.mic,
  ),

  // Contribute alert → soft blue, calm and noticeable
  'contribute_alert': NotificationStyle(
    backgroundColor: Color(0xFFD6EAF8), // soft sky blue
    icon: Icons.notifications,
  ),

  // Follow request → soft green, friendly and positive
  'follow_request': NotificationStyle(
    backgroundColor: Color(0xFFDFF2E1), // soft mint green
    icon: Icons.person_add_alt_1,
  ),
};
