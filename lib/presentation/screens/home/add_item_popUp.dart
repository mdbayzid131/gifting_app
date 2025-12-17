import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_color.dart';
import '../../../core/constants/image_paths.dart';
import '../../../core/utils/app_dialog.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/contribute_controller.dart';
import '../../widgets/add_confirm_pop_up.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';

///<===================Wishlist Popup=========================>///
// class WishlistPopup {
//   static Future show(BuildContext context) {
//     return showGeneralDialog(
//       context: context,
//
//       ///<================= BARRIER SETTINGS =========================>///
//       barrierDismissible: true,
//       barrierLabel: "Dismiss",
//       barrierColor: Colors.black.withOpacity(0.4),
//
//       ///<================= ANIMATION DURATION =========================>///
//       transitionDuration: const Duration(milliseconds: 300),
//
//       ///<================= PAGE BUILDER =========================>///
//       pageBuilder: (context, animation, secondaryAnimation) {
//         return const _PopupBody();
//       },
//
//       ///<================= TRANSITION BUILDER =========================>///
//       transitionBuilder: (context, animation, secondaryAnimation, child) {
//         final slideAnimation = Tween<Offset>(
//           begin: const Offset(0, 1), // bottom → top
//           end: Offset.zero,
//         ).animate(
//           CurvedAnimation(
//             parent: animation,
//             curve: Curves.easeOutCubic,
//           ),
//         );
//
//         final fadeAnimation = Tween<double>(
//           begin: 0,
//           end: 1,
//         ).animate(animation);
//
//         return SlideTransition(
//           position: slideAnimation,
//           child: FadeTransition(
//             opacity: fadeAnimation,
//             child: child,
//           ),
//         );
//       },
//     );
//
//
//
//
//   }
// }

class PopupBody extends StatefulWidget {
  const PopupBody({super.key});

  @override
  State<PopupBody> createState() => _PopupBodyState();
}

class _PopupBodyState extends State<PopupBody>
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
        ///<===================Blur Background=========================>///
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Container(color: Colors.black45),
        ),

        ///<===================Popup Card=========================>///
        Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              width: 320.w,
              height: 580.h,
              padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 15.h),
              decoration: BoxDecoration(
                color: const Color(0xffFFFAF8),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                children: [
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

  ///<===================Tab Bar=========================>///
  Widget _tabBar() {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: TabBar(
        controller: _tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        indicator: BoxDecoration(
          color: const Color(0xffFFEC54),
          borderRadius: BorderRadius.circular(12.r),
        ),
        labelColor: Colors.black,
        tabs: const [
          Tab(text: 'Manual'),
          Tab(text: 'Automatic'),
        ],
      ),
    );
  }

  ///<===================Tab View=========================>///
  Widget _tabView() {
    return TabBarView(
      controller: _tabController,
      children: [
        _manualForm(),
        _automaticForm(),
      ],
    );
  }

  ///<===================Manual Form=========================>///
  Widget _manualForm() {
    return Form(
      key: _manualFormKey,
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _imagePicker(),
              SizedBox(height: 10.h),
          
              CustomTextField(
                label: 'Name',
                hintText: 'Enter your name',
                controller: _nameController,
                validator: _authController.validName,
              ),
          
              CustomTextField(
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^\d*\.?\d*'),
                  ),
                ],
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

          SizedBox(height: 20.h),

              Row(
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      label: 'Cancel',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize:
                        Size(double.infinity, 48.h),
                        backgroundColor:
                        const Color(0xffFDFCFA),
                        elevation: 0,
                        padding:  EdgeInsets.symmetric(
                          vertical: 10.h,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(10.r),
                          side: BorderSide(
                            color: AppColors.primary,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: CustomElevatedButton(
                      label: 'Confirm',
                      onPressed: () {
                        if (_manualFormKey.currentState!.validate()) {
                          AppDialog.show(context: context, child: const AddConfirmPopUp(),animation: DialogAnimation.fade);
                        }
                      },
                    ),
          
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///<===================Image Picker=========================>///
  Widget _imagePicker() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 120.h,
        width: 240.w,
        decoration: BoxDecoration(
          color: const Color(0xffFD7839),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(ImagePaths.selectImage),
            SizedBox(height: 6.h),
            const Text(
              'Select File',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  ///<===================Automatic Form=========================>///
  Widget _automaticForm() {
    return Form(
      key: _autoFormKey,
      child: Column(
        children: [
          CustomTextField(
            hintText: 'Provide your link',
            controller: _linkController,
            validator: _contributeController.validLink,
            label: '',
            isLabelVisible: false,
          ),

          const Spacer(),

          Row(
            children: [
              Expanded(
                child: CustomElevatedButton(
                  label: 'Cancel',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                    Size(double.infinity, 48.h),
                    backgroundColor:
                    const Color(0xffFDFCFA),
                    elevation: 0,
                    padding:  EdgeInsets.symmetric(
                      vertical: 10.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(10.r),
                      side: BorderSide(
                        color: AppColors.primary,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: CustomElevatedButton(
                  label: 'Confirm',
                  onPressed: () {
                    if (_autoFormKey.currentState!.validate()) {
                      AppDialog.show(context: context, child: const AddConfirmPopUp(),animation: DialogAnimation.fade);
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
