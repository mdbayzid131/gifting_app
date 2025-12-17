import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/constants/app_color.dart';
import '../../core/constants/image_paths.dart';
import '../controllers/voice_record_controller.dart';
import '../widgets/custom_elevated_button.dart';

class SendVoicePopup extends StatelessWidget {
  const SendVoicePopup({super.key});

  @override
  Widget build(BuildContext context) {
    ///<================= CONTROLLER =========================>///
    final controller = Get.put(VoiceRecordController());

    return Stack(
      children: [
        ///<================= BLUR BACKGROUND =========================>///
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Container(
            color: Colors.black.withOpacity(0.45),
          ),
        ),

        ///<================= POPUP CARD =========================>///
        Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              width: 320.w,
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 22.h,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),

              ///<================= REACTIVE UI =========================>///
              child: Obx(
                    () => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ///<================= TITLE =========================>///
                    Text(
                      "Send a Voice Note 🎤",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    ///<================= RECORD STATUS TEXT =========================>///
                    Text(
                      controller.isRecording.value
                          ? "Recording... ${controller.formattedTime}"
                          : "Tap the microphone to start recording",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: controller.isRecording.value
                            ? Colors.red
                            : Colors.grey,
                      ),
                    ),

                    SizedBox(height: 22.h),

                    ///<================= MICROPHONE BUTTON =========================>///
                    GestureDetector(
                      onTap: controller.isRecording.value
                          ? null
                          : controller.startRecording,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 86.w,
                        height: 86.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.isRecording.value
                              ? Colors.red
                              : const Color(0xffFD7839),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.18),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),

                        ///<================= SVG SIZE FIX =========================>///
                        child: Center(
                          child: SizedBox(
                            width: 42.w,
                            height: 42.w,
                            child: SvgPicture.asset(
                              ImagePaths.mice,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 26.h),

                    ///<================= ACTION BUTTONS =========================>///
                    Row(
                      children: [
                        ///<================= CANCEL BUTTON =========================>///
                        Expanded(
                          child: CustomElevatedButton(
                            label: 'Cancel',
                            onPressed: () {
                              controller.stopRecording();
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 46.h),
                              backgroundColor: const Color(0xffFDFCFA),
                              elevation: 0,
                              padding:
                              EdgeInsets.symmetric(vertical: 10.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                side: BorderSide(
                                  color: AppColors.primary,
                                  width: 1.4,
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 12.w),

                        ///<================= SEND BUTTON =========================>///
                        Expanded(
                          child: CustomElevatedButton(
                            label: 'Send',
                            onPressed: controller.isRecording.value
                                ? () {
                              controller.stopRecording(send: true);
                              debugPrint('==============================================================');
                              debugPrint(controller.filePath);
                            }
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
