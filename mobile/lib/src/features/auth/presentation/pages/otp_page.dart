import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/src/core/routes/routes.dart';
import 'package:mobile/src/core/theme/app_light_theme_colors.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';
import 'package:mobile/src/features/auth/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/text_theme.dart';

class OTPage extends StatelessWidget {
  const OTPage({super.key, required this.email});

  final String email;

  void _onSubmitOTP(BuildContext context, String otp) {
    if (otp.length < 6) {
      return;
    }
    context.read<AuthenticationBloc>().add(
          VerifyOTPEvent(email: email, code: otp),
        );
  }

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
              Text(
                'Verify Email',
                style: CustomTextStyles.kDefaultTextTheme(
                        AppCommonColors.mainBlueButton)
                    .bodySmall
                    ?.copyWith(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppCommonColors.mainBlueButton,
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                'Enter the OTP code we just sent you on your',
                textAlign: TextAlign.center,
                style: CustomTextStyles.kDefaultTextTheme(
                        AppLightThemeColors.kBlackTextColor)
                    .bodySmall
                    ?.copyWith(
                      fontSize: 12,
                      color: AppLightThemeColors.kBlackTextColor,
                    ),
              ),
              Text(
                'registered email',
                textAlign: TextAlign.center,
                style: CustomTextStyles.kDefaultTextTheme(
                        AppLightThemeColors.kBlackTextColor)
                    .bodySmall
                    ?.copyWith(
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
                  textStyle: CustomTextStyles.kDefaultTextTheme(
                          AppLightThemeColors.kBlackTextColor)
                      .bodySmall
                      ?.copyWith(fontSize: 18, color: Colors.black),
                  decoration: BoxDecoration(
                    color: Colors.white, //
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: AppLightThemeColors.kLightTextColor), //
                  ),
                ),
              ),
              const SizedBox(height: 30),
              BlocConsumer<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  if (state is VerifyOTPSuccess) {
                    CustomSnackBar.successSnackBar(
                      context: context,
                      message: "Email verfied. login to Continue",
                    );
                    switchScreen(
                      context: context,
                      routeName: AppRoutes.signin,
                      popAndPush: true,
                    );
                  }
                  if (state is VerifyOTPFailure) {
                    CustomSnackBar.errorSnackBar(
                      context: context,
                      message: state.message,
                    );
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    showSuffixWidget: true,
                    suffixWidget: state is AuthenticationLoading
                        ? const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.0),
                              child: SizedBox(
                                height: 30.0,
                                width: 30.0,
                                child: CircularProgressIndicator.adaptive(
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    disabled: state is AuthenticationLoading,
                    text: state is AuthenticationLoading ? "" : 'Verify',
                    horizontalPadding: 0,
                    onPressed: () {
                      var value = pinController.value.text;
                      _onSubmitOTP(context, value);
                    },
                    height: 50,
                    borderColor: AppCommonColors.mainBlueButton, //
                    borderRadius: 10,
                    backgroundColor: AppCommonColors.mainBlueButton, //
                    textColor: Theme.of(context).colorScheme.onPrimary,
                  );
                },
              ),
              const SizedBox(height: 20),
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "Didn't get OTP? ",
                          style: CustomTextStyles.kDefaultTextTheme(
                                  AppLightThemeColors.kBlackTextColor)
                              .bodySmall
                              ?.copyWith(
                                  color: AppLightThemeColors.kBlackTextColor,
                                  fontSize: 12),
                          children: [
                            if (state is AuthenticationLoading)
                              TextSpan(
                                text: ' Sending..',
                                style: TextStyle(
                                  color: Colors.teal[700],
                                  fontSize: 12,
                                ),
                              )
                            // AppCommonColors.mainBlueButton
                            else
                              TextSpan(
                                text: ' Resend OTP',
                                style: CustomTextStyles.kDefaultTextTheme(
                                        AppCommonColors.mainBlueButton)
                                    .bodySmall
                                    ?.copyWith(
                                      color: AppCommonColors.mainBlueButton, //
                                      fontSize: 12,
                                    ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    context.read<AuthenticationBloc>().add(
                                          ResendOTPEvent(email: email),
                                        );
                                  },
                              )
                          ],
                        ),
                      ),
                      BlocBuilder<AuthenticationBloc, AuthenticationState>(
                        builder: (context, state) {
                          if (state is! VerifyOTPFailure) {
                            return const SizedBox();
                          }
                          return Text(
                            'Incorrect Try again',
                            style: CustomTextStyles.kDefaultTextTheme(
                                    AppCommonColors.red)
                                .bodySmall
                                ?.copyWith(
                                  color: AppCommonColors.red, //red
                                  fontSize: 12,
                                ),
                          );
                        },
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
