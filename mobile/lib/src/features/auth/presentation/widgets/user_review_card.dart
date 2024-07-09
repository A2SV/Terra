import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ReviewCard extends StatelessWidget {
  final String userName;
  final String userImage;
  final String reviewText;
  final double rating;
  final String timeAgo;
  final List<String>? reviewImages;

  const ReviewCard({
    Key? key,
    required this.userName,
    required this.userImage,
    required this.reviewText,
    required this.rating,
    required this.timeAgo,
    this.reviewImages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppCommonColors.reviewCard,
      margin: EdgeInsets.symmetric(vertical: 1.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: EdgeInsets.all(3.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 3.h,
                  backgroundImage: AssetImage(
                      userImage), // Use AssetImage instead of NetworkImage
                ),
                SizedBox(width: 3.w),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                userName,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppCommonColors.reviewHeading,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              children: List.generate(5, (index) {
                                return Icon(
                                  Icons.star,
                                  color: index < rating
                                      ? AppCommonColors.reviewStars
                                      : AppCommonColors.textFieldTextColor,
                                  size: 1.5.h, // smaller stars
                                );
                              }),
                            ),
                          ],
                        ),
                        SizedBox(height: 0.5.h),
                        Text(
                          reviewText,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppCommonColors.reviewText,
                          ),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          timeAgo,
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: AppCommonColors.textFieldTextColor,
                          ),
                        ),
                        if (reviewImages != null &&
                            reviewImages!.isNotEmpty) ...[
                          SizedBox(height: 2.h),
                          Row(
                            children: reviewImages!.map((image) {
                              return Padding(
                                padding: EdgeInsets.only(right: 2.w),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    image,
                                    width: 12.8.w,
                                    height: 12.8.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ],
                    ),
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
