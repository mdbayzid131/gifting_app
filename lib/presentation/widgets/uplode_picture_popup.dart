import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import '../controllers/creat_profile_controller.dart';
import 'avatar_profile_popup.dart';

class UploadPicturePopup extends StatelessWidget {
  UploadPicturePopup({super.key});
  final CreateProfileController controller =
      Get.find<CreateProfileController>();

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
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xffFFFAF8),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Upload Picture',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close,
                        size: 20,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                buildElevatedButton(
                  context,
                  label: 'Upload from Gallery',
                  onPressed: () {
                    Navigator.pop(context);
                    controller.pickFromGallery();
                  },
                ),
                const SizedBox(height: 10),
                buildElevatedButton(
                  context,
                  label: 'Choose Avatar',
                  onPressed: () {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) => AvatarProfilePopup(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  ElevatedButton buildElevatedButton(
    BuildContext context, {
    required String label,
    required Function() onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),

        backgroundColor: Color(0xffEDE8FC),
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
