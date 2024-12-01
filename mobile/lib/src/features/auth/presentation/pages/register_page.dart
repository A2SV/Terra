import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/src/core/routes/routes.dart';
import 'package:mobile/src/core/theme/app_light_theme_colors.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';
import 'package:mobile/src/core/widgets/skip_button.dart';

import 'package:mobile/src/features/auth/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:mobile/src/features/auth/presentation/widgets/auth_text_form_field.dart';
import 'package:mobile/src/features/auth/presentation/widgets/sign_in_with_google.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/text_theme.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _agreeToTerms = false;
  bool passwordVisibility = true;
  bool passwordVisibility1 = true;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationError) {
          CustomSnackBar.errorSnackBar(
            context: context,
            message: state.message,
          );
        } else if (state is AuthenticationSuccess) {
          Navigator.pushNamed(context, '/otp');
        }
      },
      builder: (context, state) {
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
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 36.w),
                        SvgPicture.asset(
                          "assets/svg/terra_logo.svg",
                          height: 20.w,
                        ),
                        SizedBox(width: 19.w),
                        GestureDetector(
                          onTap: () {
                            switchScreen(
                              context: context,
                              routeName: AppRoutes.dashboard,
                              popAndPush: true,
                            );
                          },
                          child: const SkipButton(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Sign Up',
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.kDefaultTextTheme(
                              AppLightThemeColors.kBlackTextColor)
                          .bodySmall
                          ?.copyWith(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600,
                              color: AppLightThemeColors.kBlackColor),
                    ),
                    Text(
                      'Join the Terra family',
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.kDefaultTextTheme(
                              AppLightThemeColors.kBlackTextColor)
                          .bodySmall
                          ?.copyWith(fontSize: 16),
                      //TextStyle(fontSize: 16)
                    ),
                    const SizedBox(height: 28),
                    Row(
                      children: [
                        Expanded(
                          child: AuthTextFormField(
                            firstNameController: firstNameController,
                            labelText: 'First Name',
                            icon: Icons.person_2_outlined,
                            validator: (name) =>
                                CustomValidator.isNotEmpty(name ?? ""),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: AuthTextFormField(
                              firstNameController: lastNameController,
                              icon: Icons.person_2_outlined,
                              labelText: 'Last Name',
                              validator: (name) =>
                                  CustomValidator.isNotEmpty(name ?? "")),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    AuthTextFormField(
                        firstNameController: emailController,
                        icon: Icons.email_outlined,
                        labelText: 'Email',
                        validator: (email) =>
                            CustomValidator.validateEmail(email ?? "")),
                    const SizedBox(height: 12),
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
                    const SizedBox(height: 12),
                    AuthTextFormField(
                      firstNameController: confirmPasswordController,
                      icon: Icons.lock_outline,
                      labelText: 'Confirm password',
                      validator: (password) {
                        return CustomValidator.validatePassword(
                                password ?? "") ??
                            CustomValidator.validatePasswordFields(
                                passwordController.text,
                                confirmPasswordController.text);
                      },
                      obscureText: passwordVisibility,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordVisibility = !passwordVisibility;
                          });
                        },
                        color: AppCommonColors.fieldBorderColor,
                        icon: passwordVisibility
                            ? const Icon(Icons.visibility_outlined)
                            : const Icon(Icons.visibility_off_outlined),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: AppCommonColors.mainBlueButton,
                          value: _agreeToTerms,
                          onChanged: (bool? value) {
                            setState(() {
                              _agreeToTerms = value!;
                            });
                          },
                        ),
                        Text(
                          'I agree to the ',
                          style: CustomTextStyles.kDefaultTextTheme(
                                  AppLightThemeColors.kBlackTextColor)
                              .bodySmall
                              ?.copyWith(fontSize: 14.sp),
                          //TextStyle(fontSize: 14.sp),
                        ),
                        Text(
                          'Terms of service and Privacy Policy',
                          style: CustomTextStyles.kDefaultTextTheme(
                                  AppLightThemeColors.kBlackTextColor)
                              .bodySmall
                              ?.copyWith(
                                fontSize: 14.sp,
                                color: AppCommonColors.defaultLink,
                              ),

                          //TextStyle(fontSize: 14.sp, color: AppCommonColors.defaultLink,),
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    CustomButton(
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
                      text: state is AuthenticationLoading
                          ? ""
                          : 'Create Account',
                      onPressed: () {
                        final isValid = CustomValidator.validateForm(_formKey);

                        if (isValid) {
                          if (!_agreeToTerms) {
                            CustomSnackBar.errorSnackBar(
                              context: context,
                              message:
                                  "Agree with Terms of service and Privacy Policy to continue",
                            );
                            return;
                          }

                          context.read<AuthenticationBloc>().add(
                              AuthenticationRegisterUserEvent(
                                  firstName: firstNameController.text.trim(),
                                  lastName: lastNameController.text.trim(),
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                  phoneNumber: '0500000000',
                                  role: 'tenant'));
                        }
                      },
                      horizontalPadding: 0,
                      borderColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        'Already have an account? ',
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
                            routeName: AppRoutes.signin,
                            popAndPush: true,
                          );
                        },
                        child: Text(
                          'Sign In',
                          style: CustomTextStyles.kDefaultTextTheme(
                                  AppLightThemeColors.kBlackTextColor)
                              .bodySmall
                              ?.copyWith(
                                  fontSize: 15.sp,
                                  color: AppCommonColors.defaultLink),
                        ),
                      ),
                    ]),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Expanded(
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
                              ?.copyWith(
                                  color: AppCommonColors.fieldBorderColor),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: AppCommonColors.fieldBorderColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SignInWithGoogleBtn(onPressed: () {})
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }
}
