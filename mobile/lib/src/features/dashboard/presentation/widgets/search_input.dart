import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/app_light_theme_colors.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/theme/dark_theme_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:math' as math;

class TopBarSearchInput extends StatelessWidget {
  const TopBarSearchInput(
      {super.key, this.sideContainerColor, this.sideCotainerTextColor, this.searchBackgroundColor});

  final Color? sideContainerColor;
  final Color? sideCotainerTextColor;
  final Color? searchBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 5.h,
            decoration: BoxDecoration(
              color: searchBackgroundColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: TextField(
              style: const TextStyle(color: AppLightThemeColors.kBlackColor),
              decoration: InputDecoration(
                hintText: 'Search address, city, location',
                hintStyle: TextStyle(
                    fontSize: 16.sp,
                    color: AppCommonColors.textFieldTextColor,
                    fontWeight: FontWeight.w400),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/search_icon.png',
                    height: 2.6.h,
                  ),
                ),
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 10,
                ),
                border: InputBorder.none,
                contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
              ),
            ),
          ),
        ),
        SizedBox(width: 2.w),
        Container(
          height: 5.h,
          width: 10.w,
          decoration: BoxDecoration(
            color:
            sideContainerColor ?? Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Transform.rotate(
            angle: 90 * math.pi / 180,
            child: Icon(
              Icons.tune,
              size: 3.h,
              color: sideCotainerTextColor ?? AppDarkThemeColors.mainDarkMode,
            ),
          ),
        ),
      ],
    );
  }
}