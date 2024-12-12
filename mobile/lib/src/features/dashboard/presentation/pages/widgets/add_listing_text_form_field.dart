import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/theme/common_color.dart';

class AddListingTextFormField extends StatelessWidget {
  final TextEditingController inputController;

  final IconData? icon;
  final String labelText;
  final String? Function(String?) validator;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? inputType;
  final double? width;

  const AddListingTextFormField({
    super.key,
    required this.inputController,
    this.icon,
    required this.labelText,
    required this.validator,
    this.inputType,
    this.suffixIcon,
    this.obscureText = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?? 75.w,
        child: TextFormField(
          obscureText: obscureText,
          style: const TextStyle(color: Colors.black),
          controller: inputController,
          validator: validator,
          keyboardType: inputType,
          decoration: InputDecoration(
            labelText: labelText,
            suffixIcon: suffixIcon,
            labelStyle:
            TextStyle(color: AppCommonColors.fieldBorderColor, fontSize: 15.sp),
            prefixIcon: Icon(
              icon,
              color: AppCommonColors.fieldBorderColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 0.5,
                color: AppCommonColors.fieldBorderColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: AppCommonColors.fieldBorderColor, width: 0.5),
              gapPadding: 10,
            ),
          ),
        )
    );
  }
}