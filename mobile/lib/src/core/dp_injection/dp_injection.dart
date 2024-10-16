part of "dependency_injection.dart";

final GetIt sl = GetIt.instance;

Future<void> init() async {
  await Hive.initFlutter();
  await Hive.openBox('userData');

  // dependencies that can be seen accross multiple features
  sl
    // Internet Connection
    ..registerLazySingleton(() => NetworkImpl(sl()))
    ..registerLazySingleton(InternetConnectionChecker.new)
    ..registerLazySingleton(http.Client.new);

  _initAuth(); //Initialize the dependencies for the auth feature
  _initDashboard(); //Initialize the dependencies for the dashboard feature
}

void _initAuth() {
  sl
    ..registerLazySingleton<Box>(() => Hive.box('userData'))

    //UseCases
    ..registerLazySingleton(() => RegisterWithEmailPasswordUseCase(sl()))
    ..registerLazySingleton(() => OTPUseCase(sl()))

    //Repository
    ..registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(remoteDataSource: sl(), network: sl()))

    //DataSources
    ..registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(sl()))

    //Blocs
    ..registerLazySingleton(
        () => OTPBloc(otpUseCase: sl(), resendOtpUseCase: sl()))
    ..registerLazySingleton(
        () => AuthenticationBloc(registerWithEmailPasswordUseCase: sl()));
}

void _initDashboard() {
  sl
    ..registerLazySingleton(
      () => DashboardRemoteDataSourceImpl(
        sl<http.Client>(),
      ),
    )
    ..registerLazySingleton(
      () => DashboardRepositoryImpl(
        remoteDataSource: sl<DashboardRemoteDataSourceImpl>(),
        network: sl<NetworkImpl>(),
      ),
    )
    ..registerLazySingleton(
      () => GetListingsUseCase(
        dashboardRepository: sl<DashboardRepositoryImpl>(),
      ),
    )
    ..registerFactory(
      () => DashboardBloc(
        getListingsUseCase: sl<GetListingsUseCase>(),
      ),
    );
}
