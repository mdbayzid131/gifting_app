import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/constants/image_paths.dart';

class CreateProfileController extends GetxController{
  final ImagePicker _picker = ImagePicker();


  Rx<File?> selectedImage = Rx<File?>(null);

  final RxList<String> avatarList = RxList<String>([
    ImagePaths.avatarProfile1,
    ImagePaths.avatarProfile2,
    ImagePaths.avatarProfile3,
    ImagePaths.avatarProfile4,
    ImagePaths.avatarProfile1,
    ImagePaths.avatarProfile2,
    ImagePaths.avatarProfile3,
    ImagePaths.avatarProfile4,
  ]);
  Rx<String> selectedAvatar = Rx<String>(ImagePaths.avatarProfile1);



  Future<void> pickFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  //
  Future<void> pickFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  //
  void removeImage() {
    selectedImage.value = null;
  }



}