import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/contribute_controller.dart';
import 'custom_elevated_button.dart';
import 'custom_text_field.dart';

class ContributePopup {
  static Future show(BuildContext context) {
    return showGeneralDialog(
      context: context,

      ///<================= BARRIER SETTINGS =========================>///
      barrierDismissible: true,
      barrierLabel: "Dismiss",
      barrierColor: Colors.black.withOpacity(0.4),

      ///<================= ANIMATION DURATION =========================>///
      transitionDuration: const Duration(milliseconds: 300),

      ///<================= PAGE BUILDER =========================>///
      pageBuilder: (context, animation, secondaryAnimation) {
        return _ContributePopup();
      },

      ///<================= TRANSITION BUILDER =========================>///
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final slideAnimation =
            Tween<Offset>(
              begin: const Offset(0, 1), // bottom → top
              end: Offset.zero,
            ).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
            );

        final fadeAnimation = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(animation);

        return SlideTransition(
          position: slideAnimation,
          child: FadeTransition(opacity: fadeAnimation, child: child),
        );
      },
    );
  }
}

///<===================Contribute Popup=========================>///
class _ContributePopup extends StatelessWidget {
  _ContributePopup({super.key});

  final ContributeController _controller = Get.find<ContributeController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ///<===================Blur Background=========================>///
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(color: Colors.black.withOpacity(0.4)),
        ),

        ///<===================Popup Card=========================>///
        Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              width: 320.w,
              padding: EdgeInsets.all(15.w),
              decoration: BoxDecoration(
                color: const Color(0xffFFFAF8),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ///<===================Header=========================>///
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Contribute',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.close,
                            size: 20.sp,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 15.h),

                    ///<===================Relation Dropdown Label=========================>///
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Relation',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: const Color(0xff333333),
                          height: 1.6,
                        ),
                      ),
                    ),

                    SizedBox(height: 8.h),

                    ///<===================Relation Dropdown=========================>///
                    Obx(
                      () => DropdownButtonFormField<String>(
                        dropdownColor: const Color(0xffFFFAF8),
                        initialValue: _controller.selectedRelation.value.isEmpty
                            ? null
                            : _controller.selectedRelation.value,

                        ///<================= DECORATION =========================>///
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xffEDE8FC),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 14.h,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide.none,
                          ),
                        ),

                        ///<================= ICON =========================>///
                        icon: const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Color(0xff333333),
                        ),

                        ///<================= HINT =========================>///
                        hint: Text(
                          "Select Relation with child",
                          style: TextStyle(
                            color: const Color(0xff333333),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        ///<================= SELECTED VALUE STYLE =========================>///
                        style: TextStyle(
                          color: const Color(0xff333333),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),

                        ///<================= DROPDOWN ITEMS =========================>///
                        items: _controller.relations.map((relation) {
                          return DropdownMenuItem<String>(
                            value: relation,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 26.h,
                                  width: 26.h,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffEDE8FC),
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: Icon(
                                    Icons.family_restroom_rounded,
                                    size: 16.sp,
                                    color: const Color(0xff5B4DB7),
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                Text(
                                  relation,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff333333),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),

                        ///<================= ON CHANGE =========================>///
                        onChanged: (value) {
                          _controller.selectedRelation.value = value!;
                        },

                        ///<================= VALIDATOR =========================>///
                        validator: (value) =>
                            value == null ? "Please select a relation" : null,
                      ),
                    ),

                    SizedBox(height: 12.h),

                    ///<===================Amount Text Field=========================>///
                    CustomTextField(
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*\.?\d*'),
                        ),
                      ],
                      hintText: "Enter Contribution Amount in \$",
                      label: 'Amount',
                      validator: _controller.amountValidate,
                      controller: _amountController,
                    ),

                    SizedBox(height: 15.h),

                    ///<===================Contribute Button=========================>///
                    CustomElevatedButton(
                      label: 'Contribute',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
