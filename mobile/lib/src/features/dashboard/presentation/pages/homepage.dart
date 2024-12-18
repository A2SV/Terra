import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/src/core/routes/routes.dart';
import 'package:mobile/src/core/theme/app_light_theme_colors.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';
import 'package:mobile/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:mobile/src/features/dashboard/presentation/widgets/filter_button.dart';
import 'package:mobile/src/features/dashboard/presentation/widgets/homepage_card.dart';
import 'package:mobile/src/features/dashboard/presentation/widgets/listings_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/text_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<DashboardBloc>().add(GetAllListingsEvent());
    super.initState();
  }

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
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (context, state) {
        if (state is DashboardError) {
          if (state.message.isNotEmpty) {
            CustomSnackBar.errorSnackBar(
                context: context, message: state.message);
          }
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
                const HomepageCard(),
                Padding(
                  padding:
                      EdgeInsets.only(left: 4.5.w, top: 1.3.h, bottom: 2.h),
                  child: Text(
                    "Browse by Category",
                    style: CustomTextStyles.kDefaultTextTheme(
                            AppLightThemeColors.kBlackTextColor)
                        .bodySmall
                        ?.copyWith(
                          color: AppCommonColors.homePageBlackColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 17.sp,
                        ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 5.5.h,
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
                        vertical: 0.5.h,
                        horizontal: 1.w,
                      ),
                      labelStyle: CustomTextStyles.kDefaultTextTheme(
                              AppLightThemeColors.kBlackTextColor)
                          .bodySmall
                          ?.copyWith(
                            fontSize: 15.sp,
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
                            offset:
                                Offset(3.w, 2.h), // changes position of shadow
                          ),
                        ],
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: AppLightThemeColors.kLightTextColor,
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
                SizedBox(height: 1.5.h),
                SizedBox(
                  height: 5.h,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
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
                            size: 14.5.sp,
                            isSelected: index == _selectedIndex,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                if (state is DashboardSuccess) ...[
                  Padding(
                    padding:
                        EdgeInsets.only(left: 4.5.w, top: 2.5.h, bottom: 0.3.h),
                    child: Text(
                      "Near your location",
                      style: CustomTextStyles.kDefaultTextTheme(
                              AppLightThemeColors.kBlackTextColor)
                          .bodySmall
                          ?.copyWith(
                            color: AppCommonColors.homePageBlackColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 17.sp,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${state.listings.length} properties in Accra",
                          style: CustomTextStyles.kDefaultTextTheme(
                                  AppLightThemeColors.kBlackTextColor)
                              .bodySmall
                              ?.copyWith(
                                fontSize: 15.sp,
                                color: AppLightThemeColors.kLightTextColor,
                              ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "See all",
                            style: CustomTextStyles.kDefaultTextTheme(
                                    AppLightThemeColors.kBlackTextColor)
                                .bodySmall
                                ?.copyWith(
                                  color: AppLightThemeColors.kMainBlueButton,
                                  fontSize: 15.sp,
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
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              switchScreen(
                                context: context,
                                routeName: AppRoutes.listingDetail,
                                extra: state.listings[index].id,
                              );
                            },
                            child: ListingsCard(
                              listing: state.listings[index],
                            ),
                          );
                        },
                      ),
                    )
                  else
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 3.h, horizontal: 10.w),
                      child: const Center(
                        child: Text("No listings found"),
                      ),
                    ),
                ] else if (state is DashboardLoading)
                  Padding(
                    padding: EdgeInsets.all(6.h),
                    child: const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  )
                else if (state is DashboardError)
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 6.h),
                        child: const Text('Something went wrong'),
                      ),
                      CustomButton(
                        text: 'Retry',
                        backgroundColor: Colors.red,
                        borderColor: Colors.transparent,
                        onPressed: () {
                          context
                              .read<DashboardBloc>()
                              .add(GetAllListingsEvent());
                        },
                      ),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  void onFilterButtonPress(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
