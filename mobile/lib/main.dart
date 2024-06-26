import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/theme_config.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:mobile/src/features/auth/presentation/pages/otp_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          darkTheme: ThemeConfig().darkTheme,
          theme: ThemeConfig().lightTheme,
          themeMode: ThemeMode.light,
          home: const Scaffold(),
        );
      },
    );
  }
}