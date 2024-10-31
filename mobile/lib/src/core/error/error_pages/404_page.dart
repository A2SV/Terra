import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/app_light_theme_colors.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Page404 extends StatelessWidget {
  const Page404({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/illustration.png",
              width: 75.w,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            "404",
            style: TextStyle(
              fontSize: 29.sp,
              fontWeight: FontWeight.w900,
              color: AppLightThemeColors.kMainBlueButton,
            ),
          ),
          Text(
            "we are sorry :( the page you requested",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15.5.sp,
            ),
          ),
          Text(
            "for cannot be found",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15.5.sp,
            ),
          ),
          SizedBox(height: 6.h),
          CustomButton(
            text: "Go back to Homepage",
            borderColor: Colors.white,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
