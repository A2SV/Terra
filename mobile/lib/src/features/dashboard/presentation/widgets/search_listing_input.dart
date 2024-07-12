import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/app_light_theme_colors.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/theme/dark_theme_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:math' as math;

class TopBarSearchListingInput extends StatelessWidget {
  const TopBarSearchListingInput(
      {super.key, this.sideContainerColor, this.sideCotainerTextColor,this.focusNode,
        this.fillColor,this.borderRadius,this.controller,this.onTapOutside
      });

  final Color? sideContainerColor;
  final Color? sideCotainerTextColor;
  final FocusNode? focusNode;
  final Color? fillColor;
  final double? borderRadius;
  final TextEditingController? controller;
  final TapRegionCallback? onTapOutside;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 5.h,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(50),
            ),
            child: TextField(
              style: const TextStyle(color: AppLightThemeColors.kBlackColor),
              focusNode: focusNode,
              controller: controller,
              onTapOutside: onTapOutside??(event){},
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
                fillColor: fillColor??Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(borderRadius??0)
                  ),
                  borderSide: BorderSide(
                      color: fillColor??Colors.white
                  ),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(borderRadius??0)
                  ),
                  borderSide: BorderSide(
                      color: fillColor??Colors.white
                  ),
                ),

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
            boxShadow: [
              BoxShadow(
                color: sideContainerColor!.withOpacity(0.25)??Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 8,
                offset: Offset(2, 3), // changes position of shadow
              ),
            ],
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
