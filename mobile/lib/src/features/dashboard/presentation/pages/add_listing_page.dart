import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/theme/text_theme.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/widgets/custom_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddListingPage extends StatefulWidget {
  const AddListingPage({super.key});

  @override
  State<AddListingPage> createState() => _AddListingPageState();
}

class _AddListingPageState extends State<AddListingPage> {
  final _formKey = GlobalKey<FormState>();
  final _propertyTitleController = TextEditingController();
  final _propertyDescriptionController = TextEditingController();
  final _categoryController = TextEditingController();
  final _propertyTypeController = TextEditingController();
  final _residentialSubtypeController = TextEditingController();
  final _commercialSubtypeController = TextEditingController();
  final _currencyController = TextEditingController();
  final _priceController = TextEditingController();
  final _priceFrequencySHController = TextEditingController();
  final _priceFrequencyAHController = TextEditingController();
  final _priceFrequencyHGController = TextEditingController();
  final _negotiableController = TextEditingController();
  bool _isNegotiable = false;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _propertyTitleController.addListener(_checkFormCompletion);
    _propertyDescriptionController.addListener(_checkFormCompletion);
  }

  void _checkFormCompletion() {
    setState(() {
      _isButtonEnabled = _propertyDescriptionController.text.isNotEmpty &&
          _propertyTitleController.text.isNotEmpty &&
          _categoryController.text.isNotEmpty &&
          (_propertyTypeController.text.isNotEmpty &&
                  _residentialSubtypeController.text.isNotEmpty ||
              _propertyTypeController.text.isNotEmpty &&
                  _residentialSubtypeController.text.isNotEmpty) &&
          _currencyController.text.isNotEmpty &&
          _priceController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _propertyTitleController.dispose();
    _propertyDescriptionController.dispose();
    _categoryController.dispose();
    _propertyTypeController.dispose();
    _residentialSubtypeController.dispose();
    _commercialSubtypeController.dispose();
    _currencyController.dispose();
    _priceController.dispose();
    _priceFrequencySHController.dispose();
    _priceFrequencyAHController.dispose();
    _priceFrequencyHGController.dispose();
    _negotiableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Theme.of(context).colorScheme.onPrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 1.8.h),
                    Text(
                      'Add Listin',
                      style: CustomTextStyles.kDefaultTextTheme(
                              AppCommonColors.appBlack)
                          .displaySmall
                          ?.copyWith(fontSize: 19, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Hi Evans, Kindly fill the details of your',
                      style: CustomTextStyles.kDefaultTextTheme(
                              AppCommonColors.appBlack)
                          .displaySmall
                          ?.copyWith(fontSize: 19, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 0.3.h),
                    Text(
                      'Property Listing?',
                      style: CustomTextStyles.kDefaultTextTheme(
                              AppCommonColors.mainBlueButton)
                          .displaySmall
                          ?.copyWith(fontSize: 19, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 1.h),
                    Card(
                      color: Colors.blue.shade50,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: AppCommonColors.mainBlueButton, // Border color
                          width: 0.08.h, // Border width
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(2.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rules for Listing Property',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w800,
                                color: AppCommonColors.mainBlueButton,
                              ),
                            ),
                            SizedBox(height: 1.h),
                            Text(
                              'It is important that you read and understand the rules for listing property on Terra.',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: AppCommonColors.fieldBorderColor,
                                height: 1.5,
                              ),
                            ),
                            SizedBox(height: 1.h),
                            GestureDetector(
                              onTap: () {
                                // Navigate to the rules details or handle the click
                              },
                              child: Text(
                                'Click here for details',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppCommonColors.defaultLink,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Property Title',
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    CustomTextFormField(
                      textFormFieldType: TextFormFieldType.regular,
                      borderRadiusValue: 6,
                      hintText: 'Enter your property name',
                      hintStyle: CustomTextStyles.kDefaultTextTheme(
                              AppCommonColors.unfilledForm)
                          .bodySmall
                          ?.copyWith(fontSize: 12),
                      style: context.textTheme.bodySmall!.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/listingIcons/house.png',
                          height: 2.3.h,
                        ),
                      ),
                      controller: _propertyTitleController,
                    ),
                    SizedBox(height: 0.5.h),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Note: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppCommonColors
                                  .fieldBorderColor, // Replace with your desired color
                              fontSize: 13.sp, // Adjust font size as needed
                            ),
                          ),
                          TextSpan(
                            text:
                                'Use clear and concise names for your listings without location information. E.g. 3 Bedroom Apartment for Sale',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: AppCommonColors
                                  .fieldBorderColor, // Replace with your desired color
                              fontSize: 13.sp, // Adjust font size as needed
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Property Description',
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    CustomTextFormField(
                      textFormFieldType: TextFormFieldType.multiline,
                      borderRadiusValue: 6,
                      hintText: 'Enter your property name',
                      hintStyle: CustomTextStyles.kDefaultTextTheme(
                              AppCommonColors.unfilledForm)
                          .bodySmall
                          ?.copyWith(fontSize: 12),
                      style: context.textTheme.bodySmall!.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                      controller: _propertyDescriptionController,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Category',
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    CustomDropdownCard(
                      initialText: "Select Category",
                      controller: _categoryController,
                      options: const ["Rent", "Buy"],
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Property Type',
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    CustomDropdownCard(
                        initialText: "Select Type",
                        controller: _propertyTypeController,
                        options: const ["Residential", "Commercial"]),
                    SizedBox(height: 2.h),
                    Text(
                      'Residential Subtype',
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    CustomDropdownCard(
                        controller: _residentialSubtypeController,
                        initialText: "Select Residential Subtype",
                        options: const [
                          "Apartment",
                          "Guest House",
                          "Student Hostels",
                          "Hotel"
                        ]),
                    SizedBox(height: 2.h),
                    Text(
                      'Commercial Subtype',
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    CustomDropdownCard(
                        controller: _commercialSubtypeController,
                        initialText: "Select Residential Subtype",
                        options: const [
                          "Office Space",
                          "Shop",
                          "Warehouse",
                          "Event Space"
                        ]),
                    SizedBox(height: 2.h),
                    Text(
                      'Currency',
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    Row(
                      children: [
                        Expanded(
                          child: CustomDropdownCard(
                            controller: _currencyController,
                            initialText: "Currency",
                            options: const ["GH₵", "USD"],
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: CustomTextFormField(
                            textFormFieldType: TextFormFieldType.regular,
                            borderRadiusValue: 6,
                            hintText: 'e.g. 500000',
                            hintStyle: CustomTextStyles.kDefaultTextTheme(
                                    AppCommonColors.unfilledForm)
                                .bodySmall
                                ?.copyWith(fontSize: 12),
                            style: context.textTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            controller: _priceController,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Price Frequency (Apartment, House)',
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    CustomDropdownCard(
                      controller: _priceFrequencyAHController,
                      initialText: "Select Price Frequency",
                      options: const ["Per Month", "Per Year"],
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Price Frequency (Student Hostels)',
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    CustomDropdownCard(
                      controller: _priceFrequencySHController,
                      initialText: "Select Price Frequency",
                      options: const ["Per Semester", "Per Academic Year"],
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Price Frequency (Hostel/Guest House)',
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    CustomDropdownCard(
                      controller: _priceFrequencyHGController,
                      initialText: "Select Price Frequency",
                      options: const ["Per Night", "Per Week"],
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Negotiable?',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Radio<bool>(
                              value: true,
                              groupValue: _isNegotiable,
                              onChanged: (value) {
                                setState(() {
                                  _isNegotiable = value!;
                                });
                              },
                            ),
                            const Text('Yes'),
                          ],
                        ),
                        Row(
                          children: [
                            Radio<bool>(
                              value: false,
                              groupValue: _isNegotiable,
                              onChanged: (value) {
                                setState(() {
                                  _isNegotiable = value!;
                                });
                              },
                            ),
                            const Text('No'),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: ElevatedButton(
                onPressed: _isButtonEnabled
                    ? () {
                        // Handle next button press
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 5.h),
                  backgroundColor: _isButtonEnabled
                      ? AppCommonColors.mainBlueButton
                      : AppCommonColors.unfilledForm,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 6.h,
            )
          ],
        ),
      ),
    );
  }
}
