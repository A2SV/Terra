import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/text_theme.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/widgets/add_listing_bottom_sheet_modal.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/widgets/add_listing_property_feature_counter.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/widgets/add_listing_text_form_field.dart';
import 'package:mobile/src/features//dashboard/presentation/pages/widgets/add_listing_check_box.dart';
import 'package:mobile/src/features/dashboard/presentation/widgets/add_listing_search_input.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/features/da'
    'shboard/presentation/widgets/filter_button.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../../../../gen/fonts.gen.dart';
import '../../../../core/theme/app_light_theme_colors.dart';
import '../../../../core/utils/utils.dart';

class AddListingHotel extends StatefulWidget {
  const AddListingHotel({super.key});
  @override
  State<AddListingHotel> createState() => _AddListingHotelState();
}

class Amenity {
  String name;
  late bool isSelected;
  Amenity({
    required this.name,
    this.isSelected = false,
  });
}

class Feature {
  String name;
  late bool isSelected;
  Feature({
    required this.name,
    this.isSelected = false,
  });
}

class RadioItem {
  String name;
  late String value;
  RadioItem({
    required this.name,
    required this.value,
  });
}

class _AddListingHotelState extends State<AddListingHotel> {
  final _formKey = GlobalKey<FormState>();
  final _propertySizeController = TextEditingController();
  String _furnishedStatus = 'None';
  String _starRating = '';
  String _restaurantOnsite = '';
  final SfRangeValues _values = const SfRangeValues(30, 59);
  List<Amenity> amenities = [
    Amenity(name: 'Wifi'),
    Amenity(name: 'Balcony'),
    Amenity(name: 'Security'),
    Amenity(name: 'Balcony'),
    Amenity(name: 'Free Parking'),
    Amenity(name: 'Kitchen'),
    Amenity(name: 'Air Conditioner')
  ];
  List<RadioItem> starRatings = [
    RadioItem(name: '1-star', value: '1-star'),
    RadioItem(name: '2-stars', value: '2-stars'),
    RadioItem(name: '3-stars', value: '3-stars'),
    RadioItem(name: '4-stars', value: '4-stars'),
    RadioItem(name: '5-stars', value: '5-stars')
  ];
  List<RadioItem> restaurantOnsite = [
    RadioItem(name: 'Yes', value: 'Yes'),
    RadioItem(name: 'No', value: 'No')
  ];
  List<RadioItem> furnishedStatus = [
    RadioItem(name: 'Full', value: 'Full'),
    RadioItem(name: 'Partial', value: 'Partial'),
    RadioItem(name: 'None', value: 'None')
  ];
  List<Feature> studentHousingAmenities = [
    Feature(name: 'Study Area'),
    Feature(name: 'Laundry Service'),
    Feature(name: 'Cleaning Service'),
    Feature(name: 'Shared Facilities'),
    Feature(name: 'Meal Plan')
  ];
  List<Feature> roomServices = [
    Feature(name: 'Laundry Service'),
    Feature(name: 'Cleaning Service')
  ];

  late bool _isButtonDisabled;

