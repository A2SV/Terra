

import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FacilityChip extends StatelessWidget {
  final String label;
  final String? icon;
  final double? verticalPaddingValue;
  const FacilityChip({
    super.key,
    required this.label,
    this.icon,
    this.verticalPaddingValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 2.w),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: verticalPaddingValue ?? 0.5.h,
          horizontal: 5.w,
        ),
        decoration: BoxDecoration(
          color: AppCommonColors.disabledFieldColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: AppCommonColors.disabledFieldColorBorder,
          ),
        ),
        child: Row(
          children: [
            if (icon != null) icon.asSvgImage(rightPadding: 2.w),
            Text(
              label,
              style: context.textTheme.headlineSmall!.copyWith(
                color: AppCommonColors.detailsDirtyWhiteTextColor,
                fontSize: 13.5.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}