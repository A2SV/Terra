import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/src/core/theme/app_light_theme_colors.dart';
import 'package:mobile/src/core/utils/custom_extensions.dart';
import 'package:mobile/src/features/dashboard/data/models/listing.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:transparent_image/transparent_image.dart';

class ListingsCard extends StatelessWidget {
  const ListingsCard({
    super.key,
    required this.listing,
  });
  final ListingModel listing;

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
                      image:
                          'https://images.unsplash.com/photo-1434082033009-b81d41d32e1c?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8aG91c2V8ZW58MHx8MHx8fDA%3D',
                      fit: BoxFit.fill,
                      height: 20.h,
                    ),
                  ),
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
                  ),
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                listing.title,
                                style: TextStyle(
                                    fontSize: 15.sp, color: Colors.black),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (listing.lister.isVerified) ...[
                              SizedBox(
                                  width: 1
                                      .w), // Add some space between title and badge
                              Image.asset(
                                'assets/images/verify.png', // Replace with the path to your asset
                                width: 2.2.h, // Adjust the size
                                height: 2.2.h, // Adjust the size
                              ),
                            ],
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          SizedBox(
                            width: 4.h,
                            height: 4.h,
                            child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: listing.lister.profilePictureUrl,
                              fit: BoxFit.cover,
                            ).circularClip(50),
                          ),
                        ],
                      ),
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
                            SizedBox(width: 4.w),
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                "assets/svg/repost.svg",
                                height: 3.7.w,
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
