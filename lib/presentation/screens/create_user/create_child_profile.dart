import 'package:flutter/material.dart';
import 'package:gifting_app/presentation/widgets/custom_elevated_button.dart';
import 'package:gifting_app/presentation/widgets/custom_text_field.dart';

import '../../widgets/custom_appbar.dart';

class CreateChildProfile extends StatefulWidget {
  const CreateChildProfile({super.key});

  @override
  State<CreateChildProfile> createState() => _CreateChildProfileState();
}

class _CreateChildProfileState extends State<CreateChildProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidgets.customAppBar(title: 'Create Profile'),
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
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Color(0xffFD7839),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Icon(Icons.add, color: Color(0xffffffff), size: 30),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Add profile picture',
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
              CustomElevatedButton(label: "Create", onPressed: () {
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
