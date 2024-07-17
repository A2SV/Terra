import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/src/core/theme/app_light_theme_colors.dart';
import 'package:mobile/src/core/theme/dark_theme_colors.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'dart:math' as math;

class HomepageCard extends StatelessWidget {
  const HomepageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 30.h,
        decoration: BoxDecoration(
          color: AppCommonColors.cardColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 5.h,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: AppCommonColors.mainBlueButton,
                          size: 1.5.h,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          'Accra, Ghana',
                          // style: context.textTheme.bodySmall,
                          style: TextStyle(fontSize: 12.Q),
                        ),
                        SizedBox(
                          width: 1.2.w,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 1.8.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 24.w,
                ),
                Stack(
                  children: [
                    Container(
                      width: 4.h,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/notification_icon.png',
                          height: 1.h,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 9.5,
                      top: 9,
                      child: Container(
                        width: 1.h,
                        height: 0.7.h,
                        decoration: const BoxDecoration(
                          color: AppCommonColors.mainBlueButton,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 2.5.w,
                ),
                Container(
                  width: 4.h,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/profile_pic.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hey Evans!',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "Let's start exploring",
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 5.h,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextField(
                        style: const TextStyle(
                            color: AppLightThemeColors.kBlackColor),
                        decoration: InputDecoration(
                          hintText: 'Search address, city, location',
                          hintStyle: TextStyle(
                              fontSize: 16.sp,
                              color: AppCommonColors.textFieldTextColor,
                              fontWeight: FontWeight.w400),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/search_icon.png',
                              height: 2.6.h,
                            ),
                          ),
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 10,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Container(
                    height: 5.h,
                    width: 10.w,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Transform.rotate(
                      angle: 90 * math.pi / 180,
                      child: Icon(
                        Icons.tune,
                        size: 3.h,
                        color: AppDarkThemeColors.mainDarkMode,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
