import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/app_light_theme_colors.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DropdownComponent extends StatelessWidget {
  final List<Widget> tiles;
  final String title;
  final String trail;
  final double rightPadding;
  const DropdownComponent(
      {super.key,
      this.tiles = const [],
      required this.title,
      this.trail = "",
      this.rightPadding = 0});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(
        dividerColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        child: ExpansionTile(
          tilePadding: EdgeInsets.only(right: rightPadding),
          clipBehavior: Clip.none,
          controlAffinity: ListTileControlAffinity.platform,
          expandedAlignment: Alignment.centerLeft,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 17.sp,
                ),
              ),
              Text(
                trail,
                style: context.textTheme.bodySmall!.copyWith(
                    color: AppLightThemeColors.kMainBlueButton,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          children: [
            Wrap(clipBehavior: Clip.none, children: tiles),
          ],
        ),
      ),
    );
  }
}
