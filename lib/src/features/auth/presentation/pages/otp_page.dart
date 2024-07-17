import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/app_light_theme_colors.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OTPage extends StatelessWidget {
  const OTPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pinController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Theme.of(context).colorScheme.onPrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 1.8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 7.5.w,
                    height: 4,
                    color: AppCommonColors.pageViewIconUnactive, //
                  ),
                  SizedBox(width: 2.w),
                  Container(
                    width: 7.5.w,
                    height: 4,
                    color: AppCommonColors.pageViewIconActive, //
                  ),
                  SizedBox(width: 2.w),
                  Container(
                    width: 7.5.w,
                    height: 4,
                    color: AppCommonColors.pageViewIconUnactive, //
                  ),
                ],
              ),
              SizedBox(height: 7.h),
              Image.asset(
                "assets/images/messageIcon.png",
                height: 10.h,
              ),
              SizedBox(height: 5.h),
              const Text(
                'Enter OTP',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppCommonColors.mainBlueButton //blue
                    ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Enter the OTP code we just sent you on your',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: AppLightThemeColors.kBlackTextColor,
                ),
              ),
              const Text(
                'registered email',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: AppLightThemeColors.kBlackTextColor,
                ),
              ),
              const SizedBox(height: 30),
              Pinput(
                controller: pinController,
                length: 6,
                showCursor: true,
                onChanged: (value) {
                  // Handle OTP input change
                },
                onCompleted: (pin) {
                  // Handle OTP input completion
                },
                defaultPinTheme: PinTheme(
                  width: 50,
                  height: 50,
                  textStyle:
                      const TextStyle(fontSize: 18, color: Colors.black), //
                  decoration: BoxDecoration(
                    color: AppLightThemeColors.kBlackTextColor, //
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: AppLightThemeColors.kLightTextColor), //
                  ),
                ),
              ),
              const SizedBox(height: 30),
              CustomButton(
                horizontalPadding: 0,
                text: 'Verify',
                onPressed: () {
                  var value = pinController.value.text;
                  if (value.length < 6) {
                    return;
                  }
                  Navigator.pushReplacementNamed(context, "/signin");
                },
                height: 50,
                borderColor: AppCommonColors.mainBlueButton, //
                borderRadius: 10,
                backgroundColor: AppCommonColors.mainBlueButton, //
                textColor: Theme.of(context).colorScheme.onPrimary,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Didn't get OTP? ",
                      style: const TextStyle(
                          color: AppLightThemeColors.kBlackTextColor,
                          fontSize: 12), //
                      children: [
                        TextSpan(
                          text: 'Resend OTP',
                          style: const TextStyle(
                            color: AppCommonColors.mainBlueButton, //
                            fontSize: 12,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Handle resend OTP action
                            },
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'Incorrect Try again',
                    style: TextStyle(
                      color: AppCommonColors.red, //red
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
