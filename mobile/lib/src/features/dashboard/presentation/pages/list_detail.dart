import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/gen/assets.gen.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/utils/currency_formatter.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:mobile/src/core/widgets/custom_google_widget.dart';
import 'package:mobile/src/features/dashboard/data/data.dart';
import 'package:mobile/src/features/dashboard/domain/domain.dart';
import 'package:mobile/src/features/dashboard/presentation/bloc/listing_details/listing_details_bloc.dart';
import 'package:mobile/src/features/dashboard/presentation/widgets/custom_details_button.dart';
import 'package:mobile/src/features/dashboard/presentation/widgets/facility_chip.dart';
import 'package:mobile/src/features/dashboard/presentation/widgets/facility_chip_shimmer.dart';
import 'package:mobile/src/features/dashboard/presentation/widgets/listing_detail_appbar_button.dart';
import 'package:mobile/src/features/dashboard/presentation/widgets/property_card.dart';
import 'package:mobile/src/features/dashboard/presentation/widgets/review_card.dart';
import 'package:mobile/src/features/dashboard/presentation/widgets/shader_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';

class ListingDetail extends StatefulWidget {
  final String id;
  const ListingDetail({super.key, required this.id});
  @override
  State<ListingDetail> createState() => _ListingDetailState();
}

class _ListingDetailState extends State<ListingDetail> {
  final List<Map<String, dynamic>> facilities = [
    {
      'icon': Assets.svg.bedroomIcon,
      'label': ' Bedroom(s)',
    },
    {
      'icon': Assets.svg.bathroomIcon,
      'label': ' Bathroom(s)',
    },
    {
      'icon': Assets.svg.kitchen,
      'label': ' Kitchen(s)',
    },
    {
      'icon': Assets.svg.fullyFurnished,
      'label': ' Fully Furnished',
    },
  ];
  final List<Map<String, dynamic>> amenities = [
    {
      'icon': Assets.svg.riverView,
      'label': 'River view',
    },
    {
      'icon': Assets.svg.kitchen,
      'label': 'Kitchen',
    },
    {
      'icon': Assets.svg.car,
      'label': 'Free parking on premises',
    },
    {
      'icon': Assets.svg.wifi,
      'label': 'Wifi',
    },
    {
      'icon': Assets.svg.arctic,
      'label': 'AC - split type ductless system',
    },
  ];
  final List<String> otherFacilities = [
    '2 Hospitals',
    '4 Gas stations',
    '2 Schools',
  ];
  final List<Map<String, dynamic>> nearbyLocations = [
    {
      'name': 'Wings Tower',
      'price': 220,
      'location': 'Accra, Ghana',
      'rating': 4.2,
      'isFavorite': false,
    },
    {
      'name': 'Sky Dandelions',
      'price': 190,
      'location': 'Accra, Ghana',
      'rating': 4.9,
      'isFavorite': false,
    },
    {
      'name': 'Wings Tower',
      'price': 220,
      'location': 'Accra, Ghana',
      'rating': 4.2,
      'isFavorite': true,
    },
    {
      'name': 'Wings Tower',
      'price': 220,
      'location': 'Accra, Ghana',
      'rating': 4.2,
      'isFavorite': false,
    },
  ];
  final List<String> apartmentImages = [
    Assets.images.houseImage1.path,
    Assets.images.houseImage2.path,
    Assets.images.houseImage3.path,
    Assets.images.houseImage1.path,
    Assets.images.houseImage2.path,
    Assets.images.houseImage3.path,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ListingDetailBloc, ListingDetailsState>(
        // body: BlocConsumer<DashboardBloc, DashboardState>(
        //   listener: (context, state) {
        //     // TODO: implement listener
        //   },
        builder: (context, state) {
          return (state is ListingDetailsError)
              ? Center(
                  child: Text(
                    state.message,
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontSize: 15.sp,
                    ),
                  ),
                )
              : (state is ListingDetailsLoading)
                  ? _buildListingDetailShimmer()
                  : (state is ListingDetailSuccess)
                      ? _buildListingDetail(context, state.listingDetail)
                      : const SizedBox();
        },
      ),
    );
  }

  @override
  void initState() {
    context
        .read<ListingDetailBloc>()
        .add(LoadListingDetailsEvent(id: widget.id));
    super.initState();
  }

  Widget _buildAmenity(BuildContext context,
      {required String icon, required String label}) {
    return Row(
      children: [
        icon.asSvgImage(),
        SizedBox(
          width: 3.w,
        ),
        Text(
          label,
          style: context.textTheme.bodyMedium!.copyWith(fontSize: 15.sp),
        ),
      ],
    );
  }

  Widget _buildListingDetail(BuildContext context, ListingDetailModel listing) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: context.height * 0.57,
            child: Stack(
              fit: StackFit.loose,
              clipBehavior: Clip.none,
              children: [
                if (listing.propertyPhotos != null &&
                    listing.propertyPhotos!.isNotEmpty)
                  FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: listing.propertyPhotos!.first.url,
                    height: context.height,
                    width: context.width,
                    fit: BoxFit.cover,
                  ).circularClip(15.sp),
                SafeArea(
                  bottom: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ListingDetailAppbarButton(
                            icon: Icons.arrow_back,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          const Spacer(),
                          ListingDetailAppbarButton(
                            onPressed: () {},
                            icon: Icons.ios_share,
                          ),
                          ListingDetailAppbarButton(
                            icon: Icons.favorite,
                            onPressed: () {},
                            iconColor: Colors.white,
                            backgroundColor: AppCommonColors.mainBlueButton,
                          ),
                          SizedBox(
                            width: 4.5.w,
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 1.2.h,
                              horizontal: 4.w,
                            ),
                            margin: EdgeInsets.only(bottom: 0.5.h),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 78, 100, 128),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: AppCommonColors.logoGold,
                                  size: 16.sp,
                                ),
                                SizedBox(width: 2.w),
                                Text(
                                  '4.6',
                                  style:
                                      context.textTheme.labelMedium!.copyWith(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 1.2.h,
                              horizontal: 5.w,
                            ),
                            margin: EdgeInsets.only(bottom: 0.5.h),
                            decoration: BoxDecoration(
                              color: AppCommonColors.mainBlueButton,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              listing.propertySubType.name.capitalize(),
                              style: context.textTheme.labelMedium!.copyWith(
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: List.generate(
                              min(3, (listing.propertyPhotos ?? []).length),
                              (index) {
                                return Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    if ((listing.propertyPhotos ?? []).length >
                                        1)
                                      Container(
                                        margin: EdgeInsets.all(5.sp),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.sp),
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 7.sp,
                                          ),
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        child: FadeInImage.memoryNetwork(
                                          placeholder: kTransparentImage,
                                          image: (listing.propertyPhotos ??
                                                  [])[index + 1]
                                              .url,
                                          fit: BoxFit.cover,
                                        ).circularClip(15.sp),
                                      ),
                                    if (index == 2 &&
                                        ((listing.propertyPhotos ?? []).length -
                                                (index + 1)) >
                                            0)
                                      Text(
                                        '+${(listing.propertyPhotos ?? []).length - (index + 1)}',
                                        style: context.textTheme.bodyMedium!
                                            .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ).symmetricPadding(4.5.w, 3.5.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      listing.title,
                      style: context.textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${listing.paymentInformation.currency.symbol} ${formatMoney(double.tryParse(listing.paymentInformation.cost) ?? 0)}',
                        style: context.textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                        ),
                      ),
                      Text(
                        listing.paymentInformation.paymentFrequency.name,
                        style: context.textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: AppCommonColors.mainBlueButton,
                    size: 12,
                  ),
                  Text(
                    '${listing.propertyLocation.city},${listing.propertyLocation.country}',
                    style: context.textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.h),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 1.3.h,
                      horizontal: 5.w,
                    ),
                    decoration: BoxDecoration(
                      color: listing.listingType == PropertyListingType.forRent
                          ? AppCommonColors.mainBlueButton
                          : AppCommonColors.disabledFieldColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      'Rent',
                      style: context.textTheme.labelMedium!.copyWith(
                        color:
                            listing.listingType == PropertyListingType.forRent
                                ? Colors.white
                                : AppCommonColors.mainBlueButton,
                        fontSize: 14.sp,
                        // fontSize: 13.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 1.3.h,
                      horizontal: 5.w,
                    ),
                    decoration: BoxDecoration(
                      color: listing.listingType == PropertyListingType.forSale
                          ? AppCommonColors.mainBlueButton
                          : AppCommonColors.disabledFieldColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      'Buy',
                      style: context.textTheme.labelMedium!.copyWith(
                        // fontSize: 14.sp,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color:
                            listing.listingType == PropertyListingType.forSale
                                ? Colors.white
                                : AppCommonColors.mainBlueButton,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.1.h),
                child: const Divider(
                  color: AppCommonColors.disabledFieldColorBorder,
                ),
              ),
            ],
          ).horizontalPadding(4.5.w),
          if (listing.residentialProperty != null)
            Container(
              padding: EdgeInsets.only(left: 4.5.w),
              height: 5.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: facilities.length,
                itemBuilder: (context, index) {
                  return FacilityChip(
                      icon: facilities[index]['icon'],
                      label:
                          '${listing.residentialProperty!.numberOfBedrooms}${facilities[index]['label']}');
                },
              ),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: 1.5.h,
                  top: 2.h,
                ),
                child: Text(
                  'Location & Public Facilities',
                  style: context.textTheme.labelMedium!.copyWith(
                    fontSize: 17.sp,
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: const BoxDecoration(
                      color: AppCommonColors.disabledFieldColor,
                      shape: BoxShape.circle,
                    ),
                    child: Assets.svg.location.asSvgImage(),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Expanded(
                    child: Text(
                      'Airport Residential Near the Agudey Road, Zebra Street 123',
                      maxLines: 2,
                      style: context.textTheme.bodySmall!.copyWith(
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                ],
              ),
              ListTile(
                enabled: false,
                leading: Icon(
                  Icons.location_on,
                  color: context.colorScheme.primary,
                ),
                minLeadingWidth: 8.w,
                minVerticalPadding: 0,
                minTileHeight: 27.sp,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.sp),
                  borderSide: const BorderSide(
                    color: AppCommonColors.disabledFieldColorBorder,
                  ),
                ),
                title: RichText(
                  text: TextSpan(
                    text: "2.5km",
                    style: context.textTheme.displayMedium!.copyWith(
                      fontSize: 13.sp,
                    ),
                    children: [
                      TextSpan(
                        text: " from your location",
                        style: context.textTheme.bodyMedium!.copyWith(
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ).verticalPadding(1.h),
            ],
          ).horizontalPadding(4.5.w),
          Container(
            margin: EdgeInsets.only(
              top: 0.7.h,
              bottom: 2.h,
              left: 4.5.w,
            ),
            height: 5.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: otherFacilities.length,
              itemBuilder: (context, index) =>
                  FacilityChip(label: otherFacilities[index]),
            ),
          ),
          const CustomGoogleMap(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What this place offers',
                style: context.textTheme.labelMedium!.copyWith(
                  fontSize: 17.sp,
                ),
              ),
              ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                shrinkWrap: true,
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: amenities.length,
                itemBuilder: (context, index) {
                  return _buildAmenity(
                    context,
                    icon: amenities[index]['icon'],
                    label: amenities[index]['label'],
                  ).verticalPadding(0.5.h);
                },
              ),
              SizedBox(height: 1.h),
              CustomDetailsButton(
                label: 'Show all 20 Amenities',
                onPressed: () {},
              ),
              SizedBox(height: 5.h),
              ListTile(
                tileColor: AppCommonColors.disabledFieldColor,
                minLeadingWidth: 15.w,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: const BorderSide(
                    color: AppCommonColors.disabledFieldColorBorder,
                  ),
                ),
                leading: (listing.lister.profilePictureUrl != null &&
                        listing.lister.profilePictureUrl!.isNotEmpty)
                    ? FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: listing.lister.profilePictureUrl!,
                        height: context.height,
                        width: context.width,
                        fit: BoxFit.cover,
                      ).circularClip(15.sp)
                    : null,
                minTileHeight: 35.sp,
                enabled: false,
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${listing.lister.firstName} ${listing.lister.lastName}",
                      style: context.textTheme.labelMedium!.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      listing.lister.normalizedUserName,
                      style: context.textTheme.bodyMedium!.copyWith(
                        fontSize: 11.sp,
                      ),
                    ),
                  ],
                ),
                trailing: Assets.svg.chat.asSvgImage(),
              ),
              SizedBox(height: 2.h),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 17.sp,
                    color: AppCommonColors.logoGold,
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    '3 Reviews',
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.5.h),
              Row(
                children: [
                  Assets.images.identityVerifiedLogo.path.asAssetImage(
                    height: 17.sp,
                    width: 17.sp,
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    'Identity verified',
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Text(
                'Information for Users',
                style: context.textTheme.labelMedium!.copyWith(
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 1.h),
              Text(
                'I will be available on site. When I\'m not on site you can reach me via text, phone or through Terra.',
                style: context.textTheme.bodyMedium!.copyWith(
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(height: 1.h),
              _buildUserInfoRichText(
                context,
                key: "Language",
                value: "English",
              ),
              _buildUserInfoRichText(
                context,
                key: "Response rate",
                value: "80%",
              ),
              SizedBox(
                height: 1.h,
              ),
              _buildUserInfoRichText(
                context,
                key: "Email",
                value: "ghproperties@gmail.com",
              ),
              _buildUserInfoRichText(
                context,
                key: "Phone",
                value: "+233 123 456 789",
              ),
              _buildUserInfoRichText(
                context,
                key: "Response time",
                value: "within an hour",
              ),
              SizedBox(height: 1.h),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'To protect your payment, always make sure to verify the property listing first through in-person visits before purhaches',
                      style: context.textTheme.bodyMedium!.copyWith(
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
                  Assets.images.identityVerifiedLogo.path.asAssetImage(
                    height: 24.sp,
                    width: 24.sp,
                  ),
                ],
              ),
              SizedBox(height: 4.5.h),
              Text(
                'Reviews',
                style: context.textTheme.labelMedium!.copyWith(
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 2.h),
              ListTile(
                enabled: false,
                tileColor: AppCommonColors.reviewsLeadingColor,
                leading: Container(
                  decoration: BoxDecoration(
                    color: AppCommonColors.reviewsLeadingColor,
                    borderRadius: BorderRadius.circular(17.sp),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: Icon(
                      Icons.star,
                      color: AppCommonColors.logoGold,
                      size: 20.sp,
                    ),
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const ShaderRatingWidget(rating: 4.6),
                        SizedBox(
                          width: 1.h,
                        ),
                        Text(
                          '4.6',
                          style: context.textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'From 112 reviewers',
                      style: context.textTheme.bodyMedium!
                          .copyWith(fontSize: 13.sp),
                    ),
                  ],
                ),
                trailing: Stack(
                  children: List.generate(
                    3,
                    (index) => Padding(
                      padding:
                          EdgeInsets.only(left: index / 3 * 70, right: 8.w),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 3.0,
                          ),
                        ),
                        child: Assets.images.profilePic.path
                            .asAssetImage(height: 3.5.h)
                            .circularClip(25.0),
                      ),
                    ),
                  ).toList(),
                ),
                minTileHeight: 9.h,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.sp),
                ),
              ),
              SizedBox(height: 2.h),
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                primary: false,
                itemBuilder: (context, index) => const ReviewCard(
                  name: 'Kurt Mullins',
                  review:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  rating: 4.6,
                  daysAgo: 8,
                ),
              ),
              SizedBox(height: 1.5.h),
              CustomDetailsButton(
                onPressed: () {},
                label: 'View all reviews',
              ),
              SizedBox(height: 2.h),
              Text(
                'Nearby From this Location',
                style: context.textTheme.labelMedium!.copyWith(
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 2.5.h),
              GridView.builder(
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: nearbyLocations.length,
                padding: const EdgeInsets.only(top: 0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.71,
                  crossAxisSpacing: 7.w,
                  mainAxisSpacing: 1.h,
                ),
                itemBuilder: (context, index) {
                  return PropertyCard(
                    name: nearbyLocations[index]['name'],
                    price: nearbyLocations[index]['price'],
                    location: nearbyLocations[index]['location'],
                    rating: nearbyLocations[index]['rating'],
                    isFavourite: nearbyLocations[index]['isFavorite'],
                  );
                },
              ),
            ],
          ).horizontalPadding(4.5.w),
          SizedBox(
            height: 5.h,
          )
        ],
      ),
    );
  }

  Widget _buildListingDetailShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: context.height * 0.57,
              child: Container(
                height: context.height,
                width: context.width,
                color: Colors.grey,
              ).circularClip(15.sp),
            ),
            SizedBox(
              height: 2.h,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        height: 2.5.h,
                        width: 25.w,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 1.5.h,
                          width: 25.w,
                          color: Colors.grey,
                        ),
                        Container(
                          height: 2.h,
                          width: 25.w,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 2.h,
                      width: 2.h,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 2.w),
                    Container(
                      height: 1.5.h,
                      width: 25.w,
                      color: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 1.3.h,
                        horizontal: 5.w,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Container(
                        height: 1.5.h,
                        width: 25.w,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 1.3.h,
                        horizontal: 5.w,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Container(
                        height: 1.5.h,
                        width: 25.w,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.1.h),
                  child: const Divider(
                    color: AppCommonColors.disabledFieldColorBorder,
                  ),
                ),
              ],
            ).horizontalPadding(4.5.w),
            Container(
              padding: EdgeInsets.only(left: 4.5.w),
              height: 5.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: facilities.length,
                itemBuilder: (context, index) {
                  return const FacilityChipShimmer();
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    bottom: 1.5.h,
                    top: 2.h,
                  ),
                  height: 2.5.h,
                  width: 40.w,
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    Container(
                      height: 2.h,
                      width: 2.h,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Container(
                      height: 1.5.h,
                      width: 25.w,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 1.h,
                    ),
                    Container(
                      height: 1.5.h,
                      width: 25.w,
                      color: Colors.grey,
                    ),
                  ],
                )
              ],
            ).horizontalPadding(4.5.w),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfoRichText(BuildContext context,
      {required String key, required String value}) {
    return RichText(
      text: TextSpan(
        text: '$key:',
        style: context.textTheme.bodyMedium!.copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
        ),
        children: [
          TextSpan(
            text: ' $value',
            style: context.textTheme.bodyMedium!.copyWith(
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    ).verticalPadding(0.5.h);
  }
}
