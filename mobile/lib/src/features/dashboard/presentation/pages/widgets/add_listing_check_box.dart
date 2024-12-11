import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/theme/text_theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



class AddListingCheckBox extends StatelessWidget {

  final bool isActive;
  final String label;
  final void Function(bool?)? onChanged;

  const AddListingCheckBox(
      {super.key,
        required this.isActive,
        required this.label,
        this.onChanged,
      });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 26,
          height: 26,
          child: Theme(
            data: ThemeData(
              unselectedWidgetColor: Colors.grey, // Inactive checkbox color
            ),
            child: Checkbox(
              activeColor:  AppCommonColors.mainBlueButton.withOpacity(0.15),
              checkColor: AppCommonColors.cardColor,
              value: isActive,
              onChanged: onChanged,
              side: WidgetStateBorderSide.resolveWith(
                    (states) => const BorderSide(width: 1.0, color: AppCommonColors.mainBlueButton),
              ),
            ),
          ),
        ),
          Text(
            label,
            style: CustomTextStyles.kDefaultTextTheme(Colors.black).displaySmall!.copyWith(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            ),
          ),

      ],
    );
  }
}
