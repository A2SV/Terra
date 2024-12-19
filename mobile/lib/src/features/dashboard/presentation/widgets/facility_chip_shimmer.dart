import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FacilityChipShimmer extends StatelessWidget {
  final double? verticalPaddingValue;
  const FacilityChipShimmer({
    super.key,
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
          color: Colors.grey,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Container(
              height: 1.5.h,
              width: 2.w,
              color: Colors.grey,
            ),
            Container(
              height: 1.5.h,
              width: 20.w,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
