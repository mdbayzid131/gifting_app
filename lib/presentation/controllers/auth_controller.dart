import 'dart:async';

import 'package:get/get.dart';

class AuthController extends GetxController{



  /// <===============================    =============================> ///






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


  // -------------------------
  // OBSERVABLES (for password)
  // -------------------------
  RxBool isPasswordVisible = true.obs;
  RxBool isNewPasswordVisible = true.obs;
  RxBool isConfirmPasswordVisible = true.obs;

  // -------------------------
  // COUNTRY
  // -------------------------
  RxString selectedCountry = ''.obs;

  // Example country list
  final List<String> countries = [
    "Bangladesh",
    "India",
    "Pakistan",
    "USA",
    "UK",
  ];

  // ------------------------------------------------------------------
  // 🔥 COMMON TOGGLE FUNCTION (Use this anywhere)
  // ------------------------------------------------------------------
  void toggle(RxBool value) {
    value.value = !value.value;
  }

  // ------------------------------------------------------------------
  // 🔥 NAME VALIDATION
  // ------------------------------------------------------------------
  String? validName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter your name";
    }
    if (value.trim().length < 3) {
      return "Name must be at least 3 characters";
    }
    return null;
  }

  // ------------------------------------------------------------------
  // 🔥 PHONE VALIDATION
  // ------------------------------------------------------------------
  String? validPhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter phone number";
    }

    final phone = value.trim();

    // must be numbers only
    if (!RegExp(r'^[0-9]+$').hasMatch(phone)) {
      return "Phone number must be digits only";
    }

    // BD number length check
    if (phone.length < 10 || phone.length > 14) {
      return "Phone number is not valid";
    }

    return null;
  }

  // ------------------------------------------------------------------
  // 🔥 EMAIL VALIDATION
  // ------------------------------------------------------------------
  String? validEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter your email";
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value.trim())) {
      return "Enter a valid email";
    }
    return null;
  }

  // ------------------------------------------------------------------
  // 🔥 PASSWORD VALIDATION
  // ------------------------------------------------------------------
  String? validPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter password";
    }
    if (value.trim().length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  // ------------------------------------------------------------------
  // SIGNUP FUNCTION (You can replace API here)
  // ------------------------------------------------------------------
  Future<void> signUp({
    required String name,
    required String email,
    required String phone,
    required String country,
    required String password,
  }) async {
    // USE THIS FOR API CALL
    print("Name: $name");
    print("Email: $email");
    print("Phone: $phone");
    print("Country: $country");
    print("Password: $password");

    // TODO: call API here...
  }



/// <===============================Validation =============================> ///

  String? validUser(String? value) {
    if (value == null || value.isEmpty) return "Please enter your UserName";
    return null;
  }



  String? validOtp(String? value) {
    if (value == null || value.length < 6) {
      return 'OTP must be 6 characters';
    }
    return null;
  }


}