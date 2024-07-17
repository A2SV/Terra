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
  });

  final String text;

  final Function() onSelect;
  final bool isSelected;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(2.w),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: isSelected
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
            fontSize: 17.sp,
            fontFamily: "Nunito",
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.sp),
          ),
          padding: EdgeInsets.symmetric(horizontal: 3.8.w, vertical: 1.6.w),
          showCheckmark: false,
          side: BorderSide(
            color: borderColor ?? AppLightThemeColors.kMainLightButtonBorder,
          ),
        ),
      ),
    );
  }
}
