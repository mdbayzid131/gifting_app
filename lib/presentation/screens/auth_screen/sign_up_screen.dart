import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../core/constants/image_paths.dart';
import '../../../data/helper/custom_snackbar.dart';
import '../../../routes/routes.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cuntryController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset(ImagePaths.giftZees)],
            ),

            SizedBox(height: 24),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    validator: _authController.validEmail,
                    controller: nameController,

                    hintText: 'Enter your Name',
                    label: 'Name',
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    validator: _authController.validEmail,
                    hintText: 'Enter your email',
                    label: 'Email',
                    controller: emailController,
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    validator: _authController.validEmail,

                    hintText: 'Enter your Number',
                    label: 'Phone Number',
                    controller: phoneController,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Country',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333),
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Obx(() => DropdownButtonFormField<String>(
                    initialValue: _authController.selectedCountry.value,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffEDE8FC), // light purple like your UI
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Color(0xff333333),
                    ),
                    hint: Text(
                      "Select Your Country",
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: 12,
                        height: 1.6,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    style: TextStyle(color: Color(0xff333333), fontSize: 12, height: 1.6,fontWeight: FontWeight.w400),

                    items: _authController.countries.map((country) {
                      return DropdownMenuItem(
                        value: country,
                        child: Text(country),
                      );
                    }).toList(),
                    onChanged: (value) {
                      _authController.selectedCountry.value = value!;
                    },
                  )),

                  SizedBox(height: 10),
                  Obx(
                    () => CustomTextField(
                      validator: _authController.validPassword,
                      obscureText: _authController.isNewPasswordVisible.value,
                      suffixIcon: IconButton(
                        onPressed: () {
                          _authController.isNewPasswordVisible.value =
                              !_authController.isNewPasswordVisible.value;
                        },
                        icon: Icon(
                          _authController.isNewPasswordVisible.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Color(0xff909090),
                          size: 18,
                        ),
                      ),

                      hintText: 'Enter your password',
                      label: 'Password',
                      controller: newPasswordController,
                    ),
                  ),
                  SizedBox(height: 10),
                  Obx(
                    () => CustomTextField(
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
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Color(0xff909090),
                          size: 18,
                        ),
                      ),

                      hintText: 'Enter your confirm password',
                      label: 'Confirm password',
                      controller: confirmPasswordController,
                    ),
                  ),

                  SizedBox(height: 24),

                  CustomElevatedButton(
                    label: 'Sign Up',
                    onPressed: () {
                      // if (_formKey.currentState!.validate()) {
                      //   Get.offAllNamed(RoutePages.bottomNabBarScreen);
                      // }
                      // Get.offAllNamed(RoutePages.bottomNabBarScreen);
                      Get.toNamed(RoutePages.bottomNabBarScreen);
                    },
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff333333),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Text(
                          " Login ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffFD7839),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
