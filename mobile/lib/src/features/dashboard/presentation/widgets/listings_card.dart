import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/src/core/theme/app_light_theme_colors.dart';
import 'package:mobile/src/features/dashboard/data/models/listing.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:transparent_image/transparent_image.dart';

class ListingsCard extends StatelessWidget {
  final ListingModel listing;
  const ListingsCard({
    super.key,
    required this.listing,
    // required this.startingPrice,
    // required this.propertyType,
    // required this.title,
    // required this.location,
    // required this.bedroomNumber,
    // required this.washroomNumber,
    // required this.landSize,
    // required this.isPremium,
    // required this.imageUrl,
    // required this.profileImageUrl,
  });
  // final String imageUrl;
  // final String profileImageUrl;
  // final int startingPrice;
  // final String propertyType;
  // final String title;
  // final String location;
  // final int bedroomNumber;
  // final int washroomNumber;
  // final String landSize;
  // final bool isPremium;

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      margin: EdgeInsets.only(bottom: 2.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.5.h),
      ),
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        width: double.infinity,
        height: 31.h,
        child: Column(
          children: [
            Container(
              height: 17.h,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: listing.propertyPhotos.first.url,//listing.[0],
                      fit: BoxFit.fill,
                      height: 20.h,
                    ),
                  ),
                  // if (isPremium)
                  //   Positioned(
                  //     right: 0,
                  //     top: 0,
                  //     width: 30.w,
                  //     child: SvgPicture.asset('assets/svg/premium_banner.svg'),
                  //   ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    right: 0,
                    height: 4.h,
                    child: Container(
                      color: Colors.black.withOpacity(0.7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Starting GHC ${listing.paymentInformation.cost}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                          Text(
                            listing.propertyType.name.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(3.8.w, 1.h, 3.w, 0.5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          listing.title,
                          style:
                              TextStyle(fontSize: 15.sp, color: Colors.black),
                        ),
                      ),
                      // SizedBox(
                      //   width: 4.h,
                      //   height: 4.h,
                      //   child: FadeInImage.memoryNetwork(
                      //     placeholder: kTransparentImage,
                      //     image: listing.lister.profilePictureUrl,
                      //     fit: BoxFit.cover,
                      //   ).circularClip(50),
                      // )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.8.w),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 17.sp,
                      ),
                      SizedBox(width: 2.w),
                      Text(
                        '${listing.propertyLocation.city}, ${listing.propertyLocation.country}',
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: AppLightThemeColors.kLightTextColor),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(3.8.w, 2.h, 5.w, 0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/bed.svg",
                                  height: 3.5.w,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "${Random().nextInt(10)}",
                                  style: TextStyle(
                                    color: AppLightThemeColors.kLightTextColor,
                                    fontSize: 13.5.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 6.w),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/Group.svg",
                                  height: 3.5.w,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "${Random().nextInt(10)}",
                                  style: TextStyle(
                                    color: AppLightThemeColors.kLightTextColor,
                                    fontSize: 13.5.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 6.w),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/copy.svg",
                                  height: 3.5.w,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "${listing.propertySize} sqft",
                                  style: TextStyle(
                                    color: AppLightThemeColors.kLightTextColor,
                                    fontSize: 13.5.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                "assets/svg/eye.svg",
                                height: 3.5.w,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                "assets/svg/columns.svg",
                                height: 3.5.w,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                "assets/svg/Bookmark.svg",
                                height: 3.5.w,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
