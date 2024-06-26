

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/src/core/theme/text_theme.dart';

import '../../../core/theme/app_light_theme_colors.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            key: Key('image'),
            child: Image.asset('assets/images/lock.png'),
            color: AppLightThemeColors.kFieldBackgroundColor.withOpacity(0.15),
          ),
          Container(
            key: Key('Reset Password'),
            child: Text(
              'Reset Password',
              style: CustomTextStyles.kDefaultTextTheme().displayLarge,
            ),
          ),
          Container(
            key: Key('Description'),
            child: Text('Reset your password and join the terra family today'),
          ),
          Container(
            key: Key('New Password'),
            child:Container(

              width: 300,
              height: 50,
              child: TextField(
                obscureText: passwordVisibility,
                controller: passwordController,
                decoration: InputDecoration(
                  prefixIcon:Icon(Icons.lock_outline),
                    fillColor: Colors.white,
                    filled:true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 2,
                        color:Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey,
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
                      icon:passwordVisibility?Icon(Icons.visibility_outlined):Icon(Icons.visibility_off_outlined),
                    ),
                    hintText: 'New Password'
                ),
              ),
            ),
          ),
          Container(
            key: Key('Confirm new password'),
            child:TextField(
              obscureText: passwordVisibility1,
              controller: passwordController1,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      passwordVisibility1=!passwordVisibility1;
                      print(passwordVisibility1);
                    });

                  },
                  icon:passwordVisibility1?Icon(Icons.visibility_outlined):Icon(Icons.visibility_off_outlined),
                ),
                icon: Icon(
                    Icons.lock_outline
                ),
                  hintText: 'Confirm New Password'
              ),
            ),
          ),
          Container(
            key: Key('button'),
            child: ElevatedButton(
              onPressed: () {
                // Perform some action
              },
              style: ElevatedButton.styleFrom(
                // Define button's look with styleFrom
                backgroundColor: Colors.blue, // Set the background color
                foregroundColor: Colors.white, // Set the text (and icon) color
                shape: RoundedRectangleBorder(
                  // The button's outline is defined as a rounded rectangle with circular corners
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Text('Reset Password'), // Button's label
            ),
          ),

        ],
      ),
    );
  }
}