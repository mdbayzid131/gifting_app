import 'package:dio/dio.dart';
import 'package:gifting_app/core/constants/api_endpoints.dart';
import '../services/api_client.dart';
class AuthRepo {
  final ApiClient apiClient;
  AuthRepo({required this.apiClient});

  /// ===================== SIGNUP =====================
  Future<Response> signup({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String country,
    String role="PARENT",
  }) async {
    return await apiClient.postData(
      ApiEndpoints.createParentAccount,
        {
          "name": name,
          "email": email,
          "password":password,
          "phone": phone,
          "country": country,
          "role": role,
        },

    );
  }

  /// ===================== LOGIN =====================
  Future<Response> login({
    required String email,
    required String password,
  }) async {
    return await apiClient.postData(
      ApiEndpoints.login,
        {
          "email": email,
          "password": password,
        }
    );
  }

  /// ===================== FORGOT PASSWORD =====================
  Future<Response> forgotPassword({required String email,}) async {
    return await apiClient.postData(
      ApiEndpoints.forgotPassword,
        {
          "email":email
        }
    );
  }


/// ===================== RESEND OTP =====================
  Future<Response> resentOtp({required String email,}) async {
    return await apiClient.postData(
        ApiEndpoints.resendVerifyEmail,
        {
          "email":email
        }
    );
  }

  /// ===================== OTP VERIFY =====================
  Future<Response> otpVerify(String email, int oneTimeCode) async {
    return await apiClient.postData(
        ApiEndpoints.verifyEmail,
        {
          "email": email,
          "oneTimeCode": oneTimeCode,
        }
    );
  }

  /// ===================== RESET PASSWORD =====================
  Future<Response> resetPassword({
    required String newPassword,
    required String confirmPassword,
  }) async {
    return await apiClient.postData(
      ApiEndpoints.resetPassword,
        {
          "newPassword": newPassword,
          "confirmPassword": confirmPassword,
        }
    );
  }



  /// ===================== LOGOUT =====================
  Future<Response> logout() async {
    return await apiClient.postData(ApiEndpoints.logout, {});
  }

  /// ===================== REFRESH TOKEN =====================
  Future<Response> refreshToken(String refreshToken) async {
    return await apiClient.postData(
      ApiEndpoints.refreshToken,
        {
          "refreshToken": "{$refreshToken}"
        }
    );
  }


  /// ===================== CHANGE PASSWORD =====================
  Future<Response> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    return await apiClient.postData(
      ApiEndpoints.changePassword,
        {
          "currentPassword": currentPassword,
          "newPassword": newPassword,
          "confirmPassword": confirmPassword,
        }
    );
  }


  /// ===================== GET PROFILE =====================
  Future<Response> getProfile() async {
    return await apiClient.getData("auth/profile");
  }

  /// ===================== UPDATE PROFILE =====================
  Future<Response> updateProfile(Map<String, dynamic> body) async {
    return await apiClient.putData("auth/profile/update", body);
  }







  }
