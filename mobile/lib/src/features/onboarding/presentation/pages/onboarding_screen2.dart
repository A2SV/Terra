import 'package:flutter/material.dart';
import 'package:mobile/src/core/routes/routes.dart';
import 'package:mobile/src/core/theme/app_light_theme_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:mobile/src/features/onboarding/presentation/widgets/page_indicator.dart';
import 'package:mobile/src/core/widgets/skip_button.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({
    super.key,
    required this.onBack,
    required this.onNext,
  });

  final VoidCallback onNext;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: const AssetImage("assets/images/onboarding_image2.png"),
            colorFilter: ColorFilter.mode(
                AppLightThemeColors.kBlackColor.withOpacity(0.5),
                BlendMode.dstATop),
          ),
          gradient: const LinearGradient(
            colors: [
              AppLightThemeColors.kGradientColor1,
              AppLightThemeColors.kGradientColor2,
              AppLightThemeColors.kGradientColor3,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 25, top: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: onBack,
                    icon: const Icon(Icons.arrow_back),
                  ),
                  GestureDetector(
                    onTap: () {
                     switchScreen(
                              context: context,
                              routeName: AppRoutes.signup,
                              popAndPush: true,
                            );
                    },
                    child: const SkipButton(opacity: 0.86),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 2.w),
              child: Text(
                "Discover affordable and convenient housing options at your comfort.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 18.5.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Nunito",
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PageIndicator(
                      width: 7,
                      color: Theme.of(context).colorScheme.onPrimary), //change
                  const SizedBox(width: 6),
                  PageIndicator(
                      width: 22,
                      color: Theme.of(context).colorScheme.onPrimary), //change
                  const SizedBox(width: 6),
                  PageIndicator(
                      width: 7,
                      color: Theme.of(context).colorScheme.onPrimary), //change
                ],
              ),
            ),
            SizedBox(height: 2.h),
            Center(
              child: GestureDetector(
                onTap: onNext,
                child: Text(
                  "Next",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Nunito",
                  ),
                ),
              ),
            ),
            SizedBox(height: 6.h),
          ],
        ),
      ),
    );
  }
}
