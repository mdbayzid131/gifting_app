import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gifting_app/presentation/controllers/auth_controller.dart';
import 'package:gifting_app/presentation/widgets/custom_date_picker.dart';
import 'package:gifting_app/presentation/widgets/custom_parent_profile.dart';

import '../../../core/constants/image_paths.dart';
import '../../../core/utils/app_dialog.dart';
import '../../../routes/routes.dart';
import '../../controllers/homepgeController.dart';
import '../../widgets/child_create_uplode_picture_popup.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/uplode_picture_popup.dart';

class CreateChildProfile extends StatefulWidget {
  const CreateChildProfile({super.key});

  @override
  State<CreateChildProfile> createState() => _CreateChildProfileState();
}

class _CreateChildProfileState extends State<CreateChildProfile> {
  ///<================= CONTROLLERS =========================>///
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final AuthController authController = Get.find<AuthController>();
  final HomePageController homePageController = Get.find<HomePageController>();

  ///<================= FORM KEY =========================>///
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ///<================= CONSTANT COLOR =========================>///
  static const Color primaryColor = Color(0xffFD7839);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidgets.customAppBar(title: 'Create Profile'),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 24.h),

                ///<================= PROFILE IMAGE SECTION =========================>///
                Column(
                  children: [
                    Center(
                      child: CustomParentProfile(
                        imagePath: ImagePaths.avatarProfile3,
                        isShowImagePicker: true,
                        onEditTap: () {
                          AppDialog.show(
                            context: context,
                            child: ChildCreateUplodePicturePopup(),
                            animation: DialogAnimation.fade,
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 10.h),

                    Text(
                      'Add profile picture',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff444444),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30.h),

                ///<================= NAME FIELD =========================>///
                CustomTextField(
                  label: 'Name',
                  hintText: 'Enter your child name',
                  controller: nameController,
                  validator: authController.validName,
                ),

                SizedBox(height: 20.h),

                ///<================= AGE FIELD =========================>///
                CustomDatePickerField(
                  hintText: 'Select your child date of birth',
                  label: 'Date of Birth',
                  controller: ageController,
                  validator: authController.validDOB,
                ),

                SizedBox(height: 30.h),

                ///<================= CREATE BUTTON =========================>///
                Obx(
                  ()=> CustomElevatedButton(
                    isLoading: homePageController.isLoading.value,
                    label: "Create",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {


                        homePageController.childrenCreateChildrenProfile(
                          context: context,
                          dob: ageController.text,
                          name: nameController.text,
                        );
                      }


                    },
                  ),
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }
}
