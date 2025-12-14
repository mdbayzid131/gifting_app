import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/homepgeController.dart';
import '../../widgets/NotificationCardWidget.dart';
import '../../widgets/custom_appbar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final HomePageController _controller = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidgets.customAppBar(title: "Notification"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: _controller.notifications.length,
          itemBuilder: (context, index) {
            ///=================== Notification Item ===================///
            return Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: NotificationCard(item: _controller.notifications[index]),
            );
          },
        ),
      ),
    );
  }
}
