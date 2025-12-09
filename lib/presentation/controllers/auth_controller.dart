import 'dart:async';

import 'package:get/get.dart';

class AuthController extends GetxController{



  final selectedCountry = "Bangladesh".obs;

  final countries = <String>[
    "Bangladesh",
    "India",
    "USA",
    "Canada",
    "Australia",
  ].obs;



  /// <===============================    =============================> ///

  RxBool isPasswordVisible = true.obs;
  RxBool isNewPasswordVisible = true.obs;
  RxBool isConfirmPasswordVisible = true.obs;



  RxInt secondsRemaining = 30.obs;
  RxBool enableResent = false.obs;

  Timer? timer;

  void dispostTimer() {
    timer?.cancel();
    secondsRemaining.value = 30;
    enableResent.value = false;
  }

  void startTimer() {
    timer?.cancel();
    secondsRemaining.value = 30;
    enableResent.value = false;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        enableResent.value = true;
        timer.cancel();
      }
    });
  }




/// <===============================Validation =============================> ///
  String? validEmail(String? value) {
    if (!GetUtils.isEmail(value ?? '')) return "Please enter valid email";
    return null;
  }

  String? validUser(String? value) {
    if (value == null || value.isEmpty) return "Please enter your UserName";
    return null;
  }

  String? validPassword(String? value) {
    if (value == null || value.length < 6) {
      return 'Minimum password 6 character';
    }
    return null;
  }

  String? validOtp(String? value) {
    if (value == null || value.length < 6) {
      return 'OTP must be 6 characters';
    }
    return null;
  }


}