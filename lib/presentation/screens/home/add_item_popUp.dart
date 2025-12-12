import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../../../core/constants/image_paths.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/contribute_controller.dart';
import '../../widgets/add_confirm_pop_up.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';

class WishlistPopup {
  static Future show(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const _PopupBody(),
    );
  }
}

class _PopupBody extends StatefulWidget {
  const _PopupBody();

  @override
  State<_PopupBody> createState() => _PopupBodyState();
}

class _PopupBodyState extends State<_PopupBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _manualFormKey = GlobalKey<FormState>();
  final _autoFormKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descController = TextEditingController();
  final _linkController = TextEditingController();

  final _authController = Get.find<AuthController>();
  final _contributeController = Get.find<ContributeController>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _nameController.dispose();
    _priceController.dispose();
    _descController.dispose();
    _linkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Blur background
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Container(color: Colors.black45),
        ),

        Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              width: 320.w,
              height: 580.h,
              decoration: BoxDecoration(
                color: const Color(0xffFFFAF8),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.fromLTRB(10.w, 5.h, 10.w, 10.w),
              child: Column(
                children: [
                  _closeButton(),
                  _tabBar(),
                  SizedBox(height: 16.h),
                  Expanded(child: _tabView()),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _closeButton() {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Icon(Icons.close, color: Colors.red),
      ),
    );
  }

  Widget _tabBar() {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TabBar(
        controller: _tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        indicator: BoxDecoration(
          color: Color(0xffFFEC54),
          borderRadius: BorderRadius.circular(12),
        ),
        labelColor: Colors.black,
        tabs: const [
          Tab(text: 'Manual'),
          Tab(text: 'Automatic'),
        ],
      ),
    );
  }

  Widget _tabView() {
    return TabBarView(
      controller: _tabController,
      children: [
        _manualForm(),
        _automaticForm(),
      ],
    );
  }

  /// ---------------- Manual ----------------
  Widget _manualForm() {
    return Form(
      key: _manualFormKey,
      child: Column(
        children: [
          _imagePicker(),
          SizedBox(height: 10),

          CustomTextField(
            label: 'Name',
            hintText: 'Enter your name',
            controller: _nameController,
            validator: _authController.validName,
          ),

          CustomTextField(
            label: 'Price',
            hintText: 'Enter amount',
            controller: _priceController,
            validator: _contributeController.amountValidate,
          ),

          CustomTextField(
            label: 'Description',
            hintText: 'Type here...',
            maxLines: 3,
            controller: _descController,
            validator: (v) =>
            v == null || v.isEmpty ? 'Description required' : null,
          ),

          const Spacer(),

          CustomElevatedButton(
            label: 'Confirm',
            onPressed: () {
              if (_manualFormKey.currentState!.validate()) {
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (context) => AddConfirmPopUp()
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _imagePicker() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 120.h,
        width: 240.w,
        decoration: BoxDecoration(
          color: const Color(0xffFD7839),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(ImagePaths.selectImage),
            const SizedBox(height: 6),
            const Text(
              'Select File',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  /// ---------------- Automatic ----------------
  Widget _automaticForm() {
    return Form(
      key: _autoFormKey,
      child: Column(
        children: [
          CustomTextField(
            hintText: 'Provide your link',
            controller: _linkController,
            validator: _contributeController.validLink, label: '',isLabelVisible: false,
          ),

          const Spacer(),

          CustomElevatedButton(
            label: 'Confirm',
            onPressed: () {
              if (_autoFormKey.currentState!.validate()) {
                Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (context) => AddConfirmPopUp()
                  );

              }
            },
          ),
        ],
      ),
    );
  }
}
