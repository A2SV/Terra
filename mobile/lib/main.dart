import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/src/core/cubit/app_user/app_user_cubit.dart';
import 'package:mobile/src/core/dp_injection/dependency_injection.dart';
import 'package:mobile/src/core/routes/routes.dart';
import 'package:mobile/src/features/auth/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:mobile/src/features/dashboard/presentation/bloc/listing_details/listing_details_bloc.dart';
import 'package:mobile/src/features/dashboard/presentation/bloc/listings/dashboard_bloc.dart';
import 'package:mobile/src/features/dashboard/presentation/bloc/location/location_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init(); // Initialize dependencies
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => sl<AuthenticationBloc>(),
      ),
      BlocProvider(
        create: (context) => sl<AppUserCubit>(),
      ),
      BlocProvider(
        create: (context) => sl<DashboardBloc>(),
      ),
      BlocProvider(
        create: (context) => sl<ListingDetailBloc>(),
      ),
      BlocProvider(
        create: (context) => sl<LocationBloc>(),
      ),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppUserCubit, AppUserCubitState>(
      builder: (context, state) {
        return ResponsiveSizer(
          builder: (context, orientation, screenType) {
            if (state is AppUserLoggedIn) {
              return AppRouter(location: AppRoutes.dashboard);
            }
            return AppRouter(location: AppRoutes.onboarding);
          },
        );
      },
    );
  }

  @override
  void initState() {
    context.read<AuthenticationBloc>().add(GetCachedUserEvent());
    super.initState();
  }
}
