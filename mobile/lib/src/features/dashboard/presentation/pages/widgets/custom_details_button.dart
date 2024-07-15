import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomDetailsButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  const CustomDetailsButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: label,
      onPressed: onPressed,
      horizontalPadding: 0,
      backgroundColor: AppCommonColors.disabledFieldColor,
      borderColor: AppCommonColors.disabledFieldColorBorder,
      borderRadius: 15.sp,
      height: 27.sp,
      textStyle: context.textTheme.headlineSmall!.copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}