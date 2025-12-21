import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../../core/utils/app_constants.dart';
import '../../core/utils/custom_snackbar.dart';
import '../../data/helper/prefs_helper.dart';
import '../../data/repo/auth_repo.dart';
import '../../data/services/api_checker.dart';
import '../../routes/routes.dart';

class AuthController extends GetxController {
  final AuthRepo authRepo;

  AuthController(this.authRepo);

  RxBool isLoading = RxBool(false);

  /// ===================== SIGNUP =====================

  Future<void> signup({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String country,
  }) async {
    try {
      isLoading(true);

      Response response = await authRepo.signup(
        name: name,
        email: email,
        password: password,
        phone: phone,
        country: country,
      );

      // ApiChecker response validate
      ApiChecker.checkApi(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        String token = response.data['data']['access_token'];
        await PrefsHelper.setString(AppConstants.bearerToken, token);
        showCustomSnackBar("Signup successful!", isError: false);
        Get.offAllNamed(RoutePages.bottomNabBarScreen);
      }
    } catch (e) {
      if (e is DioException) {
        ApiChecker.handleError(e);
      } else {
        showCustomSnackBar("Error: $e", isError: true);
      }
    } finally {
      isLoading(false);
    }
  }



  /// ===================== LOGIN =====================

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      isLoading(true);

      Response response = await authRepo.login(

        email: email,
        password: password,

      );

