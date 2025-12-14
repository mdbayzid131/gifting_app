import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/image_paths.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_elevated_button.dart';
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
                    Container(
                      height: 90.w,
                      width: 90.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xffFD7839),
                          width: 1.5,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Center(
                            child: CircleAvatar(
                              radius: 50.r,
                              backgroundImage:
                              AssetImage(ImagePaths.settingPp),
                            ),
                          ),

                          ///<================= CAMERA BUTTON =========================>///
                          Positioned(
                            bottom: -2.h,
                            right: -2.w,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(50.r),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => UploadPicturePopup(),
                                );
                              },
                              child: Container(
                                height: 30.w,
                                width: 30.w,
                                decoration: BoxDecoration(
                                  color: const Color(0xffEBE9E9),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xffFD7839),
                                    width: 1.4,
                                  ),
                                ),
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  size: 17.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
