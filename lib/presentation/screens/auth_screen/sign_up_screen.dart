import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
  // -------------------------------
  // FORM & TEXT CONTROLLERS
  // -------------------------------
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // -------------------------------
  // GETX AUTH CONTROLLER
  // -------------------------------
  final AuthController _authController = Get.find<AuthController>();

  @override
  void dispose() {
    // Prevent memory leaks
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    countryController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // -------------------------------
              // TOP LOGO
              // -------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset(ImagePaths.giftZees)],
              ),

              SizedBox(height: 24.h),

              // -------------------------------
              // MAIN FORM
              // -------------------------------
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // NAME
                    CustomTextField(
                      validator: _authController.validName,
                      controller: nameController,
                      hintText: 'Enter your Name',
                      label: 'Name',
                    ),
                    SizedBox(height: 10.h),

                    // EMAIL
                    CustomTextField(
                      validator: _authController.validEmail,
                      hintText: 'Enter your email',
                      label: 'Email',
                      controller: emailController,
                    ),
                    SizedBox(height: 10.h),

                    // PHONE
                    CustomTextField(
                      validator: _authController.validPhone,
                      hintText: 'Enter your Number',
                      label: 'Phone Number',
                      controller: phoneController,
                    ),
                    SizedBox(height: 10.h),

                    // -------------------------------
                    // COUNTRY DROPDOWN
                    // -------------------------------
                     Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Country',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff333333),
                            height: 1.6.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),

                    Obx(
                      () => DropdownButtonFormField<String>(
                        initialValue:
                            _authController.selectedCountry.value.isEmpty
                            ? null
                            : _authController.selectedCountry.value,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xffEDE8FC),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 16.h,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
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
                            fontSize: 12.sp,
                            height: 1.6.h,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        style: const TextStyle(
                          color: Color(0xff333333),
                          fontSize: 12,
                          height: 1.6,
                          fontWeight: FontWeight.w400,
                        ),
                        items: _authController.countries.map((country) {
                          return DropdownMenuItem(
                            value: country,
                            child: Text(country),
                          );
                        }).toList(),
                        onChanged: (value) {
                          _authController.selectedCountry.value = value!;
                        },
                        validator: (value) =>
                            value == null ? "Please select a country" : null,
                      ),
                    ),

                    SizedBox(height: 10.h),

                    // -------------------------------
                    // PASSWORD FIELD
                    // -------------------------------
                    Obx(
                      () => CustomTextField(
                        validator: _authController.validPassword,
                        obscureText: _authController.isNewPasswordVisible.value,
                        suffixIcon: IconButton(
                          onPressed: () {
                            _authController.toggle(
                              _authController.isNewPasswordVisible,
                            );
                          },
                          icon: Icon(
                            _authController.isNewPasswordVisible.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: const Color(0xff909090),
                            size: 18.sp,
                          ),
                        ),
                        hintText: 'Enter your password',
                        label: 'Password',
                        controller: newPasswordController,
                      ),
                    ),
                    SizedBox(height: 10.h),

                    // -------------------------------
                    // CONFIRM PASSWORD FIELD
                    // -------------------------------
                    Obx(
                      () => CustomTextField(
                        validator: _authController.validPassword,
                        obscureText:
                            _authController.isConfirmPasswordVisible.value,
                        suffixIcon: IconButton(
                          onPressed: () {
                            _authController.toggle(
                              _authController.isConfirmPasswordVisible,
                            );
                          },
                          icon: Icon(
                            _authController.isConfirmPasswordVisible.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: const Color(0xff909090),
                            size: 18.sp,
                          ),
                        ),
                        hintText: 'Enter your confirm password',
                        label: 'Confirm password',
                        controller: confirmPasswordController,
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // -------------------------------
                    // SIGNUP BUTTON
                    // -------------------------------
                    CustomElevatedButton(
                      label: 'Sign Up',
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) return;

                        if (newPasswordController.text.trim() !=
                            confirmPasswordController.text.trim()) {
                          // CustomSnackBar.error("Passwords do not match");
                          return;
                        }

                        // _authController.signUp(
                        //   name: nameController.text.trim(),
                        //   email: emailController.text.trim(),
                        //   phone: phoneController.text.trim(),
                        //   country: _authController.selectedCountry.value,
                        //   password: newPasswordController.text.trim(),
                        // );
                      },
                    ),

                    SizedBox(height: 10.h),

                    // -------------------------------
                    // LOGIN REDIRECT
                    // -------------------------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff333333),
                          ),
                        ),
                        InkWell(
                          onTap: () => Get.back(),
                          child: Text(
                            " Login ",
                            style: TextStyle(
                              fontSize: 14.sp,
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
      ),
    );
  }
}
