import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
<<<<<<< HEAD
=======
import 'package:gifting_app/presentation/controllers/auth_controller.dart';
import 'package:gifting_app/presentation/widgets/custom_date_picker.dart';
>>>>>>> api-integration
import 'package:gifting_app/presentation/widgets/custom_parent_profile.dart';

import '../../../core/constants/image_paths.dart';
import '../../../core/utils/app_dialog.dart';
import '../../../routes/routes.dart';
<<<<<<< HEAD
=======
import '../../controllers/homepgeController.dart';
import '../../widgets/child_create_uplode_picture_popup.dart';
>>>>>>> api-integration
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
<<<<<<< HEAD
=======
  final AuthController authController = Get.find<AuthController>();
  final HomePageController homePageController = Get.find<HomePageController>();
>>>>>>> api-integration

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
<<<<<<< HEAD
                      child: CustomParentProfile(imagePath: ImagePaths.avatarProfile3,isShowImagePicker: true,onEditTap: (){
                        AppDialog.show(
                          context: context,
                          child: UploadPicturePopup(),
                          animation: DialogAnimation.fade,
                        );
                      },),
=======
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
>>>>>>> api-integration
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
<<<<<<< HEAD
=======
                  validator: authController.validName,
>>>>>>> api-integration
                ),

                SizedBox(height: 20.h),

                ///<================= AGE FIELD =========================>///
<<<<<<< HEAD
                CustomTextField(
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'^\d*\.?\d*'),
                    ),
                  ],
                  label: 'Age',
                  hintText: 'Enter your child age',
                  controller: ageController,
=======
                CustomDatePickerField(
                  hintText: 'Select your child date of birth',
                  label: 'Date of Birth',
                  controller: ageController,
                  validator: authController.validDOB,
>>>>>>> api-integration
                ),

                SizedBox(height: 30.h),

                ///<================= CREATE BUTTON =========================>///
<<<<<<< HEAD
                CustomElevatedButton(
                  label: "Create",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      /// TODO: Save profile data
                      Get.back();
                    }
                  },
=======
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
>>>>>>> api-integration
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
