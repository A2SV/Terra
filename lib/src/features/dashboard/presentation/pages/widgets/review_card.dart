import 'package:flutter/material.dart';
import 'package:mobile/gen/assets.gen.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/widgets/shader_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ReviewCard extends StatelessWidget {
  final String name;
  final String review;
  final double rating;
  final int daysAgo;

  const ReviewCard(
      {super.key,
      required this.name,
      required this.review,
      required this.rating,
      required this.daysAgo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: AppCommonColors.disabledFieldColor,
      isThreeLine: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17.sp),
      ),
      leading: Assets.images.profilePic.path
          .asAssetImage(
            height: 5.h,
            width: 5.h,
          )
          .circularClip(5.h),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: context.textTheme.displayMedium!.copyWith(fontSize: 15.sp),
          ),
          ShaderRatingWidget(rating: rating),
        ],
      ).topPadding(1.h),
      trailing: SizedBox(
        width: 5.w,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1.h),
          Text(
            review,
            style: context.textTheme.bodySmall!
                .copyWith(fontSize: 12.sp, height: 0.2.h),
            maxLines: 3,
          ),
          SizedBox(height: 1.h),
          Text(
            '$daysAgo Days ago',
            style: context.textTheme.bodySmall!.copyWith(
              fontSize: 11.sp,
              fontWeight: FontWeight.w300,
            ),
            maxLines: 3,
          ),
        ],
      ),
    ).verticalPadding(0.5.h);
  }
}