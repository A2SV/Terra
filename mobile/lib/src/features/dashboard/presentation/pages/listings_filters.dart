import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/src/core/theme/app_light_theme_colors.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/widgets/dropdown_component.dart';
import 'package:mobile/src/features/dashboard/presentation/widgets/filter_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:mobile/src/core/constants/property_amenities.dart';

class ListingsFilters extends StatefulWidget {
  const ListingsFilters({super.key});

  @override
  State<ListingsFilters> createState() => _ListingsFiltersState();
}

class _ListingsFiltersState extends State<ListingsFilters> {
  SfRangeValues _values = const SfRangeValues(30, 59);

  bool isRent = true;
  bool isCommercial = true;
  bool isStudentAccomodation = true;
  bool isCedis = true;
  String priceFrequency = "";
  Set<String> selectedSubtypes = {};
  Set<String> selectedAmenities = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 7.h,
        centerTitle: false,
        leading: const Icon(Icons.close),
        shadowColor: Colors.black.withOpacity(0.5),
        elevation: 1,
        surfaceTintColor: Colors.white,
        title: Text(
          'Filters',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 17.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.5.w),
        child: ListView(
          clipBehavior: Clip.none,
          children: [
            SizedBox(height: 2.h),
            Text(
              "Listing Type",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 17.sp,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: isRent,
                      onChanged: (val) {
                        if (val == null) {
                          return;
                        }
                        setState(() {
                          isRent = val;
                        });
                      },
                    ),
                    Text(
                      "For Rent",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 2.w),
                Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: !isRent,
                      onChanged: (val) {
                        if (val == null) {
                          return;
                        }
                        setState(() {
                          isRent = !val;
                        });
                      },
                    ),
                    Text(
                      "For Sale",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Text(
              "Property Type",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 17.sp,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: isCommercial,
                      onChanged: (val) {
                        if (val == null) {
                          return;
                        }
                        setState(() {
                          isCommercial = val;
                        });
                      },
                    ),
                    Text(
                      "Commercial",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 2.w),
                Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: !isCommercial,
                      onChanged: (val) {
                        if (val == null) {
                          return;
                        }
                        setState(() {
                          isCommercial = !val;
                        });
                      },
                    ),
                    Text(
                      "Residential",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            //Property type Drop Down
            DropdownComponent(
              title: 'Sub-type',
              rightPadding: 55.w,
              tiles: propertyType
                  .map(
                    (property) => Padding(
                      padding: EdgeInsets.only(right: 1.w),
                      child: FilterButton(
                        text: property,
                        onSelect: () {
                          if (selectedSubtypes.contains(property)) {
                            setState(() {
                              selectedSubtypes.remove(property);
                            });
                          } else {
                            setState(() {
                              selectedSubtypes.add(property);
                            });
                          }
                        },
                        isSelected: selectedSubtypes.contains(property),
                        size: 15,
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 2.h),
            Text(
              "Currency",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 17.sp,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: isCedis,
                      onChanged: (val) {
                        if (val == null) {
                          return;
                        }
                        setState(() {
                          isCedis = val;
                        });
                      },
                    ),
                    Text(
                      "GHC",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 2.w),
                Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: !isCedis,
                      onChanged: (val) {
                        if (val == null) {
                          return;
                        }
                        setState(() {
                          isCedis = !val;
                        });
                      },
                    ),
                    Text(
                      "USD",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 2.h),
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
            SizedBox(height: 4.h),
            Text(
              "Price Frequency",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 17.sp,
              ),
            ),
            SizedBox(
              height: 6.h,
              child: ListView.builder(
                clipBehavior: Clip.none,
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 1.5.w),
                    child: FilterButton(
                      text: paymentType[index],
                      onSelect: () {
                        setState(() {
                          priceFrequency = paymentType[index];
                        });
                      },
                      isSelected: priceFrequency == paymentType[index],
                      size: 15,
                    ),
                  );
                },
              ),
            ),
            DropdownComponent(
              title: 'Amenities',
              rightPadding: 55.w,
              tiles: amenities
                  .map(
                    (property) => Padding(
                      padding: EdgeInsets.only(right: 1.w),
                      child: FilterButton(
                        text: property,
                        onSelect: () {
                          if (selectedSubtypes.contains(property)) {
                            setState(() {
                              selectedSubtypes.remove(property);
                            });
                          } else {
                            setState(() {
                              selectedSubtypes.add(property);
                            });
                          }
                        },
                        isSelected: selectedSubtypes.contains(property),
                        size: 15,
                      ),
                    ),
                  )
                  .toList(),
            ),

            SizedBox(height: 2.h),
            Text(
              "Student Accommodation",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 17.sp,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: isStudentAccomodation,
                      onChanged: (val) {
                        if (val == null) {
                          return;
                        }
                        setState(() {
                          isStudentAccomodation = val;
                        });
                      },
                    ),
                    Text(
                      "Yes",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 2.w),
                Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: !isStudentAccomodation,
                      onChanged: (val) {
                        if (val == null) {
                          return;
                        }
                        setState(() {
                          isStudentAccomodation = !val;
                        });
                      },
                    ),
                    Text(
                      "No",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: Colors.white,
        shadowColor: Colors.red,
        elevation: 1,
        height: 7.h,
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: () {
                  setState(() {
                    isRent = true;
                    isCommercial = true;
                    isStudentAccomodation = true;
                    isCedis = true;
                    priceFrequency = "";
                    selectedSubtypes = {};
                    selectedAmenities = {};
                  });
                },
                icon: const Icon(Icons.refresh),
                label: Text(
                  "Reset all",
                  style: TextStyle(
                    color: AppLightThemeColors.kLightTextColor,
                    fontFamily: "Nunito",
                    fontSize: 16.sp,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: AppLightThemeColors.kMainBlueButton,
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                ),
                child: Text(
                  "Show Results",
                  style: TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
