import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FilterButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.w),
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
        decoration: BoxDecoration(
          color: isSelected
              ? AppCommonColors.activeFilter
              : AppCommonColors.reviewCard,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/images/star.png',
              width: 2.h,
              height: 2.h,
            ),
            SizedBox(width: 1.5.w),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
