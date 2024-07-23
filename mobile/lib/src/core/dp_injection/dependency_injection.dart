import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobile/src/core/network/network_info.dart';
import 'package:mobile/src/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:mobile/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:mobile/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:mobile/src/features/auth/domain/use_cases/reset_password.dart';
import 'package:mobile/src/features/auth/presentation/bloc/authentication_bloc.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  sl
    ..registerFactory(() => AuthenticationBloc(resetPasswordUseCase: sl()))
    ..registerLazySingleton(() => ResetPasswordUseCase(authRepository: sl()))
    ..registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(networkInfo: sl(), authRemoteDataSource: sl()))
    ..registerLazySingleton(() => NetworkInfoImpl(internetChecker: sl()))
    ..registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(client: sl()))
    ..registerLazySingleton(() => InternetConnectionChecker())
    ..registerLazySingleton(() => http.Client());
}
