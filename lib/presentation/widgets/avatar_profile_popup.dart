import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../controllers/creat_profile_controller.dart';

class AvatarProfilePopup extends StatelessWidget {
   AvatarProfilePopup({super.key});
  final CreateProfileController controller = Get.find<CreateProfileController>();
  @override
  Widget build(BuildContext context) {
     return Stack(
      children: [
        /// 🔥 Blur Background
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(color: Colors.black.withOpacity(0.4)),
        ),

        /// 🔥 Popup Card
        Center(
          child: Container(
            width: 320,
            height: 200,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xffFFFAF8),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Choose Avatar',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black, decoration: TextDecoration.none)),
                    GestureDetector(onTap: (){Navigator.pop(context);}, child: const Icon(Icons.close, size: 20, color: Colors.red)),
                  ],),


                const SizedBox(height: 10),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                      childAspectRatio: 0.85,
                    ),
                    itemCount:controller.avatarList.length, // last item = add button
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          controller.selectedAvatar.value = controller.avatarList[index];
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          backgroundImage: AssetImage(controller.avatarList[index]),
                        ),
                      );
                    },
                  ),
                ),


              ],
            ),
          ),
        ),
      ],
    );;
  }
}
