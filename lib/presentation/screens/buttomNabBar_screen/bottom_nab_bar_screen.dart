import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/image_paths.dart';
import '../../controllers/bottom_nab_bar_controller.dart';
import '../../widgets/custom_buttom_nab_bar.dart';

class BottomNabBarScreen extends StatefulWidget {
  const BottomNabBarScreen({super.key});

  @override
  State<BottomNabBarScreen> createState() => _BottomNabBarScreenState();
}

class _BottomNabBarScreenState extends State<BottomNabBarScreen> {
  final BottomNabBarController _controller = Get.find<BottomNabBarController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _controller.pages[_controller.currentIndex.value]),

      bottomNavigationBar: Obx(
        () => SafeArea(
          child: CustomBottomNavBar(
            currentIndex: _controller.currentIndex.value,
            onTap: (index) {
                _controller.currentIndex.value = index;
            },
          ),
        ),
      ),
    );
  }
}
