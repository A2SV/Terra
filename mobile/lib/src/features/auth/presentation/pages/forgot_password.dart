import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/theme/text_theme.dart';
import 'package:mobile/src/core/utils/custom_textformfield.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../onboarding/presentation/widgets/page_indicator.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

TextEditingController passwordController = TextEditingController();
bool passwordVisibility = true;

TextEditingController passwordController1 = TextEditingController();
bool passwordVisibility1 = true;

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with SingleTickerProviderStateMixin {
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
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 7.w,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Container(
                  alignment: Alignment.topCenter,
                  key: const Key('page-indicator'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(2.w, 0, 2.w, 0),
                        child: PageIndicator(
                          width: 10.w,
                          color: AppCommonColors.mainBlueButton,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(2.w, 0, 2.w, 0),
                        child: PageIndicator(
                          width: 10.w,
                          color: AppCommonColors.mainlightBlue,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(2.w, 0, 2.w, 0),
                        child: PageIndicator(
                          width: 10.w,
                          color: AppCommonColors.mainlightBlue,
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 5.h,
              ),
              Container(
                key: const Key('image'),
                margin: EdgeInsets.all(5.h),
                padding: EdgeInsets.all(1.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppCommonColors.imageBackgroundColor.withOpacity(0.75),
                ),
                child: Image.asset(
                  'assets/images/mail.png',
                  width: 23.w,
                  height: 23.w,
                ),
              ),
              Container(
                key: const Key('forgot password'),
                margin: EdgeInsets.all(1.h),
                child: Text(
                  'Forgot Password?',
                  style: CustomTextStyles.kDefaultTextTheme(
                          AppCommonColors.defaultLink)
                      .displayMedium,
                ),
              ),
              Container(
                  key: const Key('Description'),
                  margin: EdgeInsets.all(1.h),
                  alignment: Alignment.center,
                  width: 85.w,
                  child: Center(
                    child: Text(
                      'Forgot your password?  Reset it now and get back to the Terra family!',
                      style: CustomTextStyles.kDefaultTextTheme(
                              AppCommonColors.signInWithGoogleBgnd)
                          .bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  )),
              SizedBox(
                height: 2.h,
              ),
              Container(
                key: const Key('Email'),
                child: SizedBox(
                    width: 85.w,
                    height: 10.h,
                    child: CustomTextFormField(
                      textFormFieldType: TextFormFieldType.regular,
                      controller: passwordController,
                      hintText: 'Email',
                      borderSideColor: AppCommonColors.textFieldTextColor,
                      prefixIcon: SizedBox(
                        width: 15.w,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),
                            const Icon(
                              Icons.email_outlined,
                              color: AppCommonColors.textFieldTextColor,
                            ),
                          ],
                        ),
                      ),
                      hintStyle: CustomTextStyles.kDefaultTextTheme(
                              AppCommonColors.textFieldTextColor)
                          .bodyMedium,
                      contentPadding: EdgeInsets.symmetric(vertical: 5.w),
                      style: CustomTextStyles.kDefaultTextTheme(
                              AppCommonColors.textFieldTextColor)
                          .bodyMedium,
                    )),
              ),
              SizedBox(
                key: const Key('button'),
                width: 100.w,
                child: CustomButton(
                  onPressed: () {},
                  backgroundColor: AppCommonColors.mainBlueButton,
                  text: 'Continue',
                  borderColor: AppCommonColors.mainBlueButton,
                  width: 85.w,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
