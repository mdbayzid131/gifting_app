import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../routes/routes.dart';
import '../../../core/constants/image_paths.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
<<<<<<< HEAD

=======
>>>>>>> api-integration
              SizedBox(height: 80.h),

              ///================= App Logo =========================///
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
<<<<<<< HEAD
                children: [
                  Image.asset(
                    ImagePaths.giftZees,
                    width: 218.w,
                  ),
                ],
=======
                children: [Image.asset(ImagePaths.giftZees, width: 218.w)],
>>>>>>> api-integration
              ),

              SizedBox(height: 24.h),

              ///================= Welcome Text =========================///
              Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff19B23F),
                ),
              ),

              SizedBox(height: 32.h),

              ///================= Login Form =========================///
              Form(
                key: _formKey,
                child: Column(
                  children: [
<<<<<<< HEAD

=======
>>>>>>> api-integration
                    ///================= Email Field =========================///
                    CustomTextField(
                      validator: _authController.validEmail,
                      hintText: 'Enter your email',
                      label: 'Email',
                      controller: emailController,
                    ),

                    SizedBox(height: 16.h),

                    ///================= Password Field =========================///
                    Obx(
<<<<<<< HEAD
                          () => CustomTextField(
                        validator: _authController.validPassword,
                        obscureText:
                        _authController.isPasswordVisible.value,
                        suffixIcon: IconButton(
                          onPressed: () {
                            _authController.isPasswordVisible.value =
                            !_authController.isPasswordVisible.value;
=======
                      () => CustomTextField(
                        validator: _authController.validPassword,
                        obscureText: _authController.isPasswordVisible.value,
                        suffixIcon: IconButton(
                          onPressed: () {
                            _authController.isPasswordVisible.value =
                                !_authController.isPasswordVisible.value;
>>>>>>> api-integration
                          },
                          icon: Icon(
                            _authController.isPasswordVisible.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: const Color(0xff909090),
                            size: 18.sp,
                          ),
                        ),
                        hintText: 'Enter your password',
                        label: 'Password',
                        controller: passwordController,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    ///================= Forgot Password =========================///
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Get.toNamed(RoutePages.forgetPassword);
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
<<<<<<< HEAD
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
=======
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
>>>>>>> api-integration
                        ),
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffFD7839),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 24.h),

                    ///================= Login Button =========================///
<<<<<<< HEAD
                    CustomElevatedButton(
                      label: 'Login',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Get.offAllNamed(
                              RoutePages.bottomNabBarScreen);
                        }
                      },
=======
                    Obx(()=>
                       CustomElevatedButton(
                        isLoading: _authController.isLoading.value,

                        label: 'Login',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _authController.login(
                              email: emailController.text.trim(),
                              password: passwordController.text, context: context,
                            );
                          }
                        },
                      ),
>>>>>>> api-integration
                    ),

                    SizedBox(height: 16.h),

                    ///================= Sign Up Redirect =========================///
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account?",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff333333),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(RoutePages.signUpScreen);
                          },
                          child: Padding(
<<<<<<< HEAD
                            padding:
                            EdgeInsets.symmetric(horizontal: 4.w),
=======
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
>>>>>>> api-integration
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xffFD7839),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 30.h),
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
