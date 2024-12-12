import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/text_theme.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/widgets/add_listing_bottom_sheet_modal.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/widgets/add_listing_text_form_field.dart';
import 'package:mobile/src/features/dashboard/presentation/widgets/add_listing_search_input.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/features/da'
    'shboard/presentation/widgets/filter_button.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../../../../gen/fonts.gen.dart';
import '../../../../core/theme/app_light_theme_colors.dart';
import '../../../../core/utils/utils.dart';

class AddListingOffice extends StatefulWidget {
  const AddListingOffice({super.key});
  @override
  State<AddListingOffice> createState() => _AddListingOfficeState();
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

class _AddListingOfficeState extends State<AddListingOffice> {
  final _formKey = GlobalKey<FormState>();
  final _propertySizeController = TextEditingController();
  final _numberOfFloorsController = TextEditingController();
  final _floorNumberController = TextEditingController();
  String _receptionArea = 'None';
  String _officeType = '';
  String _meetingRoom = '';
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
  List<RadioItem> officeTypes = [
    RadioItem(name: 'Open Plan', value: 'Open Plan'),
    RadioItem(name: 'Individual offices', value: 'Individual offices')
  ];
  List<RadioItem> meetingRoom = [
    RadioItem(name: 'Yes', value: 'Yes'),
    RadioItem(name: 'No', value: 'No')
  ];
  List<RadioItem> receptionArea = [
    RadioItem(name: 'Yes', value: 'Yes'),
    RadioItem(name: 'No', value: 'No')
  ];
  List<Feature> studentHousingAmenities = [
    Feature(name: 'Study Area'),
    Feature(name: 'Laundry Service'),
    Feature(name: 'Cleaning Service'),
    Feature(name: 'Shared Facilities'),
    Feature(name: 'Meal Plan')
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

                        Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Office Type',
                                style: CustomTextStyles.kDefaultTextTheme(
                                        Colors.black)
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              width: 100.w,
                              child: Wrap(
                                children: officeTypes.map((status) {
                                  return SizedBox(
                                    width: 45.w,
                                    child: Row(
                                      children: [
                                        Radio<String>(
                                          value: status.value,
                                          groupValue: _officeType,
                                          onChanged: (String? value) {
                                            setState(() {
                                              _officeType = value!;
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
                                'Meeting Rooms',
                                style: CustomTextStyles.kDefaultTextTheme(
                                        Colors.black)
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: meetingRoom.map((status) {
                                  return Row(
                                    children: [
                                      Radio<String>(
                                        value: status.value,
                                        groupValue: _meetingRoom,
                                        onChanged: (String? value) {
                                          setState(() {
                                            _meetingRoom = value!;
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
                                'Reception Area',
                                style: CustomTextStyles.kDefaultTextTheme(
                                        Colors.black)
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: receptionArea.map((status) {
                                  return Row(
                                    children: [
                                      Radio<String>(
                                        value: status.value,
                                        groupValue: _receptionArea,
                                        onChanged: (String? value) {
                                          setState(() {
                                            _receptionArea = value!;
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
                                      _floorNumberController.text == '' ||
                                      _numberOfFloorsController.text == '';
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
