import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/src/core/routes/routes.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/theme/text_theme.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';
import 'package:mobile/src/features/auth/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../onboarding/presentation/widgets/page_indicator.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with SingleTickerProviderStateMixin {
  final _emailController = TextEditingController();
  bool buttonDisabled = true;

  final _formKey = GlobalKey<FormState>();

  void _submitEmail() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthenticationBloc>().add(
            ForgotPasswordEvent(email: _emailController.text.trim()),
          );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

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
                    onPressed: () {
                      popScreen(context);
                    },
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
                width: 85.w,
                child: Center(
                  child: Text(
                    'Forgot your password?  Reset it now!',
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
                height: 6.h,
              ),
              Container(
                key: const Key('Email'),
                child: SizedBox(
                  width: 85.w,
                  child: Form(
                    key: _formKey,
                    child: CustomTextFormField(
                      textFormFieldType: TextFormFieldType.regular,
                      controller: _emailController,
                      hintText: 'Email',
                      validate: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Enter an email address";
                        } else if (!RegExp(
                                r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                            .hasMatch(value)) {
                          return "Enter a valid email address";
                        }
                        return null;
                      },
                      onChanged: (val) {
                        if (val == null || val.length < 3) {
                          buttonDisabled = true;
                        } else {
                          buttonDisabled = false;
                        }
                        setState(() {});
                      },
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
                      errorStyle: CustomTextStyles.kDefaultTextTheme(
                              AppCommonColors.textFieldTextColor)
                          .bodySmall!
                          .copyWith(
                            color: AppCommonColors.red,
                          ),
                      hintStyle: CustomTextStyles.kDefaultTextTheme(
                              AppCommonColors.textFieldTextColor)
                          .bodyMedium,
                      contentPadding: EdgeInsets.symmetric(vertical: 5.w),
                      style: CustomTextStyles.kDefaultTextTheme(
                              AppCommonColors.textFieldTextColor)
                          .bodyMedium,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              BlocConsumer<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  if (state is ForgotPasswordSuccess) {
                    switchScreen(
                      context: context,
                      routeName: AppRoutes.forgotPasswordEmailSent,
                      pathParameters: {"email": _emailController.text.trim()},
                    );
                  }
                  if (state is AuthenticationError) {
                    CustomSnackBar.errorSnackBar(
                      context: context,
                      message: state.message,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthenticationLoading) {
                    return const CircularProgressIndicator();
                  }
                  return SizedBox(
                    key: const Key('button'),
                    width: 100.w,
                    child: CustomButton(
                      onPressed: _submitEmail,
                      backgroundColor: AppCommonColors.mainBlueButton,
                      text: 'Continue',
                      borderColor: AppCommonColors.mainBlueButton,
                      width: 85.w,
                      disabled: buttonDisabled,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
