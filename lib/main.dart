import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/theme_config.dart';
import 'package:mobile/src/features/auth/presentation/pages/forgot_password.dart';
import 'package:mobile/src/features/auth/presentation/pages/identify_student.dart';
import 'package:mobile/src/features/auth/presentation/pages/otp_page.dart';
import 'package:mobile/src/features/auth/presentation/pages/password_reset.dart';
import 'package:mobile/src/features/auth/presentation/pages/register_page.dart';
import 'package:mobile/src/features/auth/presentation/pages/sign_in_page.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/compare_listing_page.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/dashboard.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/homepage.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/list_detail.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/search_listing.dart';
import 'package:mobile/src/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
          initialRoute: '/listing-detail',
          routes: {
            '/': (context) => const OnboardingScreen(),
            '/signup': (context) => const SignUpPage(),
            '/signin': (context) => const SignInPage(),
            "/otp": (context) => const OTPage(),
            '/forgot-password': (context) => const ForgotPasswordScreen(),
            '/homepage': (context) => const HomePage(),
            '/identify-student-identity': (context) => const IdentifyStudent(),
            '/compare-listing': (context) => const CompareListingPage(),
            '/listing-detail': (context) => const ListingDetail(),
            '/search-listing': (context) => const SearchListingPage(),
            '/password-reset': (context) => const PasswordResetScreen(),
            '/dashboard': (context) => const DashBoard(),
          },
          darkTheme: ThemeConfig().darkTheme,
          theme: ThemeConfig().lightTheme,
          themeMode: ThemeMode.system,
        );
      },
    );
  }
}