import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/contribute_controller.dart';
import 'custom_elevated_button.dart';
import 'custom_text_field.dart';

///<===================Contribute Popup=========================>///
class ContributePopup extends StatelessWidget {
  ContributePopup({super.key});

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
                          child:  Icon(
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
                        value: _controller.selectedRelation.value.isEmpty
                            ? null
                            : _controller.selectedRelation.value,
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
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: const Color(0xff333333),
                        ),
                        hint: Text(
                          "Select Relation with child",
                          style: TextStyle(
                            color: const Color(0xff333333),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        style: TextStyle(
                          color: const Color(0xff333333),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        items: _controller.relations
                            .map((relation) => DropdownMenuItem(
                          value: relation,
                          child: Text(relation),
                        ))
                            .toList(),
                        onChanged: (value) =>
                        _controller.selectedRelation.value = value!,
                        validator: (value) =>
                        value == null ? "Please select a relation" : null,
                      ),
                    ),

                    SizedBox(height: 12.h),

                    ///<===================Amount Text Field=========================>///
                    CustomTextField(
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
