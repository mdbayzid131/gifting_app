import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constants/image_paths.dart';
import '../../data/models/NotificationItemModel.dart';

class HomePageController extends GetxController{


  List<NotificationItem> notifications = [
    NotificationItem(
      id: '1',
      message: 'Hey Your Grandson Zoe Send You A Voice Note, Please Click To Hear The Voice Note!',
      category: 'voice_note',
      timestamp: '2h Ago',
      imagePath : ImagePaths.settingPp, name: 'Sabbir',
      voicePath: 'assets/audio/voice.m4a',

    ),
    NotificationItem(
      id: '2',
      message: 'Grandma Debbie Wants To Follow Zavier’s Profile. Tap Here To Approve Or Deny.Khaled Ahmed Nayeem Wants To Follow You!Khaled Ahmed Nayeem Wants To Follow You!',
      category: 'approval_request',
      timestamp: '2h Ago',
      imagePath : ImagePaths.settingPp, name: 'Sojib',
    ),
    NotificationItem(
      id: '3',
      message: 'Khaled Ahmed Nayeem Wants To Follow You!Khaled Ahmed Nayeem Wants To Follow You!  Khaled Ahmed Nayeem Wants To Follow You!',
      category: 'follow_request',
      timestamp: '2h Ago',
      imagePath : ImagePaths.settingPp, name: 'khaled',
    ),
  ];

}