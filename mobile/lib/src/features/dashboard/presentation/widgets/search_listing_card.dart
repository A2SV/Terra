import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/theme/text_theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../gen/fonts.gen.dart';

class SearchListingsCard extends StatelessWidget {
  final String imageUrl;

  final double price;
  final String propertyType;
  final String title;
  final String location;
  final int bedroomNumber;
  final String size;
  final double ratings;
  const SearchListingsCard(
      {super.key,
      required this.price,
      required this.propertyType,
      required this.title,
      required this.location,
      required this.bedroomNumber,
      required this.size,
      required this.imageUrl,
      required this.ratings});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.5.h),
      ),
      elevation: 10, // Elevation controls the size of the shadow
      shadowColor: Colors.black.withOpacity(0.4),
      clipBehavior: Clip.hardEdge,
      child: Row(
        children: <Widget>[
          Stack(
            children: [
              Container(
                margin: EdgeInsets.all(2.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: 24.w,
                    height: 24.w,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      }
                    },
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Text(
                        'Failed\n to load\n image',
                        style: CustomTextStyles.kDefaultTextTheme(
                                AppCommonColors.textFieldTextColor)
                            .bodySmall,
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                  top: 4.w, // Vertical position from the top of the image
                  right: 5.w, // Horizontal position from the right of the image
                  child: Container(
                    width: 7.w,
                    height: 7.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white.withOpacity(0.5)),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.blue,
                      size: 5.w,
                    ),
                  ))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 67.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppCommonColors.starRatingColor,
                        ),
                        Text(
                          '$ratings',
                          style: CustomTextStyles.kDefaultTextTheme(
                                  AppCommonColors.textFieldTextColor)
                              .bodyMedium,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 27.w,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppCommonColors.propertyTypeContainerColor),
                      child: Text(
                        propertyType,
                        style: CustomTextStyles.kDefaultTextTheme(
                                AppCommonColors.defaultLink)
                            .labelSmall,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 1.w,
              ),
              SizedBox(
                width: 60.w,
                child: Text(
                  title,
                  style: TextStyle(
                    color: AppCommonColors.propertyTitleColor,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: FontFamily.nunito,
                  ),
                ),
              ),
              SizedBox(
                height: 1.w,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: AppCommonColors.locationTextColor,
                      size: 4.w,
                    ),
                    Text(
                      location,
                      style: TextStyle(
                        color: AppCommonColors.locationTextColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: FontFamily.nunito,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 1.2.w,
              ),
              Container(
                width: 60.w,
                alignment: Alignment.centerLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(Icons.aspect_ratio_outlined),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              size,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: FontFamily.nunito,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.bed_outlined),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              '$bedroomNumber',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: FontFamily.nunito,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Text(
                      '\$$price/month',
                      style: TextStyle(
                        color: AppCommonColors.defaultLink,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: FontFamily.nunito,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
