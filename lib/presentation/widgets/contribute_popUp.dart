import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:gifting_app/presentation/widgets/custom_text_field.dart';

import '../controllers/contribute_controller.dart';
import 'custom_elevated_button.dart';

class ContributePopup extends StatelessWidget {
  ContributePopup({super.key});
  final ContributeController _controller = Get.find<ContributeController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _relationController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// 🔥 Blur Background
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(color: Colors.black.withOpacity(0.4)),
        ),

        /// 🔥 Popup Card
        Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              width: 320.w,
              height: 320.h,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xffFFFAF8),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
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
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.close,
                            size: 20,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),

                     SizedBox(height: 10.sp),

                    // -------------------------------
                    // Relation DROPDOWN
                    // -------------------------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Relation',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: Color(0xff333333),
                            height: 1.6.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Obx(
                      () => DropdownButtonFormField<String>(
                        initialValue: _controller.selectedRelation.value.isEmpty
                            ? null
                            : _controller.selectedRelation.value,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xffEDE8FC),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 16.h,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Color(0xff333333),
                        ),
                        hint: Text(
                          "Select Relation with child ",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 12.sp,
                            height: 1.6.h,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        style: TextStyle(
                          color: Color(0xff333333),
                          fontSize: 12.sp,
                          height: 1.6.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        items: _controller.relations.map((relation) {
                          return DropdownMenuItem(
                            value: relation,
                            child: Text(relation),
                          );
                        }).toList(),
                        onChanged: (value) {
                          _controller.selectedRelation.value = value!;
                        },
                        validator: (value) =>
                            value == null ? "Please select a relation" : null,
                      ),
                    ),

                    SizedBox(height: 10.h),
                    CustomTextField(
                      hintText: "Enter Contribution Amount in \$",
                      label: 'Amount',
                      validator: _controller.amountValidate,
                    ),
                    SizedBox(height: 10.h),
                    CustomElevatedButton(label: 'Contribute', onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pop(context);
                      }
                    }),
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
