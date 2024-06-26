import 'package:flutter/material.dart';
import 'package:mobile/src/features/auth/presentation/pages/otp_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OTP Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OTPage(),
    );
  }
}