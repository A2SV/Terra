import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/text_theme.dart';
import 'package:mobile/src/core/widgets/upload_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/utils/utils.dart';

class AddListingMediaPage extends StatefulWidget {
  AddListingMediaPage({Key? key}) : super(key: key);

  @override
  State<AddListingMediaPage> createState() => _AddListingMediaPageState();

  static void _onUploadTap() {
    // Handle upload property pictures tap
  }
}

class _AddListingMediaPageState extends State<AddListingMediaPage> {
  final TextEditingController _videoLinkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Theme.of(context).colorScheme.onPrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 1.8.h),
            Text(
              'Add Listing',
              style: CustomTextStyles.kDefaultTextTheme(Colors.black)
                  .displaySmall
                  ?.copyWith(fontSize: 19, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 5.h),
            Text.rich(
              TextSpan(
                style: context.textTheme.headlineMedium!.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
                children: const [
                  TextSpan(text: 'Add '),
                  TextSpan(
                    text: 'media',
                    style: TextStyle(
                      color: AppCommonColors.mainBlueButton,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextSpan(text: ' to your listing'),
                ],
              ),
            ),
            SizedBox(height: 4.h),
            const UploadField(
              onTap: AddListingMediaPage._onUploadTap,
            ),
            SizedBox(height: 5.h),
            const Text('Video Link (YouTube)'),
            SizedBox(
              height: 1.5.h,
            ),
            CustomTextFormField(
              textFormFieldType: TextFormFieldType.regular,
              hintText: 'e.g: https://www.youtube.com/xxxxx',
              hintStyle: context.textTheme.bodySmall?.copyWith(
                fontSize: 13.sp,
                color: AppCommonColors.unfilledForm,
              ),
              style: context.textTheme.bodySmall?.copyWith(
                fontSize: 12.sp,
                color: AppCommonColors.filledForm,
              ),
              controller: _videoLinkController,
              keyboardType: TextInputType.url,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 4.h),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.w),
              child: ElevatedButton(
                onPressed: () {
                  // Handle next button press
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 5.h),
                  backgroundColor: AppCommonColors.unfilledForm,
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