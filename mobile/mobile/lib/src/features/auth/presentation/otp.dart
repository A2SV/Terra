import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../core/theme/common_color.dart';
import '../../../core/theme/text_theme.dart';

<<<<<<< Updated upstream:mobile/lib/src/features/auth/presentation/otp.dart

class OtpScreen extends StatefulWidget{
  const OtpScreen({super.key});

=======
class OtpScreen extends StatefulWidget {
>>>>>>> Stashed changes:lib/src/features/auth/presentation/otp.dart
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
<<<<<<< Updated upstream:mobile/lib/src/features/auth/presentation/otp.dart
            key: const Key('image'),
            child:Image.asset('assets/images/mail.png')
          ),
          Container(
            key: const Key('Enter OTP'),
            child: Text(
=======
              key: const Key('image'),
              child: Image.asset('assets/images/mail.png')),
          Container(
              key: const Key('Enter OTP'),
              child: Text(
>>>>>>> Stashed changes:lib/src/features/auth/presentation/otp.dart
                'Enter OTP',
              style:CustomTextStyles.kDefaultTextTheme(AppCommonColors.defaultLink).displayMedium,
            )
          ),
          Container(
              key: const Key('description'),
              child: Text(
                  'Enter OTP code we just sent to you on your registered email',
                style: CustomTextStyles.kDefaultTextTheme(AppCommonColors.signInWithGoogleBgnd).bodyMedium,
              )
          ),
          Container(
            key: const Key('Input'),
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
            key: const Key('button'),
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
<<<<<<< Updated upstream:mobile/lib/src/features/auth/presentation/otp.dart
                key: const Key('resend'),
                child:Row(
                  children: <Widget>[
                    const Text('Didn\'t get OTP?'),
                    TextButton(
                        onPressed: (){},
                        child: const Text('Resend')
                    ),
                  ],
                )
              ),
=======
                  key: const Key('resend'),
                  child: Row(
                    children: <Widget>[
                      const Text('Didn\'t get OTP?'),
                      TextButton(onPressed: () {}, child: const Text('Resend')),
                    ],
                  )),
>>>>>>> Stashed changes:lib/src/features/auth/presentation/otp.dart
              Container(
                key: const Key('feedback'),
              ),
            ],
          )

        ],
      ),
    );
  }
}