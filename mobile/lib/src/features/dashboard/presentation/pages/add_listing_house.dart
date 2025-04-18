import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/text_theme.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/widgets/add_listing_bottom_sheet_modal.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/widgets/add_listing_check_box.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/widgets/add_listing_property_feature_counter.dart';
import 'package:mobile/src/features/dashboard/presentation/widgets/add_listing_search_input.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/widgets/add_listing_text_form_field.dart';
import 'package:mobile/src/features/da'
    'shboard/presentation/widgets/filter_button.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../../../../../gen/fonts.gen.dart';
import '../../../../core/theme/app_light_theme_colors.dart';

class AddListingHouse extends StatefulWidget {
  const AddListingHouse({super.key});
  @override
  State<AddListingHouse> createState() => _AddListingHouseState();
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

class FurnishedStatus {
  String name;
  late String value;
  FurnishedStatus({
    required this.name,
    required this.value,
  });
}

class _AddListingHouseState extends State<AddListingHouse> {
  final _formKey = GlobalKey<FormState>();
  final _propertySizeController = TextEditingController();
  final _storyNumberController = TextEditingController();
  String _furnishedStatus = 'None';
  late String _garageSpaces = '';
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
  List<FurnishedStatus> furnishedStatus = [
    FurnishedStatus(name: 'Full', value: 'Full'),
    FurnishedStatus(name: 'Partial', value: 'Partial'),
    FurnishedStatus(name: 'None', value: 'None')
  ];
  List<Feature> features = [Feature(name: 'Student Friendly')];

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
                        ), //property features
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

                        SizedBox(
                          width: 92.w,
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Story Number',
                                  style: CustomTextStyles.kDefaultTextTheme(
                                          Colors.black)
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                              ),
                              AddListingTextFormField(
                                  inputController: _storyNumberController,
                                  width: 95.w,
                                  labelText: 'Number of Stories',
                                  validator: (size) =>
                                      CustomValidator.isNotEmpty(size ?? " ")),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                  children: features.map((feature) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 3),
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
                              }).toList())
                            ],
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

                        Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Garage Spaces',
                                style: CustomTextStyles.kDefaultTextTheme(
                                        Colors.black)
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              child: Row(children: [
                                Row(
                                  children: [
                                    Radio<String>(
                                      value: 'Yes',
                                      groupValue: _garageSpaces,
                                      onChanged: (String? value) {
                                        setState(() {
                                          _garageSpaces = value!;
                                        });
                                      },
                                      fillColor: WidgetStateColor.resolveWith(
                                          (states) =>
                                              AppCommonColors.mainBlueButton),
                                    ),
                                    const Text('Yes')
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio<String>(
                                      value: 'No',
                                      groupValue: _garageSpaces,
                                      onChanged: (String? value) {
                                        setState(() {
                                          _garageSpaces = value!;
                                        });
                                      },
                                      fillColor: WidgetStateColor.resolveWith(
                                          (states) =>
                                              AppCommonColors.mainBlueButton),
                                    ),
                                    const Text('No')
                                  ],
                                ),
                              ]),
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
                                  _propertySizeController.text == '' ||
                                      _storyNumberController.text == '';
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
