import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gifting_app/presentation/widgets/custom_elevated_button.dart';
import 'package:gifting_app/presentation/widgets/custom_parent_profile.dart';
import 'package:gifting_app/presentation/widgets/custom_text_field.dart';

import '../../../core/constants/image_paths.dart';
import '../../../core/utils/app_dialog.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/uplode_picture_popup.dart';

class EditChildProfile extends StatefulWidget {
  const EditChildProfile({super.key});

  @override
  State<EditChildProfile> createState() => _EditChildProfileState();
}

class _EditChildProfileState extends State<EditChildProfile> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                    imagePath: ImagePaths.avatarProfile3,
                    isShowImagePicker: true,
                    onEditTap: () {
                      AppDialog.show(
                        context: context,
                        child: UploadPicturePopup(),
                        animation: DialogAnimation.fade,
                      );
                    },
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Jhon Doe',
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
              ),
              SizedBox(height: 20.h),

              ///================ AGE FIELD =================//
              CustomTextField(
                hintText: 'Enter your child age',
                label: 'Age',
                controller: ageController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
              ),
              SizedBox(height: 30.h),

              ///================ SAVE BUTTON =================//
              CustomElevatedButton(
                label: "Save Changes",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save logic
                  }
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