      // ApiChecker response validate
      ApiChecker.checkApi(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        String token = response.data['data']['access_token'];
        await PrefsHelper.setString(AppConstants.bearerToken, token);
        showCustomSnackBar("Signup successful!", isError: false);
        Get.offAllNamed(RoutePages.bottomNabBarScreen);
      }
    } catch (e) {
      if (e is DioException) {
        ApiChecker.handleError(e);
      } else {
        showCustomSnackBar("Error: $e", isError: true);
      }
    } finally {
      isLoading(false);
    }
  }



  /// ===================== FORGOT PASSWORD =====================

  Future<void> forgotPassword({
    required String email,
  }) async {
    try {
      isLoading(true);

      Response response = await authRepo.forgotPassword(

        email: email,

      );

      // ApiChecker response validate
      ApiChecker.checkApi(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        String token = response.data['data']['access_token'];
        await PrefsHelper.setString(AppConstants.bearerToken, token);
        showCustomSnackBar("Signup successful!", isError: false);
        Get.offAllNamed(RoutePages.bottomNabBarScreen);
      }
    } catch (e) {
      if (e is DioException) {
        ApiChecker.handleError(e);
      } else {
        showCustomSnackBar("Error: $e", isError: true);
      }
    } finally {
      isLoading(false);
    }
  }


  /// ===================== SIGNUP =====================

  Future<void> resentOtp({

    required String email,

  }) async {
    try {
      isLoading(true);

      Response response = await authRepo.resentOtp(
        email: email,
      );

      // ApiChecker response validate
      ApiChecker.checkApi(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        String token = response.data['data']['access_token'];
        await PrefsHelper.setString(AppConstants.bearerToken, token);
        showCustomSnackBar("Signup successful!", isError: false);
        Get.offAllNamed(RoutePages.bottomNabBarScreen);
      }
    } catch (e) {
      if (e is DioException) {
        ApiChecker.handleError(e);
      } else {
        showCustomSnackBar("Error: $e", isError: true);
      }
    } finally {
      isLoading(false);
    }
  }
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
    "Afghanistan",
    "Albania",
    "Algeria",
    "Andorra",
    "Angola",
    "Antigua and Barbuda",
    "Argentina",
    "Armenia",
    "Australia",
    "Austria",
    "Azerbaijan",
    "Bahamas",
    "Bahrain",
    "Bangladesh",
    "Barbados",
    "Belarus",
    "Belgium",
    "Belize",
    "Benin",
    "Bhutan",
    "Bolivia",
    "Bosnia and Herzegovina",
    "Botswana",
    "Brazil",
    "Brunei",
    "Bulgaria",
    "Burkina Faso",
    "Burundi",
    "Cambodia",
    "Cameroon",
    "Canada",
    "Cape Verde",
    "Central African Republic",
    "Chad",
    "Chile",
    "China",
    "Colombia",
    "Comoros",
    "Congo",
    "Costa Rica",
    "Croatia",
    "Cuba",
    "Cyprus",
    "Czech Republic",
    "Denmark",
    "Djibouti",
    "Dominica",
    "Dominican Republic",
    "Ecuador",
    "Egypt",
    "El Salvador",
    "Equatorial Guinea",
    "Eritrea",
    "Estonia",
    "Eswatini",
    "Ethiopia",
    "Fiji",
    "Finland",
    "France",
    "Gabon",
    "Gambia",
    "Georgia",
    "Germany",
    "Ghana",
    "Greece",
    "Grenada",
    "Guatemala",
    "Guinea",
    "Guinea-Bissau",
    "Guyana",
    "Haiti",
    "Honduras",
    "Hungary",
    "Iceland",
    "India",
    "Indonesia",
    "Iran",
    "Iraq",
    "Ireland",
    "Israel",
    "Italy",
    "Jamaica",
    "Japan",
    "Jordan",
    "Kazakhstan",
    "Kenya",
    "Kiribati",
    "Kuwait",
    "Kyrgyzstan",
    "Laos",
    "Latvia",
    "Lebanon",
    "Lesotho",
    "Liberia",
    "Libya",
    "Liechtenstein",
    "Lithuania",
    "Luxembourg",
    "Madagascar",
    "Malawi",
    "Malaysia",
    "Maldives",
    "Mali",
    "Malta",
    "Marshall Islands",
    "Mauritania",
    "Mauritius",
    "Mexico",
    "Micronesia",
    "Moldova",
    "Monaco",
    "Mongolia",
    "Montenegro",
    "Morocco",
    "Mozambique",
    "Myanmar",
    "Namibia",
    "Nauru",
    "Nepal",
    "Netherlands",
    "New Zealand",
    "Nicaragua",
    "Niger",
    "Nigeria",
    "North Korea",
    "North Macedonia",
    "Norway",
    "Oman",
    "Pakistan",
    "Palau",
    "Panama",
    "Papua New Guinea",
    "Paraguay",
    "Peru",
    "Philippines",
    "Poland",
    "Portugal",
    "Qatar",
    "Romania",
    "Russia",
    "Rwanda",
    "Saint Kitts and Nevis",
    "Saint Lucia",
    "Saint Vincent and the Grenadines",
    "Samoa",
    "San Marino",
    "Sao Tome and Principe",
    "Saudi Arabia",
    "Senegal",
    "Serbia",
    "Seychelles",
    "Sierra Leone",
    "Singapore",
    "Slovakia",
    "Slovenia",
    "Solomon Islands",
    "Somalia",
    "South Africa",
    "South Korea",
    "South Sudan",
    "Spain",
    "Sri Lanka",
    "Sudan",
    "Suriname",
    "Sweden",
    "Switzerland",
    "Syria",
    "Taiwan",
    "Tajikistan",
    "Tanzania",
    "Thailand",
    "Timor-Leste",
    "Togo",
    "Tonga",
    "Trinidad and Tobago",
    "Tunisia",
    "Turkey",
    "Turkmenistan",
    "Tuvalu",
    "Uganda",
    "Ukraine",
    "United Arab Emirates",
    "United Kingdom",
    "United States",
    "Uruguay",
    "Uzbekistan",
    "Vanuatu",
    "Vatican City",
    "Venezuela",
    "Vietnam",
    "Yemen",
    "Zambia",
    "Zimbabwe",
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
    if (value == null || value
        .trim()
        .isEmpty) {
      return "Enter your name";
    }
    if (value
        .trim()
        .length < 3) {
      return "Name must be at least 3 characters";
    }
    return null;
  }

  // ------------------------------------------------------------------
  // 🔥 PHONE VALIDATION
  // ------------------------------------------------------------------
  String? validPhone(String? value) {
    if (value == null || value
        .trim()
        .isEmpty) {
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
    if (value == null || value
        .trim()
        .isEmpty) {
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
    if (value == null || value
        .trim()
        .isEmpty) {
      return "Enter password";
    }
    if (value
        .trim()
        .length < 6) {
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