import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/app_light_theme_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FlterButton extends StatelessWidget {
  const FlterButton(
      {super.key,
      required this.text,
      required this.onSelect,
      required this.isSelected});

  final String text;
  final Function() onSelect;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.5),
                  spreadRadius: 0.1,
                  blurRadius: 30,
                  offset: Offset(4.w, 1.h), // changes position of shadow
                ),
              ]
            : [],
      ),
      child: ChoiceChip(
        label: Text(text),
        selected: isSelected,
        onSelected: (bool selected) {
          onSelect();
        },
        selectedColor:
            AppLightThemeColors.kMainBlueButton, // Color for the selected chip
        backgroundColor:
            AppLightThemeColors.kMainLightButton, // Color for unselected chips
        labelStyle: TextStyle(
          color:
              isSelected ? Colors.white : AppLightThemeColors.kLightTextColor,
          fontSize: 17.sp,
          fontFamily: "Nunito",
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.sp),
        ),
        padding: EdgeInsets.symmetric(horizontal: 3.8.w, vertical: 1.6.w),
        showCheckmark: false,
        side:
            const BorderSide(color: AppLightThemeColors.kMainLightButtonBorder),
      ),
    );
  }
}
