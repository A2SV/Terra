import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';
import 'package:mobile/src/features/auth/presentation/widgets/auth_text_form_field.dart';
import 'package:mobile/src/features/auth/presentation/widgets/sign_in_with_google.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.8.h, horizontal: 4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 8.h,
                ),
                SvgPicture.asset('assets/svg/terra_logo.svg'),
                SizedBox(height: 2.h),
                Text(
                  'Sign In',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                const Text(
                  'Welcome to the Terra family',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
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
                Text(
                  "Forgot password?",
                  style: TextStyle(
                    fontSize: 15.sp,
                  ),
                  textAlign: TextAlign.end,
                ),
                SizedBox(height: 6.h),
                CustomButton(
                  text: 'Log In',
                  onPressed: () {
                    final valid = CustomValidator.validateForm(_formKey);
                    if (valid) {}
                  },
                  horizontalPadding: 0,
                  borderColor: Colors.white,
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: AppCommonColors.fieldBorderColor),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 15.sp, color: AppCommonColors.defaultLink),
                    ),
                  ),
                ]),
                SizedBox(height: 6.h),
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
