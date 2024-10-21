import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobile/gen/assets.gen.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/theme/text_theme.dart';

class OTPage extends StatelessWidget {
  const OTPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 32,
                    height: 4,
                    color: const Color(0xFFD6DFFF),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 32,
                    height: 4,
                    color: const Color(0xFF1779F3),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 32,
                    height: 4,
                    color: const Color(0xFFD6DFFF),
                  ),
                ],
              ),
              const SizedBox(height: 80),
              Assets.images.messageIcon.path.asAssetImage(height: 9.h),
              // SvgPicture.asset('assets/svg/message.svg'),
              const SizedBox(height: 25),
              Text(
                'Enter OTP',
                style: CustomTextStyles.kDefaultTextTheme(Color(0xFF1779F3))
                    .bodySmall
                    ?.copyWith(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1779F3),
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                'Enter the OTP code we just sent you on your',
                textAlign: TextAlign.center,
                style: CustomTextStyles.kDefaultTextTheme(Colors.black54)
                    .bodySmall
                    ?.copyWith(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
              ),
              Text(
                'registered email',
                textAlign: TextAlign.center,
                style: CustomTextStyles.kDefaultTextTheme(Colors.black54)
                    .bodySmall
                    ?.copyWith(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
              ),
              const SizedBox(height: 30),
              Pinput(
                length: 6,
                showCursor: true,
                onChanged: (value) {
                  // Handle OTP input change
                },
                onCompleted: (pin) {
                  // Handle OTP input completion
                },
                defaultPinTheme: PinTheme(
                  width: 50,
                  height: 50,
                  textStyle: const TextStyle(fontSize: 18, color: Colors.black),
                  decoration: BoxDecoration(
                    color: const Color(0xFEAEFF5),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              CustomButton(
                horizontalPadding: 0,
                text: 'Verify',
                onPressed: () {
                  // Handle verify action
                },
                height: 50,
                borderColor: const Color(0xFF1779F3),
                borderRadius: 10,
                backgroundColor: const Color(0xFF1779F3),
                textColor: Colors.white,
              ),
              const SizedBox(height: 20),
              Text.rich(
                TextSpan(
                  text: "Didn't get OTP? ",
                  style: CustomTextStyles.kDefaultTextTheme(Color(0xFF1779F3))
                      .bodySmall
                      ?.copyWith(color: Colors.black54, fontSize: 12),
                  children: [
                    TextSpan(
                      text: 'Resend OTP',
                      style:
                          CustomTextStyles.kDefaultTextTheme(Color(0xFF1779F3))
                              .bodySmall
                              ?.copyWith(
                                color: Color(0xFF1779F3),
                                fontSize: 12,
                              ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Handle resend OTP action
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