  @override
  void initState() {
    _isButtonDisabled = false;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shadowColor: Colors.black.withOpacity(0.5),
          elevation: 0.5,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios), // Custom back button icon
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  child: SizedBox(
                    width: 92.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 92.w,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Add Listing',
                            style: CustomTextStyles.kDefaultTextTheme(
                                    AppLightThemeColors.kBlackTextColor)
                                .bodySmall
                                ?.copyWith(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: FontFamily.nunito,
                                ),
                          ),
                        ), //add listing
                        SizedBox(
                          height: 5.h,
                        ),
                        SizedBox(
                            width: 92.w,
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: 'Almost finished',
                                style: CustomTextStyles.kDefaultTextTheme(
                                        AppCommonColors.mainBlueButton)
                                    .titleLarge,
                              ),
                              TextSpan(
                                text: ', complete your property listing',
                                style: CustomTextStyles.kDefaultTextTheme(
                                        Colors.black)
                                    .titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                            ]))), //almost finished
                        SizedBox(
                          height: 3.h,
                        ),
                        SizedBox(
                          width: 92.w,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Property Features',
                                  style: CustomTextStyles.kDefaultTextTheme(
                                          Colors.black)
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      width: 95.w,
                                      margin: EdgeInsets.all(2.w),
                                      child: const AddListingPropertyFeatureCounter(
                                          label: 'Bedroom(s)'),
                                    ),
                                    Container(
                                      width: 95.w,
                                      margin: EdgeInsets.all(2.w),
                                      child: const AddListingPropertyFeatureCounter(
                                          label: 'Bathroom(s)'),
                                    ),
                                    Container(
                                      width: 95.w,
                                      margin: EdgeInsets.all(2.w),
                                      child: const AddListingPropertyFeatureCounter(
                                          label: 'Washroom(s)'),
                                    ),
                                    Container(
                                      width: 95.w,
                                      margin: EdgeInsets.all(2.w),
                                      child: const AddListingPropertyFeatureCounter(
                                          label: 'Kitchen(s)'),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ), //property studentHousingAmenities
                        SizedBox(
                          height: 2.h,
                        ),

                        SizedBox(
                          width: 92.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Property Size',
                                  style: CustomTextStyles.kDefaultTextTheme(
                                          Colors.black)
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                              ),
                              AddListingTextFormField(
                                  inputController: _propertySizeController,
                                  width: 95.w,
                                  labelText:
                                      'Enter property size in square meters',
                                  validator: (size) =>
                                      CustomValidator.isNotEmpty(size ?? " ")),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 2.h,
                        ),

                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Room Service',
                            style:
                                CustomTextStyles.kDefaultTextTheme(Colors.black)
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          width: 92.w,
                          child: Wrap(
                            children: roomServices.map((feature) {
                              return SizedBox(
                                width: 30.w,
                                child: AddListingCheckBox(
                                  isActive: feature.isSelected,
                                  label: feature.name,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      feature.isSelected = value!;
                                    });
                                  },
                                ),
                              );
                            }).toList(),
                          ),
                        ),

                        SizedBox(
                          height: 2.h,
                        ),

                        Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Star Rating',
                                style: CustomTextStyles.kDefaultTextTheme(
                                        Colors.black)
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              width: 100.w,
                              child: Wrap(
                                children: starRatings.map((status) {
                                  return SizedBox(
                                    width: 25.w,
                                    child: Row(
                                      children: [
                                        Radio<String>(
                                          value: status.value,
                                          groupValue: _starRating,
                                          onChanged: (String? value) {
                                            setState(() {
                                              _starRating = value!;
                                            });
                                          },
                                          fillColor:
                                              WidgetStateColor.resolveWith(
                                                  (states) => AppCommonColors
                                                      .mainBlueButton),
                                        ),
                                        Text(status.name)
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ), //furnished status
                          ],
                        ),

                        SizedBox(
                          height: 2.h,
                        ),

                        Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Restaurant on-site',
                                style: CustomTextStyles.kDefaultTextTheme(
                                        Colors.black)
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: restaurantOnsite.map((status) {
                                  return Row(
                                    children: [
                                      Radio<String>(
                                        value: status.value,
                                        groupValue: _restaurantOnsite,
                                        onChanged: (String? value) {
                                          setState(() {
                                            _restaurantOnsite = value!;
                                          });
                                        },
                                        fillColor:
                                            WidgetStateColor.resolveWith(
                                                (states) => AppCommonColors
                                                    .mainBlueButton),
                                      ),
                                      Text(status.name)
                                    ],
                                  );
                                }).toList(),
                              ),
                            ), //furnished status
                          ],
                        ),

                        SizedBox(
                          height: 2.h,
                        ),

                        Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Furnished Status',
                                style: CustomTextStyles.kDefaultTextTheme(
                                        Colors.black)
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: furnishedStatus.map((status) {
                                  return Row(
                                    children: [
                                      Radio<String>(
                                        value: status.value,
                                        groupValue: _furnishedStatus,
                                        onChanged: (String? value) {
                                          setState(() {
                                            _furnishedStatus = value!;
                                          });
                                        },
                                        fillColor:
                                            WidgetStateColor.resolveWith(
                                                (states) => AppCommonColors
                                                    .mainBlueButton),
                                      ),
                                      Text(status.name)
                                    ],
                                  );
                                }).toList(),
                              ),
                            ), //furnished status
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),

                        SizedBox(
                          width: 92.w,
                          child: Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Additional Amenities',
                                  style: CustomTextStyles.kDefaultTextTheme(
                                          Colors.black)
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              const AddListingSearchInput(
                                fillColor: AppCommonColors.searchFieldFillColor,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Wrap(
                                children: amenities.map((amenity) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 3),
                                    child: FilterButton(
                                      text: amenity.name,
                                      onSelect: () {
                                        setState(() {
                                          amenity.isSelected =
                                              !amenity.isSelected;
                                        });
                                      },
                                      isSelected: amenity.isSelected ?? false,
                                      hasShadow: false,
                                      size: 15,
                                    ),
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 2.h,
                        ),

                        CustomButton(
                          width: 95.w,
                          horizontalPadding: 5,
                          text: 'Next',
                          disabled: _isButtonDisabled,
                          onPressed: () {
                            setState(() {
                              _isButtonDisabled =
                                  _propertySizeController.text == '';
                              AddListingBottomSheetModal(
                                context: context,
                                error: false,
                              );
                            });
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    ),
                  )),
            )));
  }
}
