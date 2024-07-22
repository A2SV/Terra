
import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomGoogleMap extends StatelessWidget {
  final bool? showPrefixIcon;
  final String text;
  const CustomGoogleMap({
    super.key,
    this.showPrefixIcon = false,
    this.text = 'View all on map',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h, left: 4.5.w, right: 4.5.w),
      decoration: BoxDecoration(
        color: AppCommonColors.disabledFieldColor,
        borderRadius: BorderRadius.circular(20.sp),
      ),
      width: context.width,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            color: Colors.red,
            height: 25.h,
          ),
          CustomButton(
            text: text,
            onPressed: () {},
            showPrefixWidget: showPrefixIcon,
            prefixWidget: showPrefixIcon!
                ? const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.map_outlined,
                      size: 20,
                    ),
                  )
                : null,
            horizontalPadding: 0,
            borderRadius: 0,
            height: 5.h,
            backgroundColor: AppCommonColors.disabledFieldColor,
            borderColor: Colors.transparent,
            textStyle: context.textTheme.bodyMedium!.copyWith(
              fontSize: 13.sp,
            ),
          )
        ],
      ),
    );
  }
}