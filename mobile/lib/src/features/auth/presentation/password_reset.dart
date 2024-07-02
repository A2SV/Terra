import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/theme/text_theme.dart';
import 'package:mobile/src/core/utils/custom_textformfield.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../onboarding/presentation/widgets/page_indicator.dart';

class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({super.key});

  @override
  State<PasswordResetScreen> createState() => _PasswordResetScreenState();
}

TextEditingController passwordController = TextEditingController();
bool passwordVisibility = true;

TextEditingController passwordController1 = TextEditingController();
bool passwordVisibility1 = true;

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                      Container(
                        margin: EdgeInsets.fromLTRB(2.w, 0, 2.w, 0),
                        child: PageIndicator(
                          width: 10.w,
                          color: AppCommonColors.mainBlueButton,
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppCommonColors.imageBackgroundColor.withOpacity(0.75),
                ),
                child: Image.asset(
                  'assets/images/lock.png',
                  width: 25.w,
                  height: 25.w,
                ),
              ),
              Container(
                key: const Key('Reset Password'),
                margin: EdgeInsets.all(1.h),
                child: Text(
                  'Reset Password',
                  style: CustomTextStyles.kDefaultTextTheme(
                          AppCommonColors.defaultLink)
                      .displayMedium,
                ),
              ),
              Container(
                key: const Key('Description'),
                margin: EdgeInsets.all(1.h),
                child: Text(
                  'Reset your password and join the terra family today',
                  style: CustomTextStyles.kDefaultTextTheme(
                          AppCommonColors.signInWithGoogleBgnd)
                      .bodyMedium,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                key: const Key('New Password'),
                child: SizedBox(
                    width: 85.w,
                    height: 10.h,
                    child: CustomTextFormField(
                      textFormFieldType: TextFormFieldType.password,
                      controller: passwordController,
                      hintText: 'New password',
                      borderSideColor: AppCommonColors.textFieldTextColor,
                      prefixIcon: SizedBox(
                        width: 15.w,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),
                            const Icon(
                              Icons.lock_outline,
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
              Container(
                key: const Key('Confirm new password'),
                child: SizedBox(
                    width: 85.w,
                    height: 10.h,
                    child: CustomTextFormField(
                      textFormFieldType: TextFormFieldType.password,
                      borderSideColor: AppCommonColors.textFieldTextColor,
                      hintText: 'Confirm New password',
                      prefixIcon: SizedBox(
                        width: 15.w,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),
                            const Icon(
                              Icons.lock_outline,
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
                  backgroundColor: AppCommonColors.mainBlueButton,
                  text: 'Reset Password',
                  onPressed: () {},
                  borderColor: AppCommonColors.mainBlueButton,
                  width: 85.w,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ));
  }
}
