part of "dependency_injection.dart";

final GetIt sl = GetIt.instance;

Future<void> init() async {
  await Hive.initFlutter();
  await Hive.openBox('userData'); 

  // Register shared dependencies
  _registerCoreDependencies();

  // Initialize feature-specific dependencies
  _initAuth();
  _initDashboard();
}

void _registerCoreDependencies() {
  sl
    ..registerLazySingleton(() => NetworkImpl(sl()))
    ..registerLazySingleton(InternetConnectionChecker.new)
    ..registerLazySingleton(http.Client.new)
    ..registerLazySingleton<Box>(() => Hive.box('userData')); // Shared Hive box
}

void _initAuth() {
  sl
    // Data Sources
    ..registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(sl()))
    ..registerLazySingleton<AuthLocalDataSource>(
        () => AuthLocalDataSourceImpl(sl<Box>())) 

    // Repository
    ..registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(
              remoteDataSource: sl(),
              localDataSource: sl(), 
              network: sl(),
            ))

    // Use Cases
    ..registerLazySingleton(() => RegisterWithEmailPasswordUseCase(sl()))
    ..registerLazySingleton(() => VerifyOTPUseCase(sl()))
    ..registerLazySingleton(() => LoginUseCase(authRepository: sl()))
    ..registerLazySingleton(() => ForgotPasswordUsecase(authRepository: sl()))
    ..registerLazySingleton(() => ResendOTPUsecase(authRepository: sl()))
    ..registerLazySingleton(() => GetCachedUserUsecase(authRepository: sl()))

    // Cubit
    ..registerLazySingleton(() => AppUserCubit(localDataSource: sl())) 

    // Bloc
    ..registerLazySingleton(
      () => AuthenticationBloc(
        loginUseCase: sl(),
        registerWithEmailPasswordUseCase: sl(),
        forgotPasswordUsecase: sl(),
        resendOTPUsecase: sl(),
        verifyOTPUseCase: sl(),
        getCachedUserUsecase: sl(),
      ),
    );
}

void _initDashboard() {
  sl
    ..registerLazySingleton<DashboardRemoteDataSource>(
        () => DashboardRemoteDataSourceImpl(sl<http.Client>()))
    ..registerLazySingleton<DashboardRepository>(
        () => DashboardRepositoryImpl(
              remoteDataSource: sl<DashboardRemoteDataSource>(),
              network: sl<NetworkImpl>(),
            ))
    ..registerLazySingleton(() => GetListingsUseCase(
          dashboardRepository: sl<DashboardRepository>(),
        ))
    ..registerLazySingleton(
      () => DashboardBloc(
        getListingsUseCase: sl<GetListingsUseCase>(),
      ),
    );
}