import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/common_color.dart';

class AuthTextFormField extends StatelessWidget {
  final TextEditingController firstNameController;

  final IconData icon;
  final String labelText;
  final String? Function(String?) validator;
  final Widget? suffixIcon;

  final bool obscureText;

  const AuthTextFormField({
    super.key,
    required this.firstNameController,
    required this.icon,
    required this.labelText,
    required this.validator,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      style: const TextStyle(color: Colors.black),
      controller: firstNameController,
      validator: validator,
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
    );
  }
}
