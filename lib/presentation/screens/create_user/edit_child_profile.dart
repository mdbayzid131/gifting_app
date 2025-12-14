import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gifting_app/presentation/widgets/custom_elevated_button.dart';
import 'package:gifting_app/presentation/widgets/custom_text_field.dart';

import '../../../core/constants/image_paths.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/uplode_picture_popup.dart';

class EditChildProfile extends StatefulWidget {
  const EditChildProfile({super.key});

  @override
  State<EditChildProfile> createState() => _EditChildProfileState();
}

class _EditChildProfileState extends State<EditChildProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidgets.customAppBar(title: 'Edit Profile'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: .center,
                children: [
                  Center(
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffFD7839), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Center(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(ImagePaths.settingPp),
                            ),
                          ),
                          Positioned(
                            bottom: -1,
                            right: 0,
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => UploadPicturePopup(),
                                );
                              },

                              ///=======================
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xffFD7839),
                                    width: 1.5,
                                  ),
                                  color: const Color(0xffEBE9E9),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Icon(Icons.camera_alt_outlined,color: Colors.black,size: 17.sp
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Jhon Doe',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff444444),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              CustomTextField(hintText: 'Enter your child name ', label: 'Name',controller: nameController),
              SizedBox(height: 20),
              CustomTextField(hintText: 'Enter your child age ', label: 'Age',controller: ageController),
              SizedBox(height: 20),
              CustomElevatedButton(label: "Save Changes", onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In a real app,
                  // you'd often call a server or save the information in a database.
                }
                Navigator.pop(context);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
