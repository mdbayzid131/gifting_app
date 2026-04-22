import 'package:gifting_app/data/models/user_profile_model.dart';

/// ================= PROFILE RESPONSE MODEL =================
/// Handles full API response
class ProfileResponseModel {
  final bool success;
  final String message;
  final UserProfileModel? data;

  ProfileResponseModel({
    required this.success,
    required this.message,
    this.data,
  });

  /// From JSON
  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return ProfileResponseModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? UserProfileModel.fromJson(json['data'])
          : null,
    );
  }

  /// To JSON (optional but professional practice)
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data?.toJson(),
    };
  }
}
