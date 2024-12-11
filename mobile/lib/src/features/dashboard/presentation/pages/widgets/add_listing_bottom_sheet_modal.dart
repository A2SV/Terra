import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/text_theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/theme/common_color.dart';
import '../../../../../core/widgets/custom_button.dart';

class AddListingBottomSheetModal {

  final BuildContext context;
  final bool error;




  AddListingBottomSheetModal({
    required this.context,
    required this.error
  }){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 75.h,
          decoration: const BoxDecoration(
              color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  error==true?"assets/images/add_listings_error.png":"assets/images/add_listing_sucess.png",
                  height: 25.h,
                  width: 25.h,
                ),
                _displayMessage(error),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  error==true?'Click on Retry to continue to the add listing':'Click finish to continue to your ',
                  style: CustomTextStyles.kDefaultTextTheme(const Color(0xFF252B5C)).bodyMedium,
                ),
                Text(
                  error==true?'page':'homepage',
                  style: CustomTextStyles.kDefaultTextTheme(const Color(0xFF252B5C)).bodyMedium,
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomButton(
                  width: 75.w,
                  horizontalPadding: 5,
                  borderColor: AppCommonColors.mainBlueButton,
                  text: error==true?'Retry':'Finish',
                  onPressed:() => Navigator.pop(context) ,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _displayMessage(bool error){
  if (error==true){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Aw snap, an ',
              style: CustomTextStyles.kDefaultTextTheme(const Color(0xFF252B5C)).bodyMedium?.copyWith(fontSize: 20.sp),
            ),
            Text(
              'error',
              style: CustomTextStyles.kDefaultTextTheme(const Color(0xFF252B5C)).bodyMedium?.copyWith(fontSize: 20.sp,fontWeight: FontWeight.w800),
            ),
          ],
        ),
        Text(
          'occured',
          style: CustomTextStyles.kDefaultTextTheme(const Color(0xFF252B5C)).bodyMedium?.copyWith(fontSize: 20.sp),
        ),
      ],
    );
  }else{
    return Column(
      children: [
        Text(
          'Your Listing is now',
          style: CustomTextStyles.kDefaultTextTheme(const Color(0xFF252B5C)).bodyMedium?.copyWith(fontSize: 20.sp),
        ),
        Text(
          'Published',
          style: CustomTextStyles.kDefaultTextTheme(const Color(0xFF252B5C)).bodyMedium?.copyWith(fontSize: 20.sp,fontWeight: FontWeight.w800),

        ),
      ],
    );
  }
}