import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String label;
  final TextEditingController? controller;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final Widget?  prefixIcon;
  final Widget?  suffixIcon;
  final bool?  isLabelVisible;
  final int?  maxLines;
  final bool?  readOnly;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.label,
    this.controller,
    this.obscureText,
    this.validator, this.prefixIcon, this.suffixIcon, this.isLabelVisible=true, this.maxLines, this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isLabelVisible == true)
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xff333333),
              height: 1.6,
            ),
          ),
        SizedBox(height: 6),
        TextFormField(
          readOnly: readOnly ?? false,
          maxLines: maxLines ?? 1,
          controller: controller,
          validator: validator,
          obscureText: obscureText ?? false,
          style: TextStyle(color: Color(0xff333333), fontSize: 12, height: 1.6,fontWeight: FontWeight.w400),

          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Color(0xff333333),
              fontSize: 12,
              height: 1.6,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),

              borderSide: BorderSide.none,
            ),
            // prefixIcon: Icon(prefixIcon, color: Color(0xff909090), size: 18),
            // suffixIcon: Icon(suffixIcon, color: Color(0xff909090), size: 18),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,

            filled: true,
            fillColor: Color(0xffEDE8FC),
          ),
        ),
      ],
    );
  }
}
