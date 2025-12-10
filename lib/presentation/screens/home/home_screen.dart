import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:gifting_app/core/constants/image_paths.dart';

import '../../../routes/routes.dart';
import '../../widgets/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: Text(
          "Hello!",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: Color(0xffFD7839),
          ),
        ),
        actions: [
          IconButton(onPressed: (){
            Get.toNamed(RoutePages.notificationScreen);
          }, icon: Icon(Icons.notifications_outlined)),
          SizedBox(width: 10),
        ],
        leadingWidth: 70,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: CircleAvatar(
            // backgroundImage: NetworkImage('...'), // Or AssetImage for local images
             backgroundImage: AssetImage(ImagePaths.profileIcon), // Or AssetImage for local images
            // child: Icon(Icons.person),
          ),
        ),
      ),

    );
  }
}
