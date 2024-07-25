import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/src/core/dp_injection/dependency_injection.dart';
import 'package:mobile/src/core/theme/theme_config.dart';

import 'package:mobile/src/features/auth/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/add_listings.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
            // initialRoute: '/add-listing',
            // routes: {
            //   '/': (context) => const OnboardingScreen(),
            //   '/signup': (context) => const SignUpPage(),
            //   '/signin': (context) => const SignInPage(),
            //   "/otp": (context) => const OTPage(),
            //   '/password-reset': (context) => const PasswordResetScreen(),
            //   '/forgot-password': (context) => const ForgotPasswordScreen(),
            //   '/dashboard': (context) => const HomePage(),
            //   '/listing-detail': (context) => const ListingDetail(),
            //   '/identify-student-identity': (context) => const IdentifyStudent(),
            //   '/add-listing': (context) => const AddListings(),
            // },
            home: const AddListings(),
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeConfig().darkTheme,
            theme: ThemeConfig().lightTheme,
            themeMode: ThemeMode.light,
          ),
        );
      },
    );
  }
}
