import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/src/core/routes/routes.dart';
// import 'package:mobile/src/core/theme/app_light_theme_colors.dart';
import 'package:mobile/src/core/theme/app_light_theme_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:mobile/src/features/onboarding/presentation/widgets/page_indicator.dart';
import 'package:mobile/src/core/widgets/skip_button.dart';
import 'dart:io';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppLightThemeColors.kGradientBlue,
              AppLightThemeColors.kGradientYellow,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        height: double.infinity,
        width: double.infinity,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Platform.isAndroid) SizedBox(height: 3.h),
              Row(
                children: [
                  SizedBox(width: 40.w),
                  SvgPicture.asset(
                    "assets/svg/terra_logo.svg",
                    height: 20.w,
                  ),
                  SizedBox(width: 19.w),
                  GestureDetector(
                    onTap: () {
                      switchScreen(
                              context: context,
                              routeName: AppRoutes.signup,
                              popAndPush: true,
                            );
                    },
                    child: const SkipButton(),
                  ),
                ],
              ),
              SizedBox(height: 1.5.h),
              SizedBox(
                height: 55.h,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40.h,
                          width: 46.w,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            image: DecorationImage(
                              image:
                                  AssetImage("assets/images/house_image1.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          height: 40.h,
                          width: 46.w,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                            ),
                            image: DecorationImage(
                              image:
                                  AssetImage("assets/images/house_image2.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 10.w,
                      top: 9.h,
                      child: Container(
                        height: 47.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/house_image3.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 2.w),
                child: Text(
                  "Experience secure rentals with digital agreements and fraud prevention.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.5.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Nunito",
                  ),
                ),
              ),
              const Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PageIndicator(width: 22),
                    SizedBox(width: 6),
                    PageIndicator(width: 7),
                    SizedBox(width: 6),
                    PageIndicator(width: 7),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Center(
                child: GestureDetector(
                  onTap: onNext,
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Nunito",
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
