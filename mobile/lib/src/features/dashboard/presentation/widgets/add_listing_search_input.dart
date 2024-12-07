import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/app_light_theme_colors.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddListingSearchInput extends StatelessWidget {
  final FocusNode? focusNode;
  final Color? fillColor;
  final double? borderRadius;
  final TextEditingController? controller;
  final TapRegionCallback? onTapOutside;
  final ValueChanged<String>? onSubmitted;
  const AddListingSearchInput(
      {super.key,
      this.focusNode,
      this.fillColor,
      this.borderRadius,
      this.controller,
      this.onTapOutside,
      this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      width: 90.w,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextField(
        style: const TextStyle(color: AppLightThemeColors.kBlackColor),
        focusNode: focusNode,
        controller: controller,
        onTapOutside: onTapOutside ?? (event) {},
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          hintText: 'Add more amenities here',
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
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 0)),
            borderSide: BorderSide(color: fillColor ?? Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 0)),
            borderSide: BorderSide(color: fillColor ?? Colors.white),
          ),
        ),
      ),
    );
  }
}
