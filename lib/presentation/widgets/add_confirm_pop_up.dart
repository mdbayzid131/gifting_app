import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gifting_app/presentation/widgets/custom_elevated_button.dart';

import '../../routes/routes.dart';

class AddConfirmPopUp extends StatelessWidget {
  const AddConfirmPopUp({super.key});

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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                Expanded(
                  child: Text(
                    'If you want to add more than 3 products, you’ll need to get a subscription.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 10),

                CustomElevatedButton(
                  label: 'Confirm',
                  onPressed: () {
                    Navigator.pop(context);
                    Get.toNamed(RoutePages.subscriptionPlan);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
    ;
  }
}
