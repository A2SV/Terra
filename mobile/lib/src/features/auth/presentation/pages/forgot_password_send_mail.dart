import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/src/core/routes/routes.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/theme/text_theme.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';
import 'package:mobile/src/core/widgets/custom_loader.dart';
import 'package:mobile/src/features/auth/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../onboarding/presentation/widgets/page_indicator.dart';

class ForgotPasswordSendMail extends StatelessWidget {
  const ForgotPasswordSendMail({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  SizedBox(width: 4.w),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 5.8.w,
                    ),
                    onPressed: () => popScreen(context),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Container(
                alignment: Alignment.topCenter,
                key: const Key('page-indicator'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(1.5.w, 0, 1.5.w, 0),
                      child: PageIndicator(
                        width: 8.w,
                        color: AppCommonColors.mainlightBlue,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(1.5.w, 0, 1.5.w, 0),
                      child: PageIndicator(
                        width: 8.w,
                        color: AppCommonColors.mainBlueButton,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(1.5.w, 0, 1.5.w, 0),
                      child: PageIndicator(
                        width: 8.w,
                        color: AppCommonColors.mainlightBlue,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                key: const Key('image'),
                margin: EdgeInsets.all(6.h),
                padding: EdgeInsets.all(1.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppCommonColors.forgotPasswordMailBackground,
                ),
                child: Image.asset(
                  'assets/images/mail.png',
                  width: 17.w,
                  height: 17.w,
                ),
              ),
              Container(
                key: const Key('forgot password'),
                child: Text(
                  'Forgot Password?',
                  style: CustomTextStyles.kDefaultTextTheme(
                          AppCommonColors.defaultLink)
                      .displayMedium!
                      .copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 22.sp,
                      ),
                ),
              ),
              Container(
                key: const Key('Description'),
                margin: EdgeInsets.all(1.h),
                alignment: Alignment.center,
                width: 65.w,
                child: Center(
                  child: Text(
                    'A link has been sent to your email account Follow the instructions and get back here',
                    style: CustomTextStyles.kDefaultTextTheme(
                      AppCommonColors.signInWithGoogleBgnd,
                    ).bodyMedium!.copyWith(
                          fontSize: 14.5.sp,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              BlocConsumer<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  if (state is AuthenticationError) {
                    CustomSnackBar.errorSnackBar(
                      context: context,
                      message: state.message,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthenticationLoading) {
                    return CustomLoader(
                      height: 4.5.h,
                    );
                  }
                  return SizedBox(
                    key: const Key('button'),
                    width: 100.w,
                    child: CustomButton(
                      onPressed: () {
                        switchScreen(
                          context: context,
                          routeName: AppRoutes.signin,
                          popAndPush: true,
                        );
                      },
                      backgroundColor: AppCommonColors.mainBlueButton,
                      text: 'Back to Login',
                      borderColor: AppCommonColors.mainBlueButton,
                      width: 85.w,
                    ),
                  );
                },
              ),
              SizedBox(height: 2.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Didnt get email?  ",
                        style: CustomTextStyles.kDefaultTextTheme(
                          AppCommonColors.signInWithGoogleBgnd,
                        ).bodyMedium!.copyWith(
                              fontSize: 14.5.sp,
                              color: AppCommonColors.appBlack,
                            ),
                        children: [
                          TextSpan(
                            text: "Resend",
                            style: CustomTextStyles.kDefaultTextTheme(
                              AppCommonColors.signInWithGoogleBgnd,
                            ).bodyMedium!.copyWith(
                                  fontSize: 14.5.sp,
                                  color: AppCommonColors.pageViewIconActive,
                                ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.read<AuthenticationBloc>().add(
                                      ResendOTPEvent(email: email),
                                    );
                              },
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "0:59 seconds",
                      style: CustomTextStyles.kDefaultTextTheme(
                        AppCommonColors.signInWithGoogleBgnd,
                      ).bodyMedium!.copyWith(
                            fontSize: 14.5.sp,
                            color: AppCommonColors.red,
                          ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
