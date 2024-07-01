import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobile/gen/assets.gen.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
        surfaceTintColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 1.8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 7.5.w,
                    height: 4,
                    color: const Color(0xFFD6DFFF),
                  ),
                  SizedBox(width: 2.w),
                  Container(
                    width: 7.5.w,
                    height: 4,
                    color: const Color(0xFF1779F3),
                  ),
                  SizedBox(width: 2.w),
                  Container(
                    width: 7.5.w,
                    height: 4,
                    color: const Color(0xFFD6DFFF),
                  ),
                ],
              ),
              SizedBox(height: 7.h),
              Image.asset(
                "assets/images/messageIcon.png",
                height: 10.h,
              ),
              SizedBox(height: 5.h),
              const Text(
                'Enter OTP',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1779F3),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Enter the OTP code we just sent you on your',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
              const Text(
                'registered email',
                textAlign: TextAlign.center,
                style: TextStyle(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Didn't get OTP? ",
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 12),
                      children: [
                        TextSpan(
                          text: 'Resend OTP',
                          style: const TextStyle(
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
                  const Text(
                    'Incorrect Try again',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
