import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/src/core/routes/routes.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/utils/currency_formatter.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';
import 'package:mobile/src/core/widgets/custom_loader.dart';
import 'package:mobile/src/features/dashboard/presentation/bloc/conpare_listings_bloc/conpare_listings_bloc.dart';
import 'package:mobile/src/features/dashboard/presentation/widgets/search_input.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../../core/theme/app_light_theme_colors.dart';
import '../../../../core/theme/text_theme.dart';

class ComparePage {
  final String image;
  final String location;
  final String type;
  final int bedrooms;
  final String price;
  final String size;

  ComparePage({
    required this.image,
    required this.location,
    required this.price,
    required this.type,
    required this.bedrooms,
    required this.size,
  });
}

class CompareListingPage extends StatefulWidget {
  const CompareListingPage({super.key});


  @override
  State<CompareListingPage> createState() => _CompareListingPageState();
}

class _CompareListingPageState extends State<CompareListingPage> {
  late PageController pageController;
  List<ComparePage> pages = [];

  int currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    _fetchListsingsInfo();
  }

  void _fetchListsingsInfo() {
    List compare = context.read<SelectedListsingsCubit>().state;
    if (compare.length >= 2) {
      context.read<CompareListingsBloc>().add(CompareListings(
          id1: compare[compare.length - 2], id2: compare[compare.length - 1]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.5.w),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 3.h,
              ),
              const TopBarSearchInput(
                sideContainerColor: Color.fromRGBO(242, 242, 243, 1),
                sideCotainerTextColor: AppCommonColors.fieldBorderColor,
                searchBackgroundColor: Color.fromRGBO(242, 242, 243, 1),
              ),
              SizedBox(
                height: 3.h,
              ),
              Stack(
                children: [
                  SizedBox(
                    width: 91.w,
                    height: 4.4.h,
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Text(
                      'Compare Listings',
                      style: CustomTextStyles.kDefaultTextTheme(
                              AppLightThemeColors.kBlackTextColor)
                          .bodySmall
                          ?.copyWith(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                    ),
                  ),
                  Positioned(
                    right: 35.w,
                    top: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppCommonColors.mainBlueButton,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1.3.w),
                        child: Text(
                          '${(context.watch<SelectedListsingsCubit>().state).length}',
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.kDefaultTextTheme(
                                  AppLightThemeColors.kBlackTextColor)
                              .bodySmall
                              ?.copyWith(
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Text(
                'Compare multiple listings side by side. Get a comprehensive overview of properties, including key details, amenities, and pricing.',
                style: CustomTextStyles.kDefaultTextTheme(
                        AppLightThemeColors.kBlackTextColor)
                    .bodySmall
                    ?.copyWith(
                      fontSize: 14.sp,
                      color: AppCommonColors.fieldBorderColor,
                    ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      text: 'Back to Home',
                      onPressed: () {
                        popScreen(context);
                      },
                      width: 40.w,
                      height: 6.h,
                      borderColor: Colors.white,
                      horizontalPadding: 0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomButton(
                          text: '',
                          width: 11.w,
                          height: 6.h,
                          horizontalPadding: 0,
                          onPressed: () {
                            pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInCubic,
                            );
                          },
                          borderColor: currentIndex == 0
                              ? AppCommonColors.fieldBorderColor
                              : Colors.white,
                          showSuffixWidget: true,
                          backgroundColor: currentIndex == 0
                              ? Colors.white
                              : AppCommonColors.mainBlueButton,
                          suffixWidget: Icon(
                            Icons.arrow_back_ios_new,
                            color:
                                currentIndex == 0 ? Colors.black : Colors.white,
                            size: 16.sp,
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        CustomButton(
                          text: '',
                          height: 6.h,
                          borderColor: currentIndex == pages.length - 1
                              ? AppCommonColors.fieldBorderColor
                              : Colors.white,
                          backgroundColor: currentIndex == pages.length - 1
                              ? Colors.white
                              : AppCommonColors.mainBlueButton,
                          horizontalPadding: 0,
                          width: 11.w,
                          onPressed: () {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          showSuffixWidget: true,
                          suffixWidget: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: currentIndex == pages.length - 1
                                ? Colors.black
                                : Colors.white,
                            size: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              BlocConsumer<CompareListingsBloc, CompareListingsState>(
                listener: (context, state) {
                  if (state is CompareListingsError) {
                    CustomSnackBar.errorSnackBar(
                      context: context,
                      message: state.message,
                    );
                  }

                  if (state is CompareListingsSuccess) {
                    debugPrint(state.listing1.propertyPhotos.first.url);
                    pages.add(ComparePage(
                      image: state.listing1.propertyPhotos.first.url,
                      location: state.listing1.propertyLocation.city,
                      price: formatMoney(double.parse(state.listing1.paymentInformation.cost)),
                      type: state.listing1.propertyType.name,
                      bedrooms: 4,
                      size: state.listing1.propertySize,
                    ));
                    pages.add(ComparePage(
                      image: state.listing2.propertyPhotos.first.url,
                      location: state.listing2.propertyLocation.city,
                      price: formatMoney(double.parse(state.listing2.paymentInformation.cost)),
                      type: state.listing2.propertyType.name,
                      bedrooms: 4,
                      size: state.listing1.propertySize,
                    ));
                  }
                },
                builder: (context, state) {
                  if (state is CompareListingsLoading) {
                    return const Expanded(
                      child: Center(
                        child: CustomLoader(),
                      ),
                    );
                  }

                  if (state is! CompareListingsSuccess) {
                    return const SizedBox();
                  }
                  return Expanded(
                    child: PageView.builder(
                      itemCount: pages.length,
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      controller: pageController,
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: pages[index].image,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.h),
                                child: Text(
                                  'Beautiful home located in ${pages[index].location}',
                                  style: CustomTextStyles.kDefaultTextTheme(
                                          AppLightThemeColors.kBlackTextColor)
                                      .bodySmall
                                      ?.copyWith(
                                          fontSize: 18.3.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black),
                                ),
                              ),
                              Container(
                                width: 82.w,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppCommonColors.fieldBorderColor,
                                        width: 0.05)),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          2.w, 1.5.h, 5.w, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Price',
                                            style: CustomTextStyles
                                                    .kDefaultTextTheme(
                                                        AppLightThemeColors
                                                            .kBlackTextColor)
                                                .bodySmall
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                  fontSize: 16.sp,
                                                ),
                                          ),
                                          Text(
                                            'GHC ${pages[index].price}',
                                            style: const TextStyle(
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 2.w),
                                      child: const Divider(
                                        thickness: 0.05,
                                        color: AppCommonColors.fieldBorderColor,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          2.w, 1.5.h, 5.w, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Property Type',
                                            style: CustomTextStyles
                                                    .kDefaultTextTheme(
                                                        AppLightThemeColors
                                                            .kBlackTextColor)
                                                .bodySmall
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                  fontSize: 16.sp,
                                                ),
                                          ),
                                          Text('Apartments',
                                              style: CustomTextStyles
                                                      .kDefaultTextTheme(
                                                          AppLightThemeColors
                                                              .kBlackTextColor)
                                                  .bodySmall
                                                  ?.copyWith(
                                                      color: AppCommonColors
                                                          .fieldBorderColor)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 2.w),
                                      child: const Divider(
                                        thickness: 0.05,
                                        color: AppCommonColors.fieldBorderColor,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          2.w, 1.5.h, 5.w, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Bedrooms',
                                              style: CustomTextStyles
                                                      .kDefaultTextTheme(
                                                          AppLightThemeColors
                                                              .kBlackTextColor)
                                                  .bodySmall
                                                  ?.copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                    fontSize: 16.sp,
                                                  )),
                                          Text('4',
                                              style: CustomTextStyles
                                                      .kDefaultTextTheme(
                                                          AppLightThemeColors
                                                              .kBlackTextColor)
                                                  .bodySmall
                                                  ?.copyWith(
                                                      color: AppCommonColors
                                                          .fieldBorderColor)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 2.w),
                                      child: const Divider(
                                        thickness: 0.05,
                                        color: AppCommonColors.fieldBorderColor,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          2.w, 1.5.h, 5.w, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Bathrooms',
                                            style: CustomTextStyles
                                                    .kDefaultTextTheme(
                                                        AppLightThemeColors
                                                            .kBlackTextColor)
                                                .bodySmall
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                  fontSize: 16.sp,
                                                ),
                                          ),
                                          const Text(
                                            '3',
                                            style: TextStyle(
                                                color: AppCommonColors
                                                    .fieldBorderColor),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 2.w),
                                      child: const Divider(
                                        thickness: 0.05,
                                        color: AppCommonColors.fieldBorderColor,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          2.w, 1.5.h, 5.w, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Area',
                                            style: CustomTextStyles
                                                    .kDefaultTextTheme(
                                                        AppLightThemeColors
                                                            .kBlackTextColor)
                                                .bodySmall
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                  fontSize: 16.sp,
                                                ),
                                          ),
                                          Text(
                                            pages[index].location,
                                            style: CustomTextStyles
                                                    .kDefaultTextTheme(
                                                        AppLightThemeColors
                                                            .kBlackTextColor)
                                                .bodySmall
                                                ?.copyWith(
                                                    color: AppCommonColors
                                                        .fieldBorderColor),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 2.w),
                                      child: const Divider(
                                        thickness: 0.05,
                                        color: AppCommonColors.fieldBorderColor,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          2.w, 1.5.h, 5.w, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Property Size',
                                            style: CustomTextStyles
                                                    .kDefaultTextTheme(
                                                        AppLightThemeColors
                                                            .kBlackTextColor)
                                                .bodySmall
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                  fontSize: 16.sp,
                                                ),
                                          ),
                                          Text(
                                            '${pages[index].size} ft2',
                                            style: CustomTextStyles
                                                    .kDefaultTextTheme(
                                                        AppLightThemeColors
                                                            .kBlackTextColor)
                                                .bodySmall
                                                ?.copyWith(
                                                    color: AppCommonColors
                                                        .fieldBorderColor),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 2.w),
                                      child: const Divider(
                                        thickness: 0.05,
                                        color: AppCommonColors.fieldBorderColor,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          2.w, 1.5.h, 5.w, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Property Features',
                                              style: CustomTextStyles
                                                      .kDefaultTextTheme(
                                                          AppLightThemeColors
                                                              .kBlackTextColor)
                                                  .bodySmall
                                                  ?.copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                    fontSize: 16.sp,
                                                  )),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text('Administrative support,',
                                                  style: CustomTextStyles
                                                          .kDefaultTextTheme(
                                                              AppLightThemeColors
                                                                  .kBlackTextColor)
                                                      .bodySmall
                                                      ?.copyWith(
                                                          fontSize: 15.sp,
                                                          color: AppCommonColors
                                                              .fieldBorderColor)),
                                              Text('Allows Stove and Oven,',
                                                  style: CustomTextStyles
                                                          .kDefaultTextTheme(
                                                              AppLightThemeColors
                                                                  .kBlackTextColor)
                                                      .bodySmall
                                                      ?.copyWith(
                                                          fontSize: 15.sp,
                                                          color: AppCommonColors
                                                              .fieldBorderColor)),
                                              Text('Balcony, Lift',
                                                  style: CustomTextStyles
                                                          .kDefaultTextTheme(
                                                              AppLightThemeColors
                                                                  .kBlackTextColor)
                                                      .bodySmall
                                                      ?.copyWith(
                                                          fontSize: 15.sp,
                                                          color: AppCommonColors
                                                              .fieldBorderColor)),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 2.w),
                                      child: const Divider(
                                        thickness: 0.05,
                                        color: AppCommonColors.fieldBorderColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 3.h),
                                child: CustomButton(
                                  text: 'View Listing',
                                  height: 5.5.h,
                                  width: 50.w,
                                  borderColor: Colors.white,
                                  onPressed: () {
                                    switchScreen(
                                      context: context,
                                      routeName: AppRoutes.listingDetail,
                                      extra: index == 1
                                          ? state.listing2.id
                                          : state.listing1.id,
                                    );
                                  },
                                  showPrefixWidget: true,
                                  prefixWidget: Padding(
                                    padding: EdgeInsets.only(left: 5.w),
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 19.sp,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
