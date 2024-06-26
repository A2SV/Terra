import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/main.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/theme/text_theme.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/theme/app_light_theme_colors.dart';
import '../../../onboarding/presentation/widgets/page_indicator.dart';

class PasswordResetScreen extends StatefulWidget{
  @override
  State<PasswordResetScreen> createState() => _PasswordResetScreenState();
}

TextEditingController passwordController=TextEditingController();
bool passwordVisibility=true;

TextEditingController passwordController1=TextEditingController();
bool passwordVisibility1=true;




class _PasswordResetScreenState extends State<PasswordResetScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){},
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            key: Key('page-indicator'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin:EdgeInsets.fromLTRB(2.w, 0, 2.w, 0),
                  child:PageIndicator(
                    width: 10.w,
                    color: AppCommonColors.mainlightBlue,
                  ),
                ),
                Container(
                  margin:EdgeInsets.fromLTRB(2.w, 0, 2.w, 0),
                  child:PageIndicator(
                    width: 10.w,
                    color: AppCommonColors.mainlightBlue,
                  ),
                ),
                Container(
                  margin:EdgeInsets.fromLTRB(2.w, 0, 2.w, 0),
                  child:PageIndicator(
                    width: 10.w,
                    color: AppCommonColors.mainBlueButton,
                  ),
                ),


              ],
            )
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            key: Key('image'),
            margin: EdgeInsets.all(5.h),
            child: Image.asset(
                'assets/images/lock.png',
              width: 30.w,
              height: 30.w,
            ),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppCommonColors.fieldBorderColor.withOpacity(0.15),
            ),

          ),
          Container(
            key: Key('Reset Password'),
            child: Text(
              'Reset Password',
              style: CustomTextStyles.kDefaultTextTheme(AppCommonColors.defaultLink).displayMedium,
            ),
          ),
          Container(
            key: Key('Description'),
            margin: EdgeInsets.all(1.h),
            child: Text(
              'Reset your password and join the terra family today',
              style: CustomTextStyles.kDefaultTextTheme(AppCommonColors.signInWithGoogleBgnd).bodyMedium,
            ),
          ),
          Container(
            key: Key('New Password'),
            margin: EdgeInsets.all(1.h),
            child:Container(
              width: 90.w,
              height: 50,
              child: TextField(
                style: CustomTextStyles.kDefaultTextTheme(AppCommonColors.fieldBorderColor).bodyMedium,
                obscureText: passwordVisibility,
                controller: passwordController,
                decoration: InputDecoration(

                    prefixIcon:Icon(
                      Icons.lock_outline,
                      color: AppCommonColors.fieldBorderColor,
                    ),
                    fillColor: Colors.white,
                    filled:true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 2,
                        color:AppCommonColors.fieldBorderColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: AppCommonColors.fieldBorderColor,
                          width: 2
                      ),
                      gapPadding: 10,
                    ),

                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passwordVisibility=!passwordVisibility;
                          print(passwordVisibility);
                        });
                      },
                      color: AppCommonColors.fieldBorderColor,
                      icon:passwordVisibility?Icon(Icons.visibility_outlined):Icon(Icons.visibility_off_outlined),
                    ),
                    hintText: 'New Password'
                ),
              ),
            ),
          ),
          Container(
            key: Key('Confirm new password'),
            margin: EdgeInsets.all(1.h),
            child:Container(
              width: 90.w,
              height: 50,
              child: TextField(
                style: CustomTextStyles.kDefaultTextTheme(AppCommonColors.fieldBorderColor).bodyMedium,
                obscureText: passwordVisibility1,
                controller: passwordController1,
                decoration: InputDecoration(

                    prefixIcon:Icon(
                      Icons.lock_outline,
                      color: AppCommonColors.fieldBorderColor,
                    ),
                    fillColor: Colors.white,
                    filled:true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 2,
                        color:AppCommonColors.fieldBorderColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: AppCommonColors.fieldBorderColor,
                          width: 2
                      ),
                      gapPadding: 10,
                    ),

                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passwordVisibility1=!passwordVisibility1;
                          print(passwordVisibility1);
                        });
                      },
                      color: AppCommonColors.fieldBorderColor,
                      icon:passwordVisibility?Icon(Icons.visibility_outlined):Icon(Icons.visibility_off_outlined),
                    ),
                    hintText: 'Confirm Password'
                ),
              ),
            ),
          ),
          Container(
            key: Key('button'),
            margin: EdgeInsets.all(1.h),
            width: 100.w,
            child: CustomButton(
              backgroundColor: AppCommonColors.mainBlueButton,
              text:'Reset Password',
              onPressed: (){},
            ),
          ),
          SizedBox(
            height: 10.h,
          ),

        ],
      ),
    );
  }
}