import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/voice_record_controller.dart';

class SendVoicePopup {
  static Future<String?> show() {
    return Get.dialog(
      const _PopupBody(),
      barrierDismissible: false,
    );
  }
}

class _PopupBody extends StatelessWidget {
  const _PopupBody();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VoiceRecordController());

    return Stack(
      children: [
        /// Blur
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(color: Colors.black45),
        ),

        Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              width: 320,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Obx(() {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Send a Voice Note",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      controller.isRecording.value
                          ? "Recording... ${controller.formattedTime}"
                          : "Tap mic to start recording",
                      style: TextStyle(
                        color: controller.isRecording.value
                            ? Colors.red
                            : Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// MIC
                    GestureDetector(
                      onTap: controller.isRecording.value
                          ? null
                          : controller.startRecording,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.isRecording.value
                              ? Colors.red
                              : Colors.orange,
                        ),
                        child: const Icon(
                          Icons.mic,
                          color: Colors.white,
                          size: 36,
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    /// Buttons
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              controller.stopRecording();
                              Get.back();
                            },
                            child: const Text("Cancel"),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: controller.isRecording.value
                                ? () {
                                  controller.stopRecording(send: true);
                                  print(controller.filePath);
                                  print('================================================================');
                                }
                                : null,
                            child: const Text("Send"),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
