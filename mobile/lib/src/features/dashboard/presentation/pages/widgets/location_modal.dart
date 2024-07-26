import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/text_theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../core/theme/common_color.dart';

class LocationModalWidget extends StatelessWidget {
  const LocationModalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = CustomTextStyles.kDefaultTextTheme(Colors.black);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 30.w,
                child: Image.asset('assets/images/loc_modal.png'),
              ),
              SizedBox(height: 2.h),
              Text(
                'Enable your location',
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 18.sp,
                  color: AppCommonColors.appBlack,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 1.5.h),
              Text(
                'Choose your location to start find the request around you',
                style: textTheme.bodyMedium?.copyWith(
                  color: AppCommonColors.unfilledForm,
                  fontSize: 15.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 2.h),
              ElevatedButton(
                onPressed: () {
                  // Handle next button press
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(60.w, 6.h), // Adjusted width and height
                  backgroundColor: AppCommonColors.mainBlueButton,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Text(
                  'Use my location',
                  style: textTheme.labelSmall?.copyWith(color: Colors.white),
                ),
              ),
              SizedBox(height: 1.h),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Skip for now',
                  style: textTheme.bodySmall?.copyWith(
                    color: AppCommonColors.unfilledForm,
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
