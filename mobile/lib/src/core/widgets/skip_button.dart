import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key, this.opacity = 0.43});

  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(217, 217, 217, opacity),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.2.w, vertical: 0.6.h),
        child: Text(
          "Skip",
          style: TextStyle(fontSize: 14.5.sp),
        ),
      ),
    );
  }
}
