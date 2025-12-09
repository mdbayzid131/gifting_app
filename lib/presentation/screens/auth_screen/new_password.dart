import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../routes/routes.dart';
import '../../../core/constants/image_paths.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _authController = Get.find<AuthController>();
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
            Center(
              child: Text(
                "Create New Password",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  color: Color(0xff1D1D1D),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'Create a new password to secure your\naccount and continue. Your password should\n be at least 8 characters.\nUse a mix of letters, numbers, and a symbol.',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff525050),
                  height: 1.22,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 24),
            Obx(
              () => Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      obscureText: _authController.isNewPasswordVisible.value,
                      suffixIcon: IconButton(
                        onPressed: () {
                          _authController.isNewPasswordVisible.value =
                              !_authController.isNewPasswordVisible.value;
                        },
                        icon: Icon(
                          _authController.isNewPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Color(0xff909090),
                          size: 18,
                        ),
                      ),

                      hintText: 'Enter your new password',
                      label: 'New Password',
                      controller: passwordController,
                    ),
                    CustomTextField(
                      validator: _authController.validPassword,
                      obscureText:
                          _authController.isConfirmPasswordVisible.value,
                      suffixIcon: IconButton(
                        onPressed: () {
                          _authController.isConfirmPasswordVisible.value =
                              !_authController.isConfirmPasswordVisible.value;
                        },
                        icon: Icon(
                          _authController.isConfirmPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Color(0xff909090),
                          size: 18,
                        ),
                      ),

                      hintText: 'Enter confirm Password',
                      label: 'Confirm your new password',
                      controller: confirmPasswordController,
                    ),

                    SizedBox(height: 78),

                    CustomElevatedButton(
                      label: 'Create New Password',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Get.toNamed(RoutePages.loginScreen);
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
