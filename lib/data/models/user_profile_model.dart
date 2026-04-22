/// ================= USER PROFILE MODEL =================
/// Represents logged-in user profile data
class UserProfileModel {
  final String id;
  final String name;
  final String role;
  final String email;
  final String country;
  final String phone;
  final String profilePicture;
  final String status;
  final bool verified;
  final List<dynamic> deviceTokens;
  final String subscriptionStatus;
  final String subscriptionPlan;
  final String? subscriptionId;
  final String? stripeCustomerId;
  final int maxChildrenAllowed;
  final DateTime? subscriptionCurrentPeriodEnd;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserProfileModel({
    required this.id,
    required this.name,
    required this.role,
    required this.email,
    required this.country,
    required this.phone,
    required this.profilePicture,
    required this.status,
    required this.verified,
    required this.deviceTokens,
    required this.subscriptionStatus,
    required this.subscriptionPlan,
    this.subscriptionId,
    this.stripeCustomerId,
    required this.maxChildrenAllowed,
    this.subscriptionCurrentPeriodEnd,
    required this.createdAt,
    required this.updatedAt,
  });

  /// From JSON
  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      role: json['role'] ?? '',
      email: json['email'] ?? '',
      country: json['country'] ?? '',
      phone: json['phone'] ?? '',
      profilePicture: json['profilePicture'] ?? '',
      status: json['status'] ?? '',
      verified: json['verified'] ?? false,
      deviceTokens: json['deviceTokens'] ?? [],
      subscriptionStatus: json['subscriptionStatus'] ?? '',
      subscriptionPlan: json['subscriptionPlan'] ?? '',
      subscriptionId: json['subscriptionId'],
      stripeCustomerId: json['stripeCustomerId'],
      maxChildrenAllowed: json['maxChildrenAllowed'] ?? 0,
      subscriptionCurrentPeriodEnd: json['subscriptionCurrentPeriodEnd'] != null
          ? DateTime.tryParse(json['subscriptionCurrentPeriodEnd'])
          : null,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  /// To JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'role': role,
      'email': email,
      'country': country,
      'phone': phone,
      'profilePicture': profilePicture,
      'status': status,
      'verified': verified,
      'deviceTokens': deviceTokens,
      'subscriptionStatus': subscriptionStatus,
      'subscriptionPlan': subscriptionPlan,
      'subscriptionId': subscriptionId,
      'stripeCustomerId': stripeCustomerId,
      'maxChildrenAllowed': maxChildrenAllowed,
      'subscriptionCurrentPeriodEnd':
      subscriptionCurrentPeriodEnd?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
