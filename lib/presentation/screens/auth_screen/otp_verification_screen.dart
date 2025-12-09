import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../../routes/routes.dart';

import '../../../core/constants/app_color.dart';
import '../../../core/constants/image_paths.dart';
import '../../../data/helper/time_formater.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();
  final _authController = Get.find<AuthController>();

  @override
  void initState() {
    _authController.startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _authController.dispostTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset(ImagePaths.giftZees)],
            ),
            SizedBox(height: 24),
            Image.asset(ImagePaths.otpVerify),
            SizedBox(height: 24),
            Text(
              'One-Time Password Verification',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff1D1D1D),
                height: 1.22,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            Text(
              'A verification code has been sent to\nyour registered email/phone. Enter\nbelow to proceed.',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff525050),
                height: 1.22,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Obx(
              ()=> Form(
                key: _formKey,
                child: Column(
                  children: [
                    Pinput(
                      length: 6,
                      controller: otpController,
                      defaultPinTheme: PinTheme(
                        width: 48,
                        height: 48,
                        textStyle: TextStyle(
                          fontSize: 15.sp,
                          color: const Color(0xff333333),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xffEDE8FC),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      focusedPinTheme: PinTheme(
                        width: 48,
                        height: 48,
                        textStyle: TextStyle(
                          fontSize: 16.sp,
                          color: const Color(0xff333333),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffEDE8FC),
                          border: Border.all(color: AppColors.primary, width: 1),
                        ),
                      ),
                      errorPinTheme: PinTheme(
                        width: 48,
                        height: 48,
                        textStyle: TextStyle(
                          fontSize: 16.sp,
                          color: const Color(0xff333333),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffEDE8FC),
                          border: Border.all(color: Colors.red, width: 1),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter OTP';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    if (_authController.enableResent.value)
                      Column(
                        children: [
                          TextButton(
                            onPressed: () async {
                              _authController.startTimer();
                              // _controller.isLoading(true);
                              // final headers = {'Content-Type': 'application/json'};
                              // final response = await ApiClient.postData(
                              //   ApiConstant.forgetPassword,
                              //   jsonEncode({"username": Get.arguments}), // Using Get.arguments to get username
                              //   headers: headers,
                              // );
                              // if (response.statusCode != 200) {
                              //   ApiChecker.checkApi(response);
                              // }
                              // _authController.isLoading(false);
                            },
                            child: Text('Resent OTP',style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.redAccent,
                            ),),
                          ),
                        ],
                      )
                    else
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 50),
                        Text(
                          'Resend in : ${formatTime(_authController.secondsRemaining.value)}',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff19B23F),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 32),

                    CustomElevatedButton(
                      label: 'Send',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Get.toNamed(RoutePages.newPassword);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
