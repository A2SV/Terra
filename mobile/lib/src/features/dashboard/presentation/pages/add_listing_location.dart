import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/theme/text_theme.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:mobile/src/core/widgets/custom_google_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddListingLocPage extends StatefulWidget {
  const AddListingLocPage({super.key});

  @override
  State<AddListingLocPage> createState() => _AddListingLocPageState();
}

class _AddListingLocPageState extends State<AddListingLocPage> {
  final _formKey = GlobalKey<FormState>();
  final _streetController = TextEditingController();
  final _houseController = TextEditingController();
  final _zipController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  final _digitalAddressController = TextEditingController();

  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _streetController.addListener(_checkFormCompletion);
    _houseController.addListener(_checkFormCompletion);
    _zipController.addListener(_checkFormCompletion);
    _cityController.addListener(_checkFormCompletion);
    _countryController.addListener(_checkFormCompletion);
    _digitalAddressController.addListener(_checkFormCompletion);
  }

  void _checkFormCompletion() {
    setState(() {
      _isButtonEnabled = _streetController.text.isNotEmpty &&
          _houseController.text.isNotEmpty &&
          _zipController.text.isNotEmpty &&
          _cityController.text.isNotEmpty &&
          _countryController.text.isNotEmpty &&
          _digitalAddressController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _streetController.dispose();
    _houseController.dispose();
    _zipController.dispose();
    _cityController.dispose();
    _countryController.dispose();
    _digitalAddressController.dispose();
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
                      'Add Listing',
                      style: CustomTextStyles.kDefaultTextTheme(
                              AppCommonColors.appBlack)
                          .displaySmall
                          ?.copyWith(fontSize: 19, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Where is your property',
                      style: CustomTextStyles.kDefaultTextTheme(
                              AppCommonColors.appBlack)
                          .displaySmall
                          ?.copyWith(fontSize: 19, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 0.3.h),
                    Text(
                      'located?',
                      style: CustomTextStyles.kDefaultTextTheme(
                              AppCommonColors.mainBlueButton)
                          .displaySmall
                          ?.copyWith(fontSize: 19, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 1.h),
                    CustomTextFormField(
                      textFormFieldType: TextFormFieldType.regular,
                      hintText: 'Enter your street name',
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
                          'assets/images/listingIcons/Streets.png',
                          height: 2.3.h,
                        ),
                      ),
                      controller: _streetController,
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            textFormFieldType: TextFormFieldType.regular,
                            hintText: 'House No.',
                            hintStyle: CustomTextStyles.kDefaultTextTheme(
                                    AppCommonColors.unfilledForm)
                                .bodySmall
                                ?.copyWith(fontSize: 12),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/listingIcons/house.png',
                                height: 2.h,
                              ),
                            ),
                            style: context.textTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            controller: _houseController,
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: CustomTextFormField(
                            textFormFieldType: TextFormFieldType.regular,
                            hintText: 'Zip / Postal Code',
                            hintStyle: CustomTextStyles.kDefaultTextTheme(
                                    AppCommonColors.unfilledForm)
                                .bodySmall
                                ?.copyWith(fontSize: 12),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/listingIcons/zip.png',
                                height: 2.h,
                              ),
                            ),
                            style: context.textTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            controller: _zipController,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            textFormFieldType: TextFormFieldType.regular,
                            hintText: 'City',
                            hintStyle: CustomTextStyles.kDefaultTextTheme(
                                    AppCommonColors.unfilledForm)
                                .bodySmall
                                ?.copyWith(fontSize: 12),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/listingIcons/city.png',
                                height: 2.h,
                              ),
                            ),
                            style: context.textTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            controller: _cityController,
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: CustomTextFormField(
                            textFormFieldType: TextFormFieldType.regular,
                            hintText: 'Country',
                            hintStyle: CustomTextStyles.kDefaultTextTheme(
                                    AppCommonColors.unfilledForm)
                                .bodySmall
                                ?.copyWith(fontSize: 12),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/listingIcons/country.png',
                                height: 2.3.h,
                              ),
                            ),
                            style: context.textTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            controller: _countryController,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h),
                    CustomTextFormField(
                      textFormFieldType: TextFormFieldType.regular,
                      hintText: 'Digital Address',
                      hintStyle: CustomTextStyles.kDefaultTextTheme(
                              AppCommonColors.unfilledForm)
                          .bodySmall
                          ?.copyWith(fontSize: 12),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/listingIcons/pin.png',
                          height: 2.h,
                        ),
                      ),
                      style: context.textTheme.bodySmall!.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                      controller: _digitalAddressController,
                    ),
                    SizedBox(height: 2.h),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w), // No padding
              child: const CustomGoogleMap(text: 'Select on the map'),
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
          ],
        ),
      ),
    );
  }
}


