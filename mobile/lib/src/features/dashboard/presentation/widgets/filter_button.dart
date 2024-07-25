import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/app_light_theme_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    required this.text,
    required this.onSelect,
    required this.isSelected,
    this.borderColor,
    this.size = 17,
    this.hasShadow = true,
  });

  final String text;
  final Function() onSelect;
  final bool isSelected;
  final Color? borderColor;
  final double size;
  final bool hasShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: isSelected & hasShadow
            ? [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.27),
                  blurRadius: 30,
                  offset: Offset(3.w, 2.h), // changes position of shadow
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
          fontSize: size.sp,
          fontFamily: "Nunito",
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.sp),
        ),
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.6.w),
        showCheckmark: false,
        side: BorderSide(
          color: borderColor ?? AppLightThemeColors.kMainLightButtonBorder,
        ),
      ),
    );
  }
}
