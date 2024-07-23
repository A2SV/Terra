import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/src/core/dp_injection/dependency_injection.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/theme/text_theme.dart';
import 'package:mobile/src/core/utils/custom_textformfield.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';
import 'package:mobile/src/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../onboarding/presentation/widgets/page_indicator.dart';

class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({super.key});

  @override
  State<PasswordResetScreen> createState() => _PasswordResetScreenState();
}

TextEditingController passwordController =
    TextEditingController(); //new password
bool passwordVisibility = true;

TextEditingController passwordController1 =
    TextEditingController(); //confirm password
bool passwordVisibility1 = true;

class _PasswordResetScreenState extends State<PasswordResetScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  
  get token => null;
  
  get email => null;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  key: const Key('image'),
                  margin: EdgeInsets.all(5.h),
                  child: Image.asset(
                    'assets/images/lock_bubble.png',
                    width: 35.w,
                    height: 35.w,
                  ),
                ),
                Center(
                  child: Text(
                    'Reset Password',
                    style: CustomTextStyles.kDefaultTextTheme(
                            AppCommonColors.defaultLink)
                        .displaySmall,
                  ),
                ),
                Center(
                  child: Text(
                    'Successful!',
                    style: CustomTextStyles.kDefaultTextTheme(
                            AppCommonColors.defaultLink)
                        .displaySmall,
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Please wait...',
                    style: CustomTextStyles.kDefaultTextTheme(
                            AppCommonColors.dialogTextColor)
                        .bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'You will be directed to Sign In soon.',
                    style: CustomTextStyles.kDefaultTextTheme(
                            AppCommonColors.dialogTextColor)
                        .bodyMedium,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                    alignment: Alignment.center,
                    child: Center(
                      child: AnimatedBuilder(
                        animation: _animation,
                        child: Image.asset(
                          'assets/images/loading.png',
                          width: 20.w,
                          height: 20.w,
                        ),
                        builder: (BuildContext context, Widget? child) {
                          return Transform.rotate(
                            angle: _animation.value * 2.0 * 3.14159,
                            child: child,
                          );
                        },
                      ),
                    )),
                /*
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Close"),
                ),

                 */
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is ResetPasswordError) {
            CustomSnackBar.errorSnackBar(
              context: context,
              message: state.message,
            );
          } else if (state is ResetPasswordSuccess) {
            _showCustomDialog(context);
            Navigator.pushNamed(context, '/dashboard');
          }
        },
        builder: (context, state) {
          return SafeArea(
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
                        onPressed: () {},
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
                      color: AppCommonColors.imageBackgroundColor
                          .withOpacity(0.75),
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
                      onPressed: () => context.read<AuthenticationBloc>().add(
                          ResetPasswordEvent(
                              email: email,
                              newPassword: passwordController.text.trim(),
                              confirmPassword: passwordController1.text.trim(),
                              token: token)),
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
          );
        },
      ),
    );
  }
}
