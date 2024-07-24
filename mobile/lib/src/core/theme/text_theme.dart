import 'package:flutter/material.dart';
import 'package:mobile/gen/fonts.gen.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextStyles {
  static TextTheme 
  kDefaultTextTheme(Color textColor) => TextTheme(
    bodySmall: TextStyle(
      color: AppCommonColors.detailsDirtyWhiteTextColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      fontFamily: FontFamily.nunito,
    ),
    bodyMedium: TextStyle(
      color: textColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      fontFamily: FontFamily.nunito,
    ),
    titleLarge: TextStyle(
      color: textColor,
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      fontFamily: FontFamily.montserrat,
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
    headlineSmall: TextStyle(
      color: textColor,
      fontSize: 15.sp,
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.raleway,
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
