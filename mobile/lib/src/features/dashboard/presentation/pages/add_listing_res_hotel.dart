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

class AddListingResHotel extends StatefulWidget {
  const AddListingResHotel({super.key});
  @override
  State<AddListingResHotel> createState() => _AddListingResHotelState();
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

class _AddListingResHotelState extends State<AddListingResHotel> {
  final _formKey = GlobalKey<FormState>();
  final _propertySizeController = TextEditingController();
  String _furnishedStatus = 'None';
  String _starRating = '';
  String _restaurantOnsite = '';
  SfRangeValues _values = const SfRangeValues(30, 59);
  List<Amenity> amenities = [
    Amenity(name: 'Wifi'),
    Amenity(name: 'Balcony'),
    Amenity(name: 'Security'),
    Amenity(name: 'Balcony'),
    Amenity(name: 'Free Parking'),
    Amenity(name: 'Kitchen'),
    Amenity(name: 'Air Conditioner')
  ];
  List<RadioItem> location = [
    RadioItem(name: 'On campus', value: 'On campus'),
    RadioItem(name: 'Off campus', value: 'Off campus')
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
  List<Feature> roomType = [
    Feature(name: 'Single Room'),
    Feature(name: 'Double/ shared room'),
    Feature(name: 'Triple Room'),
    Feature(name: 'Quad Room'),
    Feature(name: '5+ room(Dormitory Type)')
  ];
  List<RadioItem> hostelType = [
    RadioItem(name: 'Male', value: 'Male only'),
    RadioItem(name: 'Female ', value: 'Female only'),
    RadioItem(name: 'Co-ed', value: 'Co-ed')
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
            icon: Icon(Icons.arrow_back_ios), // Custom back button icon
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
                  child: Container(
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
                        Container(
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
                        Container(
                          width: 92.w,
                          child: Column(
                            children: [
                              Container(
                                child: Text(
                                  'Property Features',
                                  style: CustomTextStyles.kDefaultTextTheme(
                                          Colors.black)
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                                alignment: Alignment.centerLeft,
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      width: 95.w,
                                      margin: EdgeInsets.all(2.w),
                                      child: AddListingPropertyFeatureCounter(
                                          label: 'Bedroom(s)'),
                                    ),
                                    Container(
                                      width: 95.w,
                                      margin: EdgeInsets.all(2.w),
                                      child: AddListingPropertyFeatureCounter(
                                          label: 'Bathroom(s)'),
                                    ),
                                    Container(
                                      width: 95.w,
                                      margin: EdgeInsets.all(2.w),
                                      child: AddListingPropertyFeatureCounter(
                                          label: 'Washroom(s)'),
                                    ),
                                    Container(
                                      width: 95.w,
                                      margin: EdgeInsets.all(2.w),
                                      child: AddListingPropertyFeatureCounter(
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

                        Container(
                          width: 92.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.symmetric(vertical: 10),
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
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Student Housing Amenities',
                            style:
                                CustomTextStyles.kDefaultTextTheme(Colors.black)
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          width: 92.w,
                          child: Wrap(
                            children: studentHousingAmenities.map((feature) {
                              return Container(
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
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Room Types',
                            style:
                                CustomTextStyles.kDefaultTextTheme(Colors.black)
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          width: 92.w,
                          child: Wrap(
                            children: roomType.map((feature) {
                              return Container(
                                width: 40
                                    .w, // Adjust width to give each item more space to wrap
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
                              child: Text(
                                ' Hostel Type', //I'M GETTING AN OVERFLOW ERROR HERE
                                style: CustomTextStyles.kDefaultTextTheme(
                                        Colors.black)
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            Container(
                              width: 100.w,
                              child: Wrap(
                                children: hostelType.map((status) {
                                  return Container(
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
                                              MaterialStateColor.resolveWith(
                                                  (states) => AppCommonColors
                                                      .mainBlueButton),
                                        ),
                                        Text(status.name,
                                            style: TextStyle(
                                              fontSize: 14.5.sp,
                                            ))
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
                              child: Text(
                                'Location',
                                style: CustomTextStyles.kDefaultTextTheme(
                                        Colors.black)
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            Container(
                              child: Row(
                                children: location.map((status) {
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
                                            MaterialStateColor.resolveWith(
                                                (states) => AppCommonColors
                                                    .mainBlueButton),
                                      ),
                                      Text(status.name,
                                          style: TextStyle(
                                            fontSize: 14.5.sp,
                                          ))
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
                              child: Text(
                                'Furnished Status',
                                style: CustomTextStyles.kDefaultTextTheme(
                                        Colors.black)
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              alignment: Alignment.centerLeft,
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
                                            MaterialStateColor.resolveWith(
                                                (states) => AppCommonColors
                                                    .mainBlueButton),
                                      ),
                                      Text(status.name,
                                          style: TextStyle(
                                            fontSize: 14.5.sp,
                                          ))
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

                        Container(
                          width: 92.w,
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'Additional Amenities',
                                  style: CustomTextStyles.kDefaultTextTheme(
                                          Colors.black)
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                                alignment: Alignment.centerLeft,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              AddListingSearchInput(
                                fillColor: AppCommonColors.searchFieldFillColor,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Wrap(
                                children: amenities.map((amenity) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(horizontal: 3),
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
