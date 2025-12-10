import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 81),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset(ImagePaths.giftZees)],
              ),

              SizedBox(height: 24),
              Center(
                child: Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff19B23F),
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      validator: _authController.validEmail,
                      hintText: 'Enter your email',
                      label: 'Email',
                      controller: emailController,
                    ),
                    SizedBox(height: 16),
                    Obx(
                      () => CustomTextField(
                        validator: _authController.validPassword,
                        obscureText: _authController.isPasswordVisible.value,

                        suffixIcon: IconButton(
                          onPressed: () {
                            _authController.isPasswordVisible.value =
                                !_authController.isPasswordVisible.value;
                          },
                          icon: Icon(
                            _authController.isPasswordVisible.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Color(0xff909090),
                            size: 18,
                          ),
                        ),

                        hintText: 'Enter your password',
                        label: 'Password',
                        controller: passwordController,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.toNamed(RoutePages.forgetPassword);
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            minimumSize: Size(0, 0),
                          ),
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                              color: Color(0xffFD7839),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 24),

                    CustomElevatedButton(
                      label: 'Login',
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        //   Get.offAllNamed(RoutePages.bottomNabBarScreen);
                        // }
                        // Get.offAllNamed(RoutePages.bottomNabBarScreen);
                        Get.offAllNamed(RoutePages.bottomNabBarScreen);
                      },
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account? ",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff333333),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(RoutePages.signUpScreen);
                          },
                          child: Text(
                            " Sign Up ",
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
      ),
    );
  }
}
