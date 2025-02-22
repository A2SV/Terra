import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/src/core/routes/routes.dart';
import 'package:mobile/src/core/theme/app_light_theme_colors.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';
import 'package:mobile/src/core/widgets/custom_loader.dart';
import 'package:mobile/src/features/auth/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:mobile/src/features/auth/presentation/widgets/auth_text_form_field.dart';
import 'package:mobile/src/features/auth/presentation/widgets/sign_in_with_google.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/text_theme.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool passwordVisibility = true;
  bool passwordVisibility1 = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.8.h, horizontal: 4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 7.h,
                ),
                Row(
                  children: [
                    SizedBox(width: 36.w),
                    SvgPicture.asset(
                      "assets/svg/terra_logo.svg",
                      height: 20.w,
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Text(
                  'Sign In',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: AppLightThemeColors.kBlackColor,
                  ),
                ),
                Text(
                  'Welcome to the Terra family',
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.kDefaultTextTheme(
                          AppLightThemeColors.kBlackTextColor)
                      .bodySmall
                      ?.copyWith(fontSize: 16),
                ),
                SizedBox(height: 4.h),
                AuthTextFormField(
                    firstNameController: emailController,
                    icon: Icons.email_outlined,
                    labelText: 'Email',
                    validator: (email) =>
                        CustomValidator.validateEmail(email ?? "")),
                SizedBox(height: 2.h),
                AuthTextFormField(
                  firstNameController: passwordController,
                  icon: Icons.lock_outline,
                  labelText: 'Password',
                  validator: (password) =>
                      CustomValidator.validatePassword(password ?? ""),
                  obscureText: passwordVisibility1,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        passwordVisibility1 = !passwordVisibility1;
                      });
                    },
                    color: AppCommonColors.fieldBorderColor,
                    icon: passwordVisibility1
                        ? const Icon(Icons.visibility_outlined)
                        : const Icon(Icons.visibility_off_outlined),
                  ),
                ),
                SizedBox(height: 3.h),
                GestureDetector(
                  onTap: () => switchScreen(
                    context: context,
                    routeName: AppRoutes.forgotPassword,
                  ),
                  child: Text(
                    "Forgot password?",
                    style: CustomTextStyles.kDefaultTextTheme(
                            AppLightThemeColors.kBlackTextColor)
                        .bodySmall
                        ?.copyWith(
                          fontSize: 15.sp,
                        ),
                    textAlign: TextAlign.end,
                  ),
                ),
                SizedBox(height: 5.h),
                BlocConsumer<AuthenticationBloc, AuthenticationState>(
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      CustomSnackBar.successSnackBar(
                        context: context,
                        message: "User login successful",
                      );
                    }

                    if (state is LoginFailed) {
                      CustomSnackBar.errorSnackBar(
                          context: context, message: state.message);
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthenticationLoading) {
                      return CustomLoader(
                        height: 4.5.h,
                      );
                    }
                    return CustomButton(
                      text: 'Log In',
                      onPressed: () async {
                        final valid = CustomValidator.validateForm(_formKey);
                        if (valid) {
                          context.read<AuthenticationBloc>().add(
                                LoginUserEvent(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              );
                        }
                      },
                      horizontalPadding: 0,
                      borderColor: Theme.of(context).colorScheme.onPrimary,
                    );
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "Don't have an account? ",
                    style: CustomTextStyles.kDefaultTextTheme(
                            AppLightThemeColors.kBlackTextColor)
                        .bodySmall
                        ?.copyWith(
                            fontSize: 15.sp,
                            color: AppCommonColors.fieldBorderColor),
                  ),
                  TextButton(
                    onPressed: () {
                      switchScreen(
                        context: context,
                        routeName: AppRoutes.signup,
                        popAndPush: true,
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: CustomTextStyles.kDefaultTextTheme(
                              AppLightThemeColors.kBlackTextColor)
                          .bodySmall
                          ?.copyWith(
                              fontSize: 15.sp,
                              color: AppCommonColors.defaultLink),
                    ),
                  ),
                ]),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: AppCommonColors.fieldBorderColor,
                      ),
                    ),
                    Text(
                      '  Or  ',
                      style: CustomTextStyles.kDefaultTextTheme(
                              AppLightThemeColors.kBlackTextColor)
                          .bodySmall
                          ?.copyWith(color: AppCommonColors.fieldBorderColor),
                    ),
                    const Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: AppCommonColors.fieldBorderColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                SignInWithGoogleBtn(onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
