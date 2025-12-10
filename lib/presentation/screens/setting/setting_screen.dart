import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:gifting_app/presentation/widgets/custom_elevated_button.dart';

import '../../../core/constants/app_color.dart';
import '../../../core/constants/image_paths.dart';
import '../../../routes/routes.dart';
import '../../widgets/customSettingButton.dart';
import '../../widgets/custom_appbar.dart';
import '../auth_screen/login_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidgets.customAppBar(title: "Setting"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
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
                        onTap: () {},

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
                          child: SvgPicture.asset(
                            ImagePaths.cameraIcon,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'john doe',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff444444),
                ),
              ),
            ),
            SizedBox(height: 38),
            CustomSettingButton(
              label: 'Support fAQ',
              imagePath: ImagePaths.supportfAQ,
              onPressed: () {
                Get.toNamed(RoutePages.supportFQA);
              },
            ),
            SizedBox(height: 12),
            CustomSettingButton(
              label: 'Community share This app ',
              imagePath: ImagePaths.community,
              onPressed: () {},
            ),
            SizedBox(height: 12),
            CustomSettingButton(
              label: 'Log out',
              imagePath: ImagePaths.logOut,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}


