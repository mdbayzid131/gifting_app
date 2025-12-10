import 'dart:ui';
import 'package:flutter/material.dart';

class CustomRejectUserPopup extends StatelessWidget {
  final String name;

  const CustomRejectUserPopup({super.key, required this.name});

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
            height: 190,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(onTap: (){Navigator.pop(context);}, child: const Icon(Icons.close, size: 20, color: Colors.red)),
                  ],),
                const SizedBox(height: 15),
                Text(
                  "Are You Want To Make Sure That\nYou Want To Add $name ?",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 10),

                /// 🟡 Accept Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),

                    backgroundColor: Color(0xffCC4343),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Reject",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
