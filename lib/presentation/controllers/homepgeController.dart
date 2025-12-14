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
      imagePath : ImagePaths.avatarProfile2, name: 'Sabbir',
      voicePath: '/data/user/0/com.example.gifting_app/app_flutter/voice_1765588225384.m4a',

    ),
    NotificationItem(
      id: '2',
      message: 'Grandma Debbie Contribute 10\$. Tap here to See..',
      category: 'contribute_alert',
      timestamp: '2h Ago',
      imagePath : ImagePaths.avatarProfile3, name: 'Sojib',
    ),
    NotificationItem(
      id: '3',
      message: 'Khaled ahmed nayeem wants to follow you!',
      category: 'follow_request',
      timestamp: '2h Ago',
      imagePath : ImagePaths.avatarProfile4, name: 'khaled',
    ),
  ];

}