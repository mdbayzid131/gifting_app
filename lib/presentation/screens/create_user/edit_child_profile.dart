import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:gifting_app/presentation/controllers/auth_controller.dart';
import 'package:gifting_app/presentation/controllers/homepgeController.dart';
import 'package:gifting_app/presentation/widgets/custom_elevated_button.dart';
import 'package:gifting_app/presentation/widgets/custom_parent_profile.dart';
import 'package:gifting_app/presentation/widgets/custom_text_field.dart';

import '../../../core/constants/image_paths.dart';
import '../../../core/utils/app_dialog.dart';
import '../../widgets/child_avatar_profile-popup.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_date_picker.dart';
import '../../widgets/uplode_picture_popup.dart';

class EditChildProfile extends StatefulWidget {
  final String childId;
  final String name;
  final String image;
  const EditChildProfile({
    super.key,
    required this.childId,
    required this.name,
    required this.image,
  });

  @override
  State<EditChildProfile> createState() => _EditChildProfileState();
}

class _EditChildProfileState extends State<EditChildProfile> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AuthController authController = Get.find<AuthController>();
  final HomePageController homePageController = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidgets.customAppBar(title: 'Edit Profile'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ///================ PROFILE =================//
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomParentProfile(
                    imagePath: widget.image,
                    isNetworkImage: true,
                    isShowImagePicker: true,
                    onEditTap: () {
                      AppDialog.show(
                        context: context,
                        child: CustomUploadPicturePopup(
                          galleryUpload: () {
                            homePageController.childrenPickImageFromGallery(
                              childId: widget.childId,
                              context: context,
                            );
                          },
                          choseAvatar: () {
                            Get.back();
                            AppDialog.show(
                              context: context,
                              child: ChildAvatarProfilePopup(
                                childId: widget.childId,
                              ),
                              animation: DialogAnimation.fade,
                            );
                          },
                        ),
                        animation: DialogAnimation.fade,
                      );
                    },
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff444444),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),

              ///================ NAME FIELD =================//
              CustomTextField(
                hintText: 'Enter your child name',
                label: 'Name',
                controller: nameController,
                validator: authController.validName,
              ),
              SizedBox(height: 20.h),

              ///================ AGE FIELD =================//
              CustomDatePickerField(
                validator: authController.validDOB,
                hintText: "Select your date of birth",
                label: "Date of Birth",
                controller: dobController,
              ),

              SizedBox(height: 30.h),

              ///================ SAVE BUTTON =================//
              CustomElevatedButton(
                label: "Save Changes",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    homePageController.updateChildrenProfile(
                      childId: widget.childId,
                      context: context,
                      name: nameController.text,
                      dob: dobController.text,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
