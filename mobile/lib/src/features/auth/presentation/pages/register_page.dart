import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';
import 'package:mobile/src/features/auth/presentation/widgets/auth_text_form_field.dart';
import 'package:mobile/src/features/auth/presentation/widgets/sign_in_with_google.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


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
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.8.h, horizontal: 4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 6.h,
                ),
                SvgPicture.asset('assets/svg/terra_logo.svg'),
                const SizedBox(height: 12),
                Text(
                  'Sign Up',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                const Text(
                  'Join the Terra family',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
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
                  validator: (password) =>
                      CustomValidator.validatePassword(password ?? ""),
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
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    Text(
                      'Terms of service and Privacy Policy',
                      style: TextStyle(
                          fontSize: 14.sp, color: AppCommonColors.defaultLink),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                CustomButton(
                  text: 'Create Account',
                  onPressed: () {
                    final valid = CustomValidator.validateForm(_formKey);
                    if (valid) {}
                  },
                  horizontalPadding: 0,
                  borderColor: Colors.white,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: AppCommonColors.fieldBorderColor),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 15.sp, color: AppCommonColors.defaultLink),
                    ),
                  ),
                ]),
                const SizedBox(height: 2),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: AppCommonColors.fieldBorderColor,
                      ),
                    ),
                    Text(
                      '  Or  ',
                      style: TextStyle(color: AppCommonColors.fieldBorderColor),
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
  }
}
