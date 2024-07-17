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
    displaySmall: TextStyle(
      color: textColor,
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.nunito,
    ),
    displayMedium: TextStyle(
      color: textColor,
      fontSize: 23.sp,
      fontWeight: FontWeight.w700,
      fontFamily: FontFamily.nunito,
    ),
    labelMedium: TextStyle(
      color: textColor,
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      fontFamily: FontFamily.nunito,
    ),
    labelSmall: TextStyle(
      color: textColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      fontFamily: FontFamily.nunito,
    ),
    headlineMedium: TextStyle( 
      color: textColor,
      fontSize: 15.sp,
      fontWeight: FontWeight.w400,
      fontFamily: FontFamily.nunito,
    ),

  );
}
