import 'package:flutter/material.dart';
import 'package:mobile/gen/assets.gen.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomDetailsButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  const CustomDetailsButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: label,
      onPressed: onPressed,
      horizontalPadding: 0,
      backgroundColor: AppCommonColors.disabledFieldColor,
      borderColor: AppCommonColors.disabledFieldColorBorder,
      borderRadius: 15.sp,
      height: 27.sp,
      textStyle: context.textTheme.labelSmall!.copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class FacilityChip extends StatelessWidget {
  final String label;
  final String? icon;
  final double? verticalPaddingValue;
  const FacilityChip({
    super.key,
    required this.label,
    this.icon,
    this.verticalPaddingValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 2.w),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: verticalPaddingValue ?? 0.5.h,
          horizontal: 5.w,
        ),
        decoration: BoxDecoration(
          color: AppCommonColors.disabledFieldColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: AppCommonColors.disabledFieldColorBorder,
          ),
        ),
        child: Row(
          children: [
            if (icon != null) icon.asSvgImage(rightPadding: 2.w),
            Text(
              label,
              style: context.textTheme.labelSmall!.copyWith(
                color: AppCommonColors.detailsDirtyWhiteTextColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ListingDetail extends StatefulWidget {
  const ListingDetail({super.key});

  @override
  State<ListingDetail> createState() => _ListingDetailState();
}

class ListingDetailAppbarButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;
  final Color? iconColor;
  final Color? backgroundColor;

  const ListingDetailAppbarButton(
      {super.key,
      required this.onPressed,
      required this.icon,
      this.iconColor,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.zero,
        shape: const CircleBorder(),
      ),
      child: Icon(
        icon,
        color: iconColor ?? Colors.black,
      ),
    );
  }
}

class PropertyCard extends StatelessWidget {
  final String name;
  final int price;
  final String location;
  final double rating;

  const PropertyCard(
      {super.key,
      required this.name,
      required this.price,
      required this.location,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[300],
              child: const Center(
                child: Icon(Icons.photo, size: 50),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('\$$price/month'),
                Text(location),
                Text('⭐ $rating'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String name;
  final String review;
  final int rating;
  final int daysAgo;

  const ReviewCard(
      {super.key,
      required this.name,
      required this.review,
      required this.rating,
      required this.daysAgo});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(name),
        subtitle: Text('$review\n$daysAgo days ago'),
        trailing: const Icon(Icons.star, color: Colors.yellow),
      ),
    );
  }
}

class _ListingDetailState extends State<ListingDetail> {
  final List<Map<String, dynamic>> facilities = [
    {
      'icon': Assets.svg.bedroomIcon,
      'label': '2 Bedrooms',
    },
    {
      'icon': Assets.svg.bathroomIcon,
      'label': '1 Bathroom',
    },
    {
      'icon': Assets.svg.fullyFurnished,
      'label': 'Fully Furnished',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Assets.images.help.home.path.asAssetImage(),
                SafeArea(
                  child: Row(
                    children: [
                      ListingDetailAppbarButton(
                        icon: Icons.arrow_back_ios,
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
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Airport Residential',
                      style: context.textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          '\$200',
                          style: context.textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp,
                          ),
                        ),
                        Text(
                          'per month',
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
                      'Accra, Ghana',
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
                        vertical: 1.5.h,
                        horizontal: 5.w,
                      ),
                      decoration: BoxDecoration(
                        color: AppCommonColors.mainBlueButton,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'Rent',
                        style: context.textTheme.labelMedium!.copyWith(
                          color: Colors.white,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 1.5.h,
                        horizontal: 5.w,
                      ),
                      decoration: BoxDecoration(
                        color: AppCommonColors.disabledFieldColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'Buy',
                        style: context.textTheme.labelMedium!.copyWith(
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
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
                itemBuilder: (context, index) => FacilityChip(
                    icon: facilities[index]['icon'],
                    label: facilities[index]['label']),
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
                      fontSize: 18.sp,
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
                top: 2.h,
                bottom: 2.h,
                left: 4.5.w,
              ),
              height: 5.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: facilities.length,
                itemBuilder: (context, index) =>
                    FacilityChip(label: otherFacilities[index]),
              ),
            ),
            _buildMapCard(context).onlyPadding(0, 3.h, 4.5.w, 4.5.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What this place offers',
                  style: context.textTheme.labelMedium!.copyWith(
                    fontSize: 18.sp,
                  ),
                ),
                ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  shrinkWrap: true,
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: amenities.length,
                  itemBuilder: (context, index) {
                    return _buildAmenity(
                      context,
                      icon: amenities[index]['icon'],
                      label: amenities[index]['label'],
                    );
                  },
                ),
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
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Assets.images.help.ghLogo.path.asAssetImage(
                      height: 50.0,
                      width: 50.0,
                    ),
                  ),
                  minTileHeight: 37.sp,
                  enabled: false,
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'GH Properties',
                        style: context.textTheme.labelMedium!.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        'Real Estate Agency',
                        style: context.textTheme.bodyMedium!.copyWith(
                          fontSize: 11.sp,
                        ),
                      ),
                    ],
                  ),
                  trailing: Assets.svg.chat.asSvgImage(),
                ),

                const SizedBox(height: 8),
                const Text('⭐ 3 Reviews'),
                const Text('✅ Identity verified'),
                const SizedBox(height: 8),
                const Text('Information for Users',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const Text(
                    'I will be available on site. When I\'m not on site you can reach me via text, phone or through Terra.'),
                const SizedBox(height: 8),
                const Text('Language: English'),
                const Text('Response rate: 80%'),
                const SizedBox(height: 8),
                const Text('Email: ghproperties@gmail.com'),
                const Text('Phone: +233 123 456 789'),
                const Text('Response time: within an hour'),

                // Reviews Section
                Text(
                  'Reviews',
                  style: context.textTheme.labelMedium!.copyWith(
                    fontSize: 18.sp,
                  ),
                ),

                Container(),

                const SizedBox(height: 8),
                const ReviewCard(
                  name: 'Kurt Mullins',
                  review:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
                  rating: 5,
                  daysAgo: 8,
                ),
                const ReviewCard(
                  name: 'Kay Swanson',
                  review:
                      'Sed ut perspiciatis unde omnis iste natus error sit voluptatem...',
                  rating: 5,
                  daysAgo: 12,
                ),
                CustomDetailsButton(
                  onPressed: () {},
                  label: 'View all reviews',
                ),
                const Divider(),

                // Nearby Locations Section
                Text(
                  'Nearby From this Location',
                  style: context.textTheme.labelMedium!.copyWith(
                    fontSize: 18.sp,
                  ),
                ),
                const SizedBox(height: 8),
                GridView.count(
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: const [
                    PropertyCard(
                        name: 'Wings Tower',
                        price: 220,
                        location: 'Accra, Ghana',
                        rating: 4.2),
                    PropertyCard(
                        name: 'Sky Dandelions',
                        price: 190,
                        location: 'Accra, Ghana',
                        rating: 4.9),
                    PropertyCard(
                        name: 'Wings Tower',
                        price: 220,
                        location: 'Accra, Ghana',
                        rating: 4.2),
                    PropertyCard(
                        name: 'Wings Tower',
                        price: 220,
                        location: 'Accra, Ghana',
                        rating: 4.2),
                  ],
                ),
              ],
            ).horizontalPadding(4.5.w),
          ],
        ),
      ),
    );
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
          style: context.textTheme.bodyMedium!.copyWith(fontSize: 16.sp),
        ),
      ],
    );
  }

  Container _buildMapCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppCommonColors.disabledFieldColor,
        borderRadius: BorderRadius.circular(25.sp),
      ),
      width: context.width,
      clipBehavior: Clip.antiAlias,
      child: Expanded(
        child: Column(
          children: [
            Container(
              color: Colors.red,
              height: 25.h,
            ),
            CustomButton(
              text: 'View all on map',
              onPressed: () {},
              horizontalPadding: 0,
              borderRadius: 0,
              backgroundColor: AppCommonColors.disabledFieldColor,
              borderColor: Colors.transparent,
              textStyle: context.textTheme.bodyMedium!.copyWith(
                fontSize: 13.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
