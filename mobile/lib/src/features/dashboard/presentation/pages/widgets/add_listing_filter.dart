import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mobile/src/core/theme/app_light_theme_colors.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/widgets/dropdown_component.dart';

import 'package:mobile/src/features/dashboard/presentation/widgets/filter_button.dart';
import 'package:mobile/src/features/dashboard/presentation/widgets/search_input.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../../core/theme/common_color.dart';

class AddListingFilter extends StatefulWidget {
  const AddListingFilter({super.key});

  @override
  State<AddListingFilter> createState() => _AddListingFilterState();

}

class _AddListingFilterState extends State<AddListingFilter> {
  SfRangeValues _values = const SfRangeValues(30,59);
  @override
  Widget build(BuildContext context) {
    RangeValues values = const RangeValues(100, 3000);
    return Scaffold(
      backgroundColor: AppLightThemeColors.kFieldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.all(4.5.w),
        child: ListView(
          clipBehavior: Clip.none,
          children: [
            // Search Bar
            Expanded(
              child: Container(
                height: 5.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextField(
                  style: const TextStyle(color: AppLightThemeColors.kBlackColor),
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Add more amenities here',
                    fillColor: Colors.blue,
                    hintStyle: TextStyle(
                        fontSize: 16.sp,
                        color: AppCommonColors.textFieldTextColor,
                        fontWeight: FontWeight.w400),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/search_icon.png',
                        height: 2.6.h,
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 10,
                    ),
                    border: InputBorder.none,
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                  ),
                ),
              ),
            ),
            //Property type Drop Down
            DropdownComponent(
              title: 'Property Type',
              tiles: [
                FilterButton(
                  text: 'Any',
                  onSelect: () {},
                  isSelected: true,
                ),
                FilterButton(
                  text: 'Any',
                  onSelect: () {},
                  isSelected: false,
                ),
                FilterButton(
                  text: 'Shops',
                  onSelect: () {},
                  isSelected: true,
                ),
                FilterButton(
                  text: 'Offices',
                  onSelect: () {},
                  isSelected: false,
                ),
                FilterButton(
                  text: 'Shared',
                  onSelect: () {},
                  isSelected: false,
                ),
                FilterButton(
                  text: 'Apartments',
                  onSelect: () {},
                  isSelected: true,
                ),
                FilterButton(
                  text: 'Student Hostels',
                  onSelect: () {},
                  isSelected: false,
                ),
                FilterButton(
                  text: 'Commercial',
                  onSelect: () {},
                  isSelected: false,
                ),
                FilterButton(
                  text: 'Warehouses',
                  onSelect: () {},
                  isSelected: false,
                ),
                FilterButton(
                  text: 'Residential',
                  onSelect: () {},
                  isSelected: false,
                ),
              ],
            ),

            //Price Range
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Text("Price Range"),
            ),
            SfRangeSlider(
              min: 100,
              max: 3000,
              interval: 500,
              activeColor: AppLightThemeColors.kMainBlueButton,
              stepSize: 5,
              values: _values,
              showLabels: true,
              showTicks: true,
              numberFormat: NumberFormat("\$"),
              onChanged: (value) {
                setState(() {
                  _values = value;
                });
              },
            ),
            const SizedBox(height: 20),
            //listview of payment methods
            SizedBox(
              height: 6.h,
              child: ListView.builder(
                clipBehavior: Clip.none,
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return FilterButton(

                    text: 'Any',
                    onSelect: () {},
                    isSelected: true,
                  );
                },
              ),
            ),
            //Rooms and beds
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DropdownComponent(title: 'Rooms and Beds', trail: "see more",tiles: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text('Bathroom'),
                          const SizedBox(
                            width: 12,
                          ),
                          SvgPicture.asset(
                              'assets/svg/iconoir_bathroom.svg')
                              .rightPadding(16.0),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('assets/svg/add-circle.svg')
                              .rightPadding(16.0),
                          const Text('0'),
                          SvgPicture.asset('assets/svg/minus-cirlce.svg')
                              .leftPadding(16.0),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text('Bedroom'),
                          const SizedBox(
                            width: 12,
                          ),
                          SvgPicture.asset(
                              'assets/svg/iconoir_bathroom.svg')
                              .rightPadding(16.0),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('assets/svg/add-circle.svg')
                              .rightPadding(16.0),
                          const Text('0'),
                          SvgPicture.asset('assets/svg/minus-cirlce.svg')
                              .leftPadding(16.0),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            DropdownComponent(
              title: 'Amenities',
              tiles: [
                FilterButton(
                  text: 'Any',
                  onSelect: () {},
                  isSelected: false,
                ),
                FilterButton(
                  text: 'WiFi',
                  onSelect: () {},
                  isSelected: true,
                ),
                FilterButton(
                  text: 'Balcony',
                  onSelect: () {},
                  isSelected: false,
                ),
                FilterButton(
                  text: 'Security',
                  onSelect: () {},
                  isSelected: true,
                ),
                FilterButton(
                  text: 'Free Parking',
                  onSelect: () {},
                  isSelected: false,
                ),
                FilterButton(
                  text: 'Kitchen',
                  onSelect: () {},
                  isSelected: false,
                ),
                FilterButton(
                  text: 'Air Conditioner',
                  onSelect: () {},
                  isSelected: false,
                ),
              ],
            ),
            DropdownComponent(
              title: 'Furnishing',
              tiles: [
                FilterButton(
                  text: 'Any',
                  onSelect: () {},
                  isSelected: true,
                ),
                FilterButton(
                  text: 'Full',
                  onSelect: () {},
                  isSelected: false,
                ),
                FilterButton(
                  text: 'Partial',
                  onSelect: () {},
                  isSelected: false,
                ),
                FilterButton(
                  text: 'None',
                  onSelect: () {},
                  isSelected: true,
                ),
              ],
            ),
            DropdownComponent(
              title: 'Lease Duration',
              tiles: [
                FilterButton(
                  text: 'Any',
                  onSelect: () {},
                  isSelected: true,
                ),
                FilterButton(
                  text: 'Full',
                  onSelect: () {},
                  isSelected: false,
                ),
                FilterButton(
                  text: 'Partial',
                  onSelect: () {},
                  isSelected: true,
                ),
                FilterButton(
                  text: 'None',
                  onSelect: () {},
                  isSelected: false,
                ),
              ],
            ),
            DropdownComponent(
              title: 'Pet Policy',
              tiles: [
                FilterButton(
                  text: 'Any',
                  onSelect: () {},
                  isSelected: false,
                ),
                FilterButton(
                  text: 'Pets Allowed',
                  onSelect: () {},
                  isSelected: true,
                ),
                FilterButton(
                  text: 'No Pets Allowed',
                  onSelect: () {},
                  isSelected: false,
                ),
              ],
            ),
            DropdownComponent(
              title: 'Accessibility Features',
              tiles: [
                FilterButton(
                  text: 'Any',
                  onSelect: () {},
                  isSelected: true,
                ),
                FilterButton(
                  text: 'Wheelchair ',
                  onSelect: () {},
                  isSelected: false,
                ),
                FilterButton(
                  text: 'Ground Floor',
                  onSelect: () {},
                  isSelected: false,
                ),
              ],
            ),
            DropdownComponent(
              title: 'Student Accommodation',
              tiles: [
                FilterButton(
                  text: 'Off-campus',
                  onSelect: () {},
                  isSelected: false,
                ),
                FilterButton(
                  text: 'On-campus ',
                  onSelect: () {},
                  isSelected: true,
                ),
                FilterButton(
                  text: 'Single rooms',
                  onSelect: () {},
                  isSelected: false,
                ),
                FilterButton(
                  text: 'Shared rooms',
                  onSelect: () {},
                  isSelected: false,
                ),
                FilterButton(
                  text: 'Male rooms',
                  onSelect: () {},
                  isSelected: true,
                ),
                FilterButton(
                  text: 'Female rooms',
                  onSelect: () {},
                  isSelected: false,
                ),
                FilterButton(
                  text: 'Co-ed',
                  onSelect: () {},
                  isSelected: false,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilterButton(

                    text: "Reset All",
                    onSelect: () {},
                    isSelected: false),
                FilterButton(
                    text: "Show Results",
                    onSelect: () {},
                    isSelected: true),
              ],
            )
            //
          ],
        ),
      ),
    );
  }
}