import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../core/constants/image_paths.dart';
import '../../../core/utils/app_dialog.dart';
import '../../../data/models/user_profile_model.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/homepgeController.dart';
import '../../widgets/avatar_profile_popup.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_parent_profile.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/uplode_picture_popup.dart';

class EditParentProfile extends StatefulWidget {
  const EditParentProfile({super.key});

  @override
  State<EditParentProfile> createState() => _EditParentProfileState();
}

class _EditParentProfileState extends State<EditParentProfile> {
  ///<================= CONTROLLERS =========================>///
  final TextEditingController nameController = TextEditingController();

  ///<================= FORM KEY =========================>///
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final HomePageController homePageController = Get.find<HomePageController>();
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidgets.customAppBar(title: 'Edit Parent Profile'),

      ///<================= BODY =========================>///
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: Obx(() {
              final UserProfileModel? prentData =
                  homePageController.profile.value;
              if (prentData == null) {
                return const Center(child: CircularProgressIndicator());
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 24.h),

                  ///<================= PROFILE IMAGE =========================>///
                  Column(
                    children: [
                      CustomParentProfile(
                        imagePath: prentData.profilePicture,
                        isNetworkImage: true,
                        isShowImagePicker: true,
                        onEditTap: () {
                          AppDialog.show(
                            context: context,
                            child: CustomUploadPicturePopup(
                              galleryUpload: () {
                                homePageController.pickImageFromGallery(
                                  context,
                                );
                              }, choseAvatar: () {
                                 Get.back();
                                AppDialog.show(context: context, child: AvatarProfilePopup(),animation: DialogAnimation.fade);
                            },
                            ),
                            animation: DialogAnimation.fade,
                          );
                        },
                      ),

                      SizedBox(height: 12.h),

                      ///<================= USER NAME =========================>///
                      Text(
                        prentData.name,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff444444),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 32.h),

                  ///<================= NAME FIELD =========================>///
                  CustomTextField(
                    hintText: 'Update your name',
                    label: 'Name',
                    controller: nameController,
                    validator: authController.validName,
                  ),

                  SizedBox(height: 40.h),

                  ///<================= SAVE BUTTON =========================>///
                  CustomElevatedButton(
                    label: "Save Changes",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        homePageController.updateProfile(
                          name: nameController.text,
                          context: context,
                        );
                      }
                    },
                  ),

                  SizedBox(height: 20.h),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
