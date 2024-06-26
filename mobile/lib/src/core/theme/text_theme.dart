import 'package:flutter/material.dart';
import 'package:mobile/gen/fonts.gen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextStyles {
  static TextTheme kDefaultTextTheme(Color textColor) => TextTheme(
        bodyMedium: TextStyle(
          color: textColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          fontFamily: FontFamily.nunito,
        ),
      );
}
