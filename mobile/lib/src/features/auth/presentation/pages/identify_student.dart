import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/app_light_theme_colors.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';
import 'package:mobile/src/features/auth/presentation/widgets/student_identity_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class IdentifyStudent extends StatefulWidget {
  const IdentifyStudent({super.key});

  @override
  State<IdentifyStudent> createState() => _IdentifyStudentState();
}

class _IdentifyStudentState extends State<IdentifyStudent> {
  bool? isStudent;

  void onTapButton(bool val) {
    setState(() {
      isStudent = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.h),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back),
                  )
                ],
              ),
              SizedBox(height: 7.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Text(
                  "Are you a univeristy student?",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: "Nunito",
                    fontSize: 19.sp,
                    color: AppLightThemeColors.kBlackColor,
                  ),
                ),
              ),
              SizedBox(height: 1.5.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Text(
                  "Kindly let us know if you are studying in any of the univeristies in Ghana",
                  style: TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 15.sp,
                    color: AppLightThemeColors.kLightTextColor,
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              StudentIdentityCard(
                onTap: () {
                  onTapButton(true);
                },
                fieldColor: isStudent == true
                    ? AppCommonColors.mainBlueButton
                    : AppLightThemeColors.kLightTextColor,
                radioColor: isStudent == true
                    ? AppCommonColors.mainBlueButton
                    : Colors.white,
              ),
              SizedBox(height: 1.5.h),
              StudentIdentityCard(
                onTap: () {
                  onTapButton(false);
                },
                fieldColor: isStudent == false
                    ? AppCommonColors.mainBlueButton
                    : AppLightThemeColors.kLightTextColor,
                radioColor: isStudent == false
                    ? AppCommonColors.mainBlueButton
                    : Colors.white,
              ),
              SizedBox(height: 4.h),
              CustomButton(
                horizontalPadding: 4.5.w,
                borderColor: Colors.white,
                backgroundColor: isStudent == null
                    ? AppLightThemeColors.kVeryLightTextColor
                    : AppCommonColors.mainBlueButton,
                text: "Next",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
