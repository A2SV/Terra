

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/text_theme.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/widgets/add_listing_bottom_sheet_modal.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/widgets/add_listing_check_box.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/widgets/add_listing_property_feature_counter.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/widgets/custom_details_button.dart';
import 'package:mobile/src/features/dashboard/presentation/widgets/add_listing_search_input.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/widgets/property_feature_counter.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/widgets/add_listing_text_form_field.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/widgets/dropdown_component.dart';
import 'package:mobile/src/features/dashboard/presentation/widgets/search_input.dart';
import 'package:mobile/src/features/da'
    'shboard/presentation/widgets/filter_button.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../../../../gen/fonts.gen.dart';
import '../../../../core/theme/app_light_theme_colors.dart';
import '../../../../core/utils/utils.dart';

class AddListingApartment extends StatefulWidget{
  const AddListingApartment({super.key});
  @override
  State<AddListingApartment> createState() => _AddListingApartmentState();
}

class Amenity{

  String name;
  late bool isSelected;
  Amenity({
    required this.name,
    this.isSelected=false,
  });

}

class Feature{

  String name;
  late bool isSelected;
  Feature({
    required this.name,
    this.isSelected=false,
  });

}

class FurnishedStatus{

  String name;
  late String value;
  FurnishedStatus({
    required this.name,
    required this.value,
  });

}


class _AddListingApartmentState extends State<AddListingApartment> {
  final _formKey = GlobalKey<FormState>();
  final _propertySizeController = TextEditingController();
  final _numberOfFloorsController = TextEditingController();
  final _floorNumberController = TextEditingController();
  String _furnishedStatus='None';
  SfRangeValues _values = const SfRangeValues(30,59);
  List<Amenity> amenities=[Amenity(name: 'Wifi'),Amenity(name: 'Balcony'),Amenity(name: 'Security'),Amenity(name: 'Balcony'),Amenity(name: 'Free Parking'),Amenity(name: 'Kitchen'),Amenity(name: 'Air Conditioner')];
  List<FurnishedStatus> furnishedStatus=[FurnishedStatus(name: 'Full', value: 'Full'),FurnishedStatus(name: 'Partial', value: 'Partial'),FurnishedStatus(name: 'None', value: 'None')];
  List<Feature> features=[Feature(name: 'Student Friendly'),Feature(name: 'Laundry Service'),Feature(name: 'Cleaning Service')];

  late bool _isButtonDisabled;




  @override
  void initState(){
    _isButtonDisabled=false;
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
                        style: TextStyle(
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
                          text: TextSpan(
                              children: [
                                TextSpan(
                                  text:'Almost finished',
                                  style: CustomTextStyles.kDefaultTextTheme(AppCommonColors.mainBlueButton).titleLarge,
                                ),
                                TextSpan(
                                  text:', complete your property listing',
                                  style: CustomTextStyles.kDefaultTextTheme(Colors.black).titleLarge?.copyWith(fontWeight: FontWeight.w500),
                                ),

                              ]
                          )
                      )
                    ),//almost finished
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
                              style: CustomTextStyles.kDefaultTextTheme(Colors.black).bodyMedium?.copyWith(fontWeight: FontWeight.w600),

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
                                      label: 'Bedroom(s)'
                                  ),
                                ),
                                Container(
                                  width: 95.w,
                                  margin: EdgeInsets.all(2.w),
                                  child: AddListingPropertyFeatureCounter(
                                      label: 'Bathroom(s)'
                                  ),
                                ),
                                Container(
                                  width: 95.w,
                                  margin: EdgeInsets.all(2.w),
                                  child: AddListingPropertyFeatureCounter(
                                      label: 'Washroom(s)'
                                  ),
                                ),
                                Container(
                                  width: 95.w,
                                  margin: EdgeInsets.all(2.w),
                                  child: AddListingPropertyFeatureCounter(
                                      label: 'Kitchen(s)'
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),//property features
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
                              style: CustomTextStyles.kDefaultTextTheme(Colors.black).bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                          AddListingTextFormField(
                              inputController: _propertySizeController,
                              width: 95.w,
                              labelText: 'Enter property size in square meters',
                              validator: (size) =>
                                  CustomValidator.isNotEmpty(size ?? " ")
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 2.h,
                    ),

                    Container(
                      width: 92.w,
                      child:  Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                                'Apartment Floors',
                              style: CustomTextStyles.kDefaultTextTheme(Colors.black).bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AddListingTextFormField(
                                  width: 44.w,
                                  inputController: _numberOfFloorsController,
                                  labelText: 'Number of floors',
                                  validator: (size) =>
                                      CustomValidator.isNotEmpty(size ?? " ")
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              AddListingTextFormField(
                                  width: 44.w,
                                  inputController: _floorNumberController,
                                  labelText: 'Floor number',
                                  validator: (size) =>
                                      CustomValidator.isNotEmpty(size ?? " ")
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            children:features.map((feature){
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 3),
                                child: AddListingCheckBox(
                                  isActive:feature.isSelected,
                                  label: feature.name,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      feature.isSelected = value!;
                                    });
                                  },
                                ),
                              );
                            }).toList()
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text(
                              'Furnished Status',
                            style: CustomTextStyles.kDefaultTextTheme(Colors.black).bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        Container(
                          child: Row(
                            children: furnishedStatus.map(
                                (status){
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
                                        fillColor: MaterialStateColor.resolveWith((states) => AppCommonColors.mainBlueButton),
                                      ),
                                      Text(status.name)
                                    ],
                                  );
                                }

                            ).toList(),
                          ),
                        ),//furnished status
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
                              style: CustomTextStyles.kDefaultTextTheme(Colors.black).bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          AddListingSearchInput(
                            fillColor: AppCommonColors.searchFieldFillColor,
                          ),
                          SizedBox(height: 1.h,),
                          Wrap(
                            children: amenities.map((amenity){
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 3),
                                child: FilterButton(
                                  text: amenity.name,
                                  onSelect: () {
                                    setState(() {
                                      amenity.isSelected=!amenity.isSelected;
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
                            _isButtonDisabled=_propertySizeController.text=='' || _floorNumberController.text=='' || _numberOfFloorsController.text=='';
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
              )
          ),
        )
      )
    );
  }
}