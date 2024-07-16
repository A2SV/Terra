import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/src/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:mobile/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:mobile/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:mobile/src/features/auth/domain/use_cases/register_with_email_password_use_case.dart';
import 'package:mobile/src/features/auth/presentation/bloc/authentication_bloc.dart';

final GetIt sl = GetIt.instance;



Future<void> init()async{
  //App Logic
  sl..registerFactory(() => AuthenticationBloc(registerWithEmailPasswordUseCase: sl()))


  //UseCases
  ..registerLazySingleton(() => RegisterWithEmailPasswordUseCase(sl()))

  //Repository
  ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()))

  //DataSources
  ..registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(sl()))

  //External dependencies
  ..registerLazySingleton(http.Client.new);
}