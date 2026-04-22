import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
<<<<<<< HEAD
=======
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:gifting_app/presentation/controllers/auth_controller.dart';
import 'package:gifting_app/presentation/controllers/homepgeController.dart';
>>>>>>> api-integration
import 'package:gifting_app/presentation/widgets/custom_elevated_button.dart';
import 'package:gifting_app/presentation/widgets/custom_parent_profile.dart';
import 'package:gifting_app/presentation/widgets/custom_text_field.dart';

import '../../../core/constants/image_paths.dart';
import '../../../core/utils/app_dialog.dart';
<<<<<<< HEAD
import '../../widgets/custom_appbar.dart';
import '../../widgets/uplode_picture_popup.dart';

class EditChildProfile extends StatefulWidget {
  const EditChildProfile({super.key});
=======
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
>>>>>>> api-integration

  @override
  State<EditChildProfile> createState() => _EditChildProfileState();
}

class _EditChildProfileState extends State<EditChildProfile> {
  final TextEditingController nameController = TextEditingController();
<<<<<<< HEAD
  final TextEditingController ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
=======
  final TextEditingController dobController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AuthController authController = Get.find<AuthController>();
  final HomePageController homePageController = Get.find<HomePageController>();
>>>>>>> api-integration

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
<<<<<<< HEAD
                    imagePath: ImagePaths.avatarProfile3,
=======
                    imagePath: widget.image,
                    isNetworkImage: true,
>>>>>>> api-integration
                    isShowImagePicker: true,
                    onEditTap: () {
                      AppDialog.show(
                        context: context,
<<<<<<< HEAD
                        child: UploadPicturePopup(),
=======
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
>>>>>>> api-integration
                        animation: DialogAnimation.fade,
                      );
                    },
                  ),
                  SizedBox(height: 10.h),
                  Text(
<<<<<<< HEAD
                    'Jhon Doe',
=======
                    widget.name,
>>>>>>> api-integration
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
<<<<<<< HEAD
=======
                validator: authController.validName,
>>>>>>> api-integration
              ),
              SizedBox(height: 20.h),

              ///================ AGE FIELD =================//
<<<<<<< HEAD
              CustomTextField(
                hintText: 'Enter your child age',
                label: 'Age',
                controller: ageController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
              ),
=======
              CustomDatePickerField(
                validator: authController.validDOB,
                hintText: "Select your date of birth",
                label: "Date of Birth",
                controller: dobController,
              ),

>>>>>>> api-integration
              SizedBox(height: 30.h),

              ///================ SAVE BUTTON =================//
              CustomElevatedButton(
                label: "Save Changes",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
<<<<<<< HEAD
                    // Save logic
                  }
                  Navigator.pop(context);
=======
                    homePageController.updateChildrenProfile(
                      childId: widget.childId,
                      context: context,
                      name: nameController.text,
                      dob: dobController.text,
                    );
                  }
>>>>>>> api-integration
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
