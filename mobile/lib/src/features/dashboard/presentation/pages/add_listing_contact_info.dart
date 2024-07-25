import 'package:flutter/material.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/theme/text_theme.dart';

class AddListingContactPage extends StatefulWidget {
  const AddListingContactPage({super.key});

  @override
  State<AddListingContactPage> createState() => _AddListingContactPageState();
}

class _AddListingContactPageState extends State<AddListingContactPage> {
  final _phoneController = TextEditingController();
  final _whatsappController = TextEditingController();
  final _websiteController = TextEditingController();
  final _instagramController = TextEditingController();
  final _snapchatController = TextEditingController();
  final _twitterController = TextEditingController();
  final _facebookController = TextEditingController();

  bool _isButtonEnabled = false;
  bool _agreeToTerms = false;

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_checkIfButtonShouldBeEnabled);
    _whatsappController.addListener(_checkIfButtonShouldBeEnabled);
    _websiteController.addListener(_checkIfButtonShouldBeEnabled);
    _instagramController.addListener(_checkIfButtonShouldBeEnabled);
    _snapchatController.addListener(_checkIfButtonShouldBeEnabled);
    _twitterController.addListener(_checkIfButtonShouldBeEnabled);
    _facebookController.addListener(_checkIfButtonShouldBeEnabled);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _whatsappController.dispose();
    _websiteController.dispose();
    _instagramController.dispose();
    _snapchatController.dispose();
    _twitterController.dispose();
    _facebookController.dispose();
    super.dispose();
  }

  void _checkIfButtonShouldBeEnabled() {
    setState(() {
      _isButtonEnabled = _agreeToTerms &&
          _phoneController.text.isNotEmpty &&
          _whatsappController.text.isNotEmpty &&
          _websiteController.text.isNotEmpty &&
          _instagramController.text.isNotEmpty &&
          _snapchatController.text.isNotEmpty &&
          _twitterController.text.isNotEmpty &&
          _facebookController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        surfaceTintColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0.5.h),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Add Listing',
                  style: CustomTextStyles.kDefaultTextTheme(
                          AppCommonColors.appBlack)
                      .displaySmall
                      ?.copyWith(fontSize: 19, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 2.h),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text.rich(
                  TextSpan(
                    style: context.textTheme.headlineMedium!.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    children: const [
                      TextSpan(text: 'Add your '),
                      TextSpan(
                        text: 'contact',
                        style: TextStyle(
                          color: AppCommonColors.mainBlueButton,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      TextSpan(text: ' information'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              CustomTextFormField(
                textFormFieldType: TextFormFieldType.regular,
                hintText: 'Phone Number',
                controller: _phoneController,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/listingIcons/phone.png',
                    height: 2.3.h,
                  ),
                ),
                hintStyle: context.textTheme.bodySmall?.copyWith(
                  fontSize: 14.sp,
                  color: AppCommonColors.unfilledForm,
                ),
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 14.sp,
                  color: AppCommonColors.filledForm,
                ),
                onChanged: (value) => _checkIfButtonShouldBeEnabled(),
              ),
              SizedBox(height: 1.4.h),
              CustomTextFormField(
                textFormFieldType: TextFormFieldType.regular,
                hintText: 'WhatsApp Number',
                controller: _whatsappController,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/listingIcons/whatsapp.png',
                    height: 2.3.h,
                  ),
                ),
                hintStyle: context.textTheme.bodySmall?.copyWith(
                  fontSize: 14.sp,
                  color: AppCommonColors.unfilledForm,
                ),
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 14.sp,
                  color: AppCommonColors.filledForm,
                ),
                onChanged: (value) => _checkIfButtonShouldBeEnabled(),
              ),
              SizedBox(height: 1.4.h),
              CustomTextFormField(
                textFormFieldType: TextFormFieldType.regular,
                hintText: 'Website Link',
                controller: _websiteController,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/listingIcons/website.png',
                    height: 2.3.h,
                  ),
                ),
                hintStyle: context.textTheme.bodySmall?.copyWith(
                  fontSize: 14.sp,
                  color: AppCommonColors.unfilledForm,
                ),
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 14.sp,
                  color: AppCommonColors.filledForm,
                ),
                onChanged: (value) => _checkIfButtonShouldBeEnabled(),
              ),
              SizedBox(height: 1.4.h),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _agreeToTerms = !_agreeToTerms;
                            _checkIfButtonShouldBeEnabled();
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _agreeToTerms
                                  ? AppCommonColors.mainBlueButton
                                  : AppCommonColors.unfilledForm,
                              width: 2.0,
                            ),
                            color: _agreeToTerms
                                ? Colors.white
                                : Colors.transparent,
                          ),
                          width: 3.6.w, // Adjust the size as needed
                          height: 1.8.h,
                          child: _agreeToTerms
                              ? Icon(
                                  Icons.check,
                                  size: 10.0, // Adjust the size as needed
                                  color: AppCommonColors.mainBlueButton,
                                )
                              : null,
                        ),
                      ),
                      SizedBox(width: 3.5.w),
                      Text(
                        'I agree to the ',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      Text(
                        'Terms of service and Privacy Policy',
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: AppCommonColors.defaultLink),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Social Links',
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              CustomTextFormField(
                textFormFieldType: TextFormFieldType.regular,
                hintText: 'Instagram',
                controller: _instagramController,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/listingIcons/insta.png',
                    height: 2.3.h,
                  ),
                ),
                hintStyle: context.textTheme.bodySmall?.copyWith(
                  fontSize: 14.sp,
                  color: AppCommonColors.unfilledForm,
                ),
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 14.sp,
                  color: AppCommonColors.filledForm,
                ),
                onChanged: (value) => _checkIfButtonShouldBeEnabled(),
              ),
              SizedBox(height: 1.4.h),
              CustomTextFormField(
                textFormFieldType: TextFormFieldType.regular,
                hintText: 'Snapchat',
                controller: _snapchatController,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/listingIcons/snapchat.png',
                    height: 2.3.h,
                  ),
                ),
                hintStyle: context.textTheme.bodySmall?.copyWith(
                  fontSize: 14.sp,
                  color: AppCommonColors.unfilledForm,
                ),
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 14.sp,
                  color: AppCommonColors.filledForm,
                ),
                onChanged: (value) => _checkIfButtonShouldBeEnabled(),
              ),
              SizedBox(height: 1.4.h),
              CustomTextFormField(
                textFormFieldType: TextFormFieldType.regular,
                hintText: 'Twitter',
                controller: _twitterController,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/listingIcons/twitter.png',
                    height: 2.3.h,
                  ),
                ),
                hintStyle: context.textTheme.bodySmall?.copyWith(
                  fontSize: 14.sp,
                  color: AppCommonColors.unfilledForm,
                ),
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 14.sp,
                  color: AppCommonColors.filledForm,
                ),
                onChanged: (value) => _checkIfButtonShouldBeEnabled(),
              ),
              SizedBox(height: 1.4.h),
              CustomTextFormField(
                textFormFieldType: TextFormFieldType.regular,
                hintText: 'Facebook',
                controller: _facebookController,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/listingIcons/facebook.png',
                    height: 2.3.h,
                  ),
                ),
                hintStyle: context.textTheme.bodySmall?.copyWith(
                  fontSize: 14.sp,
                  color: AppCommonColors.unfilledForm,
                ),
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 14.sp,
                  color: AppCommonColors.filledForm,
                ),
                onChanged: (value) => _checkIfButtonShouldBeEnabled(),
              ),
              SizedBox(height: 1.4.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 6.w),
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
      ),
    );
  }
}
