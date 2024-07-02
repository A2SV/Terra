import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/theme_config.dart';
import 'package:mobile/src/features/auth/presentation/pages/otp_page.dart';
import 'package:mobile/src/features/auth/presentation/pages/register_page.dart';
import 'package:mobile/src/features/auth/presentation/pages/sign_in_page.dart';
import 'package:mobile/src/features/auth/presentation/pages/password_reset.dart';
import 'package:mobile/src/features/onboarding/presentation/pages/onboarding_screen.dart';
// import 'package:mobile/src/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'src/features/dashboard/presentation/pages/dashboard.dart';

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
          initialRoute: '/password-reset',
          routes: {
            '/': (context) => const OnboardingScreen(),
            '/signup': (context) => const SignUpPage(),
            '/signin': (context) => const SignInPage(),
            "/otp": (context) => const OTPage(),
            '/password-reset': (context) => const PasswordResetScreen(),
            '/dashboard': (context) => const HomePage(),
          },
          darkTheme: ThemeConfig().darkTheme,
          theme: ThemeConfig().lightTheme,
          themeMode: ThemeMode.light,
          home: const OTPage(),
        );
      },
    );
  }
}
