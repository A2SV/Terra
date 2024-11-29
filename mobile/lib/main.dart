import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/src/core/dp_injection/dependency_injection.dart';
import 'package:mobile/src/core/routes/routes_config.dart';
import 'package:mobile/src/features/auth/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:mobile/src/features/dashboard/domain/use_cases/get_listings_use_case.dart';
import 'package:mobile/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
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
          BlocProvider(
            create: (context) => sl<AuthenticationBloc>(),
          ),
          BlocProvider<DashboardBloc>(
            create: (context) => DashboardBloc(
              getListingsUseCase:
                  sl<GetListingsUseCase>(), 
            ),
          ),
        ], child: AppRouter());
      },
    );
  }
}
