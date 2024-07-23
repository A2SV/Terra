import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/utils/custom_extensions.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignInWithGoogleBtn extends StatelessWidget {
  final void Function() onPressed;
  const SignInWithGoogleBtn({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Sign In with Google',
      onPressed: onPressed,
      showSuffixWidget: true,
      suffixWidget:
          SvgPicture.asset('assets/svg/google.svg').leftPadding(16.0),
      backgroundColor: AppCommonColors.signInWithGoogleBgnd.withOpacity(0.1),
      borderColor: AppCommonColors.mainBlueButton,
      horizontalPadding: 20.w,
      textColor: AppCommonColors.fieldBorderColor,
      borderRadius: 14,
    );
  }
}
