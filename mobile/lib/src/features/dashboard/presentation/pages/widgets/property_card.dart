import 'package:flutter/material.dart';
import 'package:mobile/gen/assets.gen.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PropertyCard extends StatelessWidget {
  final String name;
  final int price;
  final String location;
  final double rating;
  final bool isFavourite;

  const PropertyCard(
      {super.key,
      required this.name,
      required this.price,
      required this.location,
      required this.rating,
      required this.isFavourite});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppCommonColors.disabledFieldColor,
        borderRadius: BorderRadius.circular(17.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.sp),
              child: Stack(
                clipBehavior: Clip.antiAlias,
                fit: StackFit.expand,
                children: [
                  Assets.images.onboardingImage3.path
                      .asAssetImage(fit: BoxFit.fill)
                      .circularClip(15.sp),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.all(11.sp),
                            margin: EdgeInsets.all(10.sp),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isFavourite
                                  ? AppCommonColors.mainBlueButton
                                  : context.colorScheme.onPrimaryContainer,
                            ),
                            child: isFavourite
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                    size: 12.sp,
                                  )
                                : Icon(
                                    Icons.favorite_border,
                                    size: 12.sp,
                                    color: AppCommonColors.mainBlueButton,
                                  ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppCommonColors.propertyCardPriceTypeColor,
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            child: Assets.images.estatesCard.path
                                .asAssetImage(
                                  height: 13.sp,
                                  width: 13.sp,
                                )
                                .allPadding(10.sp),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: AppCommonColors.propertyCardPriceTypeColor,
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            child: RichText(
                              text: TextSpan(
                                text: '\$ $price',
                                style: context.textTheme.titleLarge!.copyWith(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                                children: [
                                  TextSpan(
                                    text: '/month',
                                    style:
                                        context.textTheme.titleLarge!.copyWith(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ).allPadding(10.sp),
                          ),
                        ],
                      ).allPadding(10.sp),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: context.textTheme.headlineSmall!.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 1,
              ),
              SizedBox(height: 1.3.h),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: AppCommonColors.logoGold,
                    size: 13.sp,
                  ),
                  Text(
                    ' $rating',
                    style: context.textTheme.titleLarge!.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(width: 1.w),
                  Icon(
                    Icons.location_on,
                    color: AppCommonColors.mainBlueButton,
                    size: 12.sp,
                  ),
                  Expanded(
                    child: Text(
                      ' $location',
                      style: context.textTheme.bodySmall!.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ).onlyPadding(7.sp, 15.sp, 15.sp, 0),
        ],
      ),
    );
  }
}