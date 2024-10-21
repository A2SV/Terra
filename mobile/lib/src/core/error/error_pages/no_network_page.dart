import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/app_light_theme_colors.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NetworkErrorPage extends StatelessWidget {
  const NetworkErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/network_error.png",
              width: 75.w,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            "Disconnected",
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.w900,
              color: AppLightThemeColors.kMainBlueButton,
            ),
          ),
          SizedBox(height: 1.5.h),
          Text(
            "Looks like you're offline.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15.5.sp,
            ),
          ),
          Text(
            "Check your connection and try again.",
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
            onPressed: () {
              Navigator.pushNamed(context, "/404-page");
            },
          )
        ],
      ),
    );
  }
}
