import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/src/core/dp_injection/dependency_injection.dart';
import 'package:mobile/src/core/theme/theme_config.dart';

import 'package:mobile/src/features/auth/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:mobile/src/features/auth/presentation/pages/identify_student.dart';
import 'package:mobile/src/features/auth/presentation/pages/forgot_password.dart';
import 'package:mobile/src/features/auth/presentation/pages/otp_page.dart';
import 'package:mobile/src/features/auth/presentation/pages/register_page.dart';
import 'package:mobile/src/features/auth/presentation/pages/sign_in_page.dart';
import 'package:mobile/src/features/auth/presentation/pages/password_reset.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/add_listing_apartment.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/add_listing_event_space.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/add_listing_guest_house.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/add_listing_hostel.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/add_listing_hotel.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/add_listing_house.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/add_listing_office.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/add_listing_shop.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/add_listing_warehouse.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/homepage.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/list_detail.dart';
import 'package:mobile/src/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'src/features/dashboard/presentation/pages/dashboard.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return BlocProvider(
          create: (context) => sl<AuthenticationBloc>(),
          child: MaterialApp(
            initialRoute: '/add-listing-event',
            routes: {
              '/': (context) => const OnboardingScreen(),
              '/signup': (context) => const SignUpPage(),
              '/signin': (context) => const SignInPage(),
              "/otp": (context) => const OTPage(),
              '/password-reset': (context) => const PasswordResetScreen(),
              '/forgot-password': (context) => const ForgotPasswordScreen(),
              '/dashboard': (context) => const HomePage(),
              '/listing-detail': (context) => const ListingDetail(),
              '/identify-student-identity': (context) =>
              const IdentifyStudent(),
              '/add-listing-apartment': (context) => const AddListingApartment(),
              '/add-listing-house': (context) => const AddListingHouse(),
              '/add-listing-hostel': (context) => const AddListingHostel(),
              '/add-listing-hotel': (context) => const AddListingHotel(),
              '/add-listing-guest-house': (context) => const AddListingGuestHouse(),
              '/add-listing-office': (context) => const AddListingOffice(),
              '/add-listing-shop': (context) => const AddListingShop(),
              '/add-listing-warehouse': (context) => const AddListingWareHouse(),
              '/add-listing-event': (context) => const AddListingEvent(),
            },
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeConfig().darkTheme,
            theme: ThemeConfig().lightTheme,
            themeMode: ThemeMode.light,
          ), // checking if there's a change
        );
      },
    );
  }
}
