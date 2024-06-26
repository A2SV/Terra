import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 85,
            ),
            // Image.asset(""),
            const Icon(Icons.email, size: 80, color: Color(0xFF1779F3)),
            const SizedBox(height: 20),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _otpInputField(context),
                _otpInputField(context),
                _otpInputField(context),
                _otpInputField(context),
                _otpInputField(context),
                _otpInputField(context),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Handle verify action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1779F3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 160, vertical: 15),
              ),
              child: const Text(
                'Verify',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text.rich(
              TextSpan(
                text: "Didn't get OTP? ",
                style: const TextStyle(color: Colors.black54, fontSize: 12),
                children: [
                  TextSpan(
                    text: 'Resend OTP',
                    style: const TextStyle(
                        color: Color(
                          0xFF1779F3,
                        ),
                        fontSize: 12),
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
    );
  }

  Widget _otpInputField(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: const Center(
        child: TextField(
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
          maxLength: 1,
          decoration: InputDecoration(
            border: InputBorder.none,
            counterText: '',
          ),
        ),
      ),
    );
  }
}
