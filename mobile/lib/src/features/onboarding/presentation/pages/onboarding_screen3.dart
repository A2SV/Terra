import 'package:flutter/material.dart';
import 'package:mobile/src/core/routes/routes.dart';
import 'package:mobile/src/core/widgets/skip_button.dart';
import 'package:mobile/src/features/onboarding/presentation/widgets/page_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/theme/text_theme.dart';

class OnboardingScreen3 extends StatelessWidget {
  final VoidCallback onBack;
  const OnboardingScreen3({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/onboarding_image3.png"),
                ),
              ),
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
                            icon: const Icon(Icons.arrow_back)),
                        GestureDetector(
                          onTap: () {
                            switchScreen(
                              context: context,
                              routeName: AppRoutes.signup,
                              popAndPush: true,
                            );
                          },
                          child: const SkipButton(opacity: 0.69),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 59.h,
              left: 0,
              child: Container(
                width: 100.w,
                height: 41.h,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(0, 0, 0, 0),
                      Color.fromRGBO(0, 0, 0, 0.7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 10.h),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 3.h, horizontal: 2.w),
                        child: Text(
                          "Easily find and connect with roommates to share your rental costs.",
                          textAlign: TextAlign.center,
                          style:
                          CustomTextStyles.kDefaultTextTheme(
                              Colors.white)
                              .bodySmall?.copyWith(
                            color: Colors.white,
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Nunito",
                          ),
                        ),
                      ),
                      const Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            PageIndicator(width: 7, color: Colors.white),
                            SizedBox(width: 6),
                            PageIndicator(width: 7, color: Colors.white),
                            SizedBox(width: 6),
                            PageIndicator(width: 22, color: Colors.white),
                          ],
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, "/signup");
                          },
                          child: Text(
                            "Get started",
                            style:
                            CustomTextStyles.kDefaultTextTheme(
                                Colors.white)
                                .bodySmall?.copyWith(
                              color: Colors.white,
                              fontSize: 18.sp,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
