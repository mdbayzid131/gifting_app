
class ChildrenResponse {
  final bool success;
  final String message;
  final List<ChildData> data;

  ChildrenResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  /// Factory constructor to parse JSON
  factory ChildrenResponse.fromJson(Map<String, dynamic> json) {
    return ChildrenResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? List<ChildData>.from(
          (json['data'] as List).map((x) => ChildData.fromJson(x)))
          : [],
    );
  }

  /// Convert model to JSON
  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'data': data.map((x) => x.toJson()).toList(),
  };
}

/// Model class for each child
class ChildData {
  final String id;
  final String parentId;
  final String name;
  final DateTime? dateOfBirth; // nullable in case API returns null
  final String? profileImage; // nullable
  final String? gender; // nullable
  final List<String>? interests; // nullable
  final String? bio; // nullable
  final bool? isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? age;

  ChildData({
    required this.id,
    required this.parentId,
    required this.name,
    this.dateOfBirth,
    this.profileImage,
    this.gender,
    this.interests,
    this.bio,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.age,
  });

  /// Factory constructor to parse JSON
  factory ChildData.fromJson(Map<String, dynamic> json) {
    return ChildData(
      id: json['_id'] ?? '',
      parentId: json['parentId'] ?? '',
      name: json['name'] ?? '',
      dateOfBirth: json['dateOfBirth'] != null
          ? DateTime.tryParse(json['dateOfBirth'])
          : null,
      profileImage: json['profileImage'],
      gender: json['gender'],
      interests: json['interests'] != null
          ? List<String>.from(json['interests'])
          : null,
      bio: json['bio'],
      isActive: json['isActive'],
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
      age: json['age'],
    );
  }

  /// Convert model to JSON
  Map<String, dynamic> toJson() => {
    '_id': id,
    'parentId': parentId,
    'name': name,
    'dateOfBirth': dateOfBirth?.toIso8601String(),
    'profileImage': profileImage,
    'gender': gender,
    'interests': interests,
    'bio': bio,
    'isActive': isActive,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    'age': age,
  };
}
