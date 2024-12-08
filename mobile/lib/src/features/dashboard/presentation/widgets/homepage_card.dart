import 'package:flutter/material.dart';
import 'package:mobile/src/features/dashboard/presentation/widgets/search_input.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:mobile/src/core/theme/common_color.dart';

class HomepageCard extends StatelessWidget {
  const HomepageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5.w, 2.h, 5.w, 3.5.h),
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
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
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
                const Spacer(),
                Stack(
                  children: [
                    Container(
                      width: 4.5.h,
                      height: 4.5.h,
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
                  width: 4.5.h,
                  height: 4.5.h,
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
            SizedBox(height: 2.5.h),
            Column(
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
                  height: 0.5.h,
                ),
                Text(
                  "Let's start exploring",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 18.sp,
                      ),
                ),
              ],
            ),
            SizedBox(
              height: 2.5.h,
            ),
            const TopBarSearchInput(
              searchBackgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
