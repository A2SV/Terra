import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/src/core/theme/app_light_theme_colors.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';
import 'package:mobile/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:mobile/src/features/dashboard/presentation/widgets/filter_button.dart';
import 'package:mobile/src/features/dashboard/presentation/widgets/homepage_card.dart';
import 'package:mobile/src/features/dashboard/presentation/widgets/listings_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _filters = [
    "Any",
    "Apartment",
    "Shop",
    "Office",
    "Shared",
    "Commercial",
    "Residential",
    "Student hostels",
    "Warehouse"
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<DashboardBloc, DashboardState>(
        listener: (context, state) {
          if (state is DashboardError) {
            CustomSnackBar.errorSnackBar(
                context: context, message: state.message);
          }
        },
        builder: (context, state) {
          return DefaultTabController(
            length: 2,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (Platform.isAndroid) SizedBox(height: 2.h),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 2.w, right: 2.w, bottom: 1.3.h),
                    child: const HomepageCard(),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 4.5.w, top: 1.3.h, bottom: 1.3.h),
                    child: Text(
                      "Welcome to Terra",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.5.sp,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 6.2.h,
                      width: 85.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.w),
                        color: AppLightThemeColors.kMainLightButton,
                        border: Border.all(
                          color: AppLightThemeColors
                              .kMainLightButtonBorder, // Set the border color here
                          width: 1.0, // Set the border width here
                        ),
                      ),
                      child: TabBar(
                        splashFactory: NoSplash.splashFactory,
                        dividerHeight: 0,
                        padding: EdgeInsets.symmetric(
                          vertical: 0.7.h,
                          horizontal: 1.w,
                        ),
                        labelStyle: TextStyle(
                          fontSize: 17.sp,
                          fontFamily: "Nunito",
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.sp),
                          color: AppLightThemeColors.kMainBlueButton,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.27),
                              blurRadius: 30,
                              offset: Offset(
                                  3.w, 2.h), // changes position of shadow
                            ),
                          ],
                        ),
                        labelColor: Colors.white,
                        unselectedLabelColor:
                            AppLightThemeColors.kLightTextColor,
                        tabs: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: const Tab(text: "Residential"),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: const Tab(text: "Commercial"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 1.3.h),
                  SizedBox(
                    height: 6.h,
                    child: ListView.builder(
                      clipBehavior: Clip.none,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: _filters.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            index == 0
                                ? SizedBox(width: 4.5.w)
                                : SizedBox(width: 3.w),
                            FilterButton(
                              text: _filters[index],
                              onSelect: () {
                                onFilterButtonPress(index);
                              },
                              isSelected: index == _selectedIndex,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  if (state is DashboardSuccess) ...[
                    Padding(
                      padding: EdgeInsets.only(left: 4.5.w, top: 2.5.h),
                      child: Text(
                        "Near your location",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.5.sp,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.5.w, right: 12.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "243 properties in Accra",
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: AppLightThemeColors.kLightTextColor,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              "See all",
                              style: TextStyle(
                                color: AppLightThemeColors.kMainBlueButton,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (state.listings.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.5.w, vertical: 2.h),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.listings.length,
                          primary: false,
                          itemBuilder: (context, index) {
                            return ListingsCard(
                              listing: state.listings[index],
                            );
                          },
                        ),
                      )
                    else
                      const Center(
                        child: Text("No listings found"),
                      ),
                  ] else if (state is DashboardLoading)
                    const Center(
                      child: CircularProgressIndicator.adaptive(),
                    )
                  else if (state is DashboardError)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 3.h),
                      child: CustomButton(
                          text: 'Retry',
                          backgroundColor: Colors.red,
                          borderColor: Colors.transparent,
                          onPressed: () {
                            context
                                .read<DashboardBloc>()
                                .add(GetAllListingsEvent());
                          }),
                    )
                  // Padding(
                  //   padding: EdgeInsets.only(left: 4.5.w, right: 12.w),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         "Top rated",
                  //         style: TextStyle(
                  //           color: Colors.black,
                  //           fontWeight: FontWeight.w700,
                  //           fontSize: 16.5.sp,
                  //         ),
                  //       ),
                  //       GestureDetector(
                  //         onTap: () {},
                  //         child: const Text(
                  //           "See all",
                  //           style: TextStyle(
                  //             color: AppLightThemeColors.kMainBlueButton,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 3.5.w, vertical: 2.h),
                  //   child: ListView.builder(
                  //     shrinkWrap: true,
                  //     physics: const NeverScrollableScrollPhysics(),
                  //     itemCount: 2,
                  //     itemBuilder: (context, index) {
                  //       return const ListingsCard(
                  //           startingPrice: 1600000,
                  //           propertyType: "Residential",
                  //           title: "Airport residential, Accra",
                  //           location: "Lane Avenue 12, Zebra street",
                  //           bedroomNumber: 4,
                  //           washroomNumber: 3,
                  //           landSize: "7,179 to 20,462 acres",
                  //           isPremium: true,
                  //           imageUrl:
                  //               "https://s3-alpha-sig.figma.com/img/a8d8/f9f2/f36a2800fda83ededb3075f62df728f8?Expires=1721606400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=k12xKy-MoEtQnYGlVSpJUq3s2JYmzUSu1h3wjKom1ci31k4nJu-8t24S9FqkLAGvt0aYmmTs4x9Vt4AsKc8SDwADdAsDJNJfqUqycSZ~viVRlCnGHW9-vNv7YrXrC2MUpcKxTHElAvSpxX9G1NgDtbbnvzv2lrSMNighcR-NA~eOBU0ea-e1frqu5EkjRO3LL3JrOCF5Xr5OhEZ1iWEGDVwtGf~oqA7QKo6T4cxxg~Y2f1NOiSzikuqeiMMa00tXcvjT3bmR7c15cngL0tgpk-0K~4bG-~5rn3xfb7V1JVsPQ1ux9UUTPYM-UTYOcLPKjioiDjRjV5vGBnb8lUfKow__",
                  //           profileImageUrl:
                  //               "https://s3-alpha-sig.figma.com/img/73bb/c414/2ae566f2ad16ff007a811f356417a725?Expires=1721606400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=YrrqXp8acdsMllZnYPtvAyPLDbjdeKlqUcAcNHmFiMwqrY1c8ooaX1bGqex3p-HdSWPrMIltRwUJ9eIjETjKVjhem3WyM-PFH9rh8YlPh4RROa-q7JCXjByrW~ozS4jS~xp4IkPo9SRVHe-Bf6XvI-AP~ORx0RIx~XPBBRoXwHdpAx26JQIZAw3f-X5MjvTWeap5ktoh3DMGUxE38jIh1hLXadeuCo2s8XqTna3jgozoQrjiWQxvlJKq8OIrKwxFzjIErW~rlHtusy7PpZS2y7jHxIp~kJfQPOGjIJsWP9G0J2N92QD6l3j-bXbIWYU0oEYnDr05cuTwOpBUU1JzXg__");
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void onFilterButtonPress(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
