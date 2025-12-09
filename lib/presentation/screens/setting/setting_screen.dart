import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/image_paths.dart';
import '../../widgets/custom_appbar.dart';

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
      body: Column(
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
                        ImagePaths.cameraIcon,fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Center(child: Text('jhon doe', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xff444444),),))
        ],
      ),
    );
  }
}
