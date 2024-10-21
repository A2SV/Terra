import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobile/src/core/dp_injection/dependency_injection.dart';
import 'package:mobile/src/core/network/network_info.dart';
import 'package:mobile/src/core/routes/routes_config.dart';
import 'package:mobile/src/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:mobile/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:mobile/src/features/auth/domain/use_cases/resend_otp.dart';
import 'package:mobile/src/features/auth/domain/use_cases/verify_otp.dart';
import 'package:mobile/src/features/auth/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:mobile/src/features/auth/presentation/bloc/otp/otp_bloc.dart';
import 'package:mobile/src/features/auth/presentation/pages/otp_page.dart';
import 'package:mobile/src/features/auth/presentation/pages/password_reset.dart';
import 'package:mobile/src/features/auth/presentation/pages/register_page.dart';
import 'package:mobile/src/features/auth/presentation/pages/sign_in_page.dart';
import 'package:mobile/src/features/auth/presentation/pages/password_reset.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/add_listing_contact_info.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/add_listing_location.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/homepage.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/add_listing_photos.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/list_detail.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/widgets/location_modal.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/listings_filters.dart';
import 'package:mobile/src/features/onboarding/presentation/pages/onboarding_screen.dart';
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
        return MultiBlocProvider(providers: [
          BlocProvider<OTPBloc>(
            create: (context) => OTPBloc(
                resendOtpUseCase: OTPResendUseCase(AuthRepositoryImpl(
                  remoteDataSource: AuthRemoteDataSourceImpl(http.Client()),
                  network: NetworkImpl(InternetConnectionChecker()),
                )),
                otpUseCase: OTPUseCase(AuthRepositoryImpl(
                  remoteDataSource: AuthRemoteDataSourceImpl(http.Client()),
                  network: NetworkImpl(InternetConnectionChecker()),
                ))),
            child: const OTPage(),
          ),
          BlocProvider(
            create: (context) => sl<AuthenticationBloc>(),
          ),
        ], child: AppRouter());
      },
    );
  }
}
