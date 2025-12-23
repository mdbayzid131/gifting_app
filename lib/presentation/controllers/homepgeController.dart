import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' hide ByteData;
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:image_picker/image_picker.dart';

import '../../core/constants/image_paths.dart';
import '../../core/utils/custom_snackbar.dart';
import '../../data/models/NotificationItemModel.dart';
import '../../data/models/children_data_model.dart';
import '../../data/models/profile_response_model.dart';
import '../../data/models/user_profile_model.dart';
import '../../data/repo/user_profile_manage_repo.dart';
import '../../data/services/api_checker.dart';

class HomePageController extends GetxController {
  final UserProfileManageRepo userProfileManageRepo;

  HomePageController(this.userProfileManageRepo);

  @override
  void onInit() {
    super.onInit();
    getProfile();
    getChildrenProfile();
  }

  RxBool isLoading = RxBool(false);

  /// Profile data store
  Rx<UserProfileModel?> profile = Rx<UserProfileModel?>(null);

  Future<void> getProfile() async {
    try {
      isLoading(true);

      Response<dynamic> response = await userProfileManageRepo.getProfile();
      ApiChecker.checkApi(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final profileResponseModel = ProfileResponseModel.fromJson(
          response.data,
        );

        profile.value = profileResponseModel.data;

        print(profile.value?.name);
        print(profile.value?.email);
        print(profile.value?.profilePicture);
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

  Future<void> updateProfile({
    required String name,
    required BuildContext context,
  }) async {
    try {
      isLoading(true);

      Response<dynamic> response = await userProfileManageRepo.updateProfile({
        "name": name,
      });
      ApiChecker.checkApi(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        showCustomSnackBar("Profile updated successfully", isError: false);
        await getProfile();
        if (context.mounted) {
          Navigator.pop(context);
        }
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

  /// children data store
  RxList<ChildData> childData = <ChildData>[].obs;

  Future<void> getChildrenProfile() async {
    try {
      isLoading(true);

      Response<dynamic> response = await userProfileManageRepo
          .getChildrenProfile();
      ApiChecker.checkApi(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final childrenResponse = ChildrenResponse.fromJson(response.data);

        childData.assignAll(childrenResponse.data);
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

  /// ===================== profile photo update =====================

  Future<void> pickImageFromGallery(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      FormData formData = FormData.fromMap({
        "profilePicture": await MultipartFile.fromFile(image.path),
      });

      Response response = await userProfileManageRepo.updateProfileImage(
        formData,
      );

      ApiChecker.checkApi(response);
      if (response.statusCode == 200) {
        showCustomSnackBar("Profile updated successfully", isError: false);
        await getProfile();

        if (context.mounted) {
          Navigator.pop(context);
        }
      }
    }
  }

  Future<void> uploadAvatar(String assetPath) async {
    // assets থেকে file লোড করতে হবে
    ByteData byteData = await rootBundle.load(assetPath);
    List<int> imageData = byteData.buffer.asUint8List();

    FormData formData = FormData.fromMap({
      "profilePicture": MultipartFile.fromBytes(
        imageData,
        filename: assetPath.split("/").last, // ফাইল নাম
      ),
    });

    Response response = await userProfileManageRepo.updateProfileImage(
      formData,
    );

    if (response.statusCode == 200) {
      showCustomSnackBar("Avatar updated successfully", isError: false);
      await getProfile();
    }
  }

  /// ===================== children profile photo update =====================


  Future<void> updateChildrenProfile({
    required String childId,
    required BuildContext context,
    required String name,
    required String dob,
  }) async {
    try {
      isLoading(true);

      Response<dynamic> response = await userProfileManageRepo.updateChildProfile(childId,{
        "name": name,
        "dateOfBirth": dob,

      });
      ApiChecker.checkApi(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        showCustomSnackBar("Profile updated successfully", isError: false);
        await getChildrenProfile();

        if (context.mounted) {
          Navigator.pop(context);
        }
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


  Future<void> childrenPickImageFromGallery({
    required String childId,
    required BuildContext context,
  }) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      FormData formData = FormData.fromMap({
        "profileImage": await MultipartFile.fromFile(image.path),
      });

      Response response = await userProfileManageRepo.updateChildProfileImage(
        childId,
        formData,
      );

      ApiChecker.checkApi(response);
      if (response.statusCode == 200) {
        showCustomSnackBar("Profile updated successfully", isError: false);
        await getChildrenProfile();

        if (context.mounted) {
          Navigator.pop(context);
        }
      }
    }
  }

  Future<void> childrenUploadAvatar({
    required String childId,
    required String assetPath,
  }) async {
    ByteData byteData = await rootBundle.load(assetPath);
    List<int> imageData = byteData.buffer.asUint8List();

    FormData formData = FormData.fromMap({
      "profileImage": MultipartFile.fromBytes(
        imageData,
        filename: assetPath.split("/").last,
      ),
    });

    Response response = await userProfileManageRepo.updateChildProfileImage(
      childId,
      formData,
    );

    if (response.statusCode == 200) {
      showCustomSnackBar("Avatar updated successfully", isError: false);
      await getChildrenProfile();
    }
  }

  List<NotificationItem> notifications = [
    NotificationItem(
      id: '1',
      message:
          'Hey Your Grandson Zoe Send You A Voice Note, Please Click To Hear The Voice Note!',
      category: 'voice_note',
      timestamp: '2h Ago',
      imagePath: ImagePaths.avatarProfile2,
      name: 'Sabbir',
      voicePath:
          '/data/user/0/com.example.gifting_app/app_flutter/voice_1765588225384.m4a',
    ),
    NotificationItem(
      id: '2',
      message: 'Grandma Debbie Contribute 10\$. Tap here to See..',
      category: 'contribute_alert',
      timestamp: '2h Ago',
      imagePath: ImagePaths.avatarProfile3,
      name: 'Sojib',
    ),
    NotificationItem(
      id: '3',
      message: 'Khaled ahmed nayeem wants to follow you!',
      category: 'follow_request',
      timestamp: '2h Ago',
      imagePath: ImagePaths.avatarProfile4,
      name: 'khaled',
    ),
  ];
}
