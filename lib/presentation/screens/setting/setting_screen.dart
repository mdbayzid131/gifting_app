import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:gifting_app/presentation/widgets/custom_elevated_button.dart';

import '../../../core/constants/app_color.dart';
import '../../../core/constants/image_paths.dart';
import '../../../routes/routes.dart';
import '../../widgets/customSettingButton.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_parent_profile.dart';
import '../../widgets/logout_popup.dart';
import '../auth_screen/login_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xffFD7839);
    return Scaffold(
      appBar: CustomWidgets.customAppBar(title: "Setting"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20.h),

            ///<================= MAIN PROFILE AVATAR =========================>///
            CustomParentProfile(imagePath: '',isShowPositioned: false,),

            SizedBox(height: 10.h),
            SizedBox(height: 38.h),
            CustomSettingButton(
              label: 'Support fAQ',
              imagePath: ImagePaths.supportfAQ,
              onPressed: () {
                Get.toNamed(RoutePages.supportFQA);
              },
            ),
            SizedBox(height: 12.h),
            CustomSettingButton(
              label: 'Community share This app ',
              imagePath: ImagePaths.community,
              onPressed: () {},
            ),
            SizedBox(height: 12.h),
            CustomSettingButton(
              label: 'Log out',
              imagePath: ImagePaths.logOut,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const LogoutPopup(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


