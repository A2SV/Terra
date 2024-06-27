import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/theme_config.dart';
import 'package:mobile/src/features/auth/presentation/pages/profile_pages/profile_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:mobile/src/onboarding/presentation/pages/onboarding_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          darkTheme: ThemeConfig().darkTheme,
          theme: ThemeConfig().lightTheme,
          themeMode: ThemeMode.light,
          home: const ProfilePage(),
        );
      },
    );
  }
}
