import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/app_light_theme_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StudentIdentityCard extends StatelessWidget {
  const StudentIdentityCard({
    super.key,
    required this.onTap,
    required this.fieldColor,
    required this.radioColor,
  });

  final VoidCallback onTap;
  final Color fieldColor;
  final Color radioColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 90.w,
          height: 5.5.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: fieldColor,
              width: 0.8,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.5.w),
                child: Container(
                  width: 2.5.h,
                  height: 2.5.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: radioColor,
                    border: Border.all(
                      color: AppLightThemeColors.kLightTextColor,
                      width: 0.8,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check,
                      size: 4.w,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Text(
                "YES",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 15.5.sp,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
