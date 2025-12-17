import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/image_paths.dart';
import '../../../core/utils/app_dialog.dart';
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 24.h),

                ///<================= PROFILE IMAGE =========================>///
                Column(
                  children: [
                    CustomParentProfile(
                      imagePath: '',
                      isShowImagePicker: true,
                      onEditTap: () {
                        AppDialog.show(
                          context: context,
                          child: UploadPicturePopup(),
                          animation: DialogAnimation.fade,
                        );
                      },
                    ),

                    SizedBox(height: 12.h),

                    ///<================= USER NAME =========================>///
                    Text(
                      'Jhon Doe',
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
                ),

                SizedBox(height: 40.h),

                ///<================= SAVE BUTTON =========================>///
                CustomElevatedButton(
                  label: "Save Changes",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context);
                    }
                  },
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
