import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/src/onboarding/presentation/widgets/page_indicator.dart';
import 'package:pinput/pinput.dart';

import '../../../core/theme/common_color.dart';
import '../../../core/theme/text_theme.dart';


class OtpScreen extends StatefulWidget{
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

final pinController = TextEditingController();


class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,

        children: <Widget>[

          Container(
            key: Key('image'),
            child:Image.asset('assets/images/mail.png')
          ),
          Container(
            key: Key('Enter OTP'),
            child: Text(
                'Enter OTP',
              style:CustomTextStyles.kDefaultTextTheme(AppCommonColors.defaultLink).displayMedium,
            )
          ),
          Container(
              key: Key('description'),
              child: Text(
                  'Enter OTP code we just sent to you on your registered email',
                style: CustomTextStyles.kDefaultTextTheme(AppCommonColors.signInWithGoogleBgnd).bodyMedium,
              )
          ),
          Container(
            key: Key('Input'),
            child: Directionality(
              // Specify direction if desired
              textDirection: TextDirection.ltr,
              child: Pinput(
                length: 6,
                controller: pinController,
                focusNode: FocusNode(),
                onCompleted: (String verificationCode) {
                  // debugPrint('onCompleted: $pin');
                },
                onChanged: (code) {
                  // debugPrint('onChanged: $value');
                },
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 9),
                      width: 22,
                      height: 1,
                      color: Colors.red,
                    ),
                  ],
                ),
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
              child: const Text('Verify'), // Button's label
            ),

          ),

          Row(
            children: <Widget>[
              Container(
                key: Key('resend'),
                child:Row(
                  children: <Widget>[
                    Text('Didn\'t get OTP?'),
                    TextButton(
                        onPressed: (){},
                        child: Text('Resend')
                    ),
                  ],
                )
              ),
              Container(
                key: Key('feedback'),
              ),
            ],
          )

        ],
      ),
    );
  }
}