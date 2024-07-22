import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meta/meta.dart';
import 'package:mobile/src/core/network/network_info.dart';
import 'package:mobile/src/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:mobile/src/features/auth/domain/use_cases/register_with_email_password_use_case.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/entities/user_account.dart';
import '../../../../../core/error/failure.dart';
import '../../../data/repositories/auth_repository_impl.dart';
import '../../../domain/domain.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final RegisterWithEmailPasswordUseCase registerWithEmailPasswordUseCase;
  AuthenticationBloc({
    required this.registerWithEmailPasswordUseCase,
  }) : super(AuthenticationInitial()) {
    on<AuthenticationRegisterUserEvent>(authenticationRegisterUserEvent);

    on<LoginUserEvent>((event, emit) async {
      emit(AuthenticationLoading());
      final Box userBox = await Hive.openBox('userData');
      final LoginUseCase loginUseCase = LoginUseCase(AuthRepositoryImpl(
          remoteDataSource: AuthRemoteDataSourceImpl(http.Client()),
          network: NetworkImpl(InternetConnectionChecker())));
      final login = await loginUseCase(
          LoginParams(email: event.username, password: event.password));

      var output;
      login.fold(
          (failure) => output = failure, (loginReturn) => output = loginReturn);
      if (output is LoginReturn) {
        emit(LoginSuccess(user: output.user));
      } else if (output is Failure) {
        emit(LoginFailed());
        userBox.put('errormessage', output.message);
      }

      emit(AuthenticationInitial());
    });
  }

  FutureOr<void> authenticationRegisterUserEvent(
      AuthenticationRegisterUserEvent event,
      Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    final result = await registerWithEmailPasswordUseCase(
        RegisterWithEmailPasswordUseCaseParams(
            firstName: event.firstName,
            lastName: event.lastName,
            email: event.email,
            password: event.password,
            phoneNumber: event.phoneNumber,
            role: event.role));
    result.fold(
      (failure) => emit(AuthenticationError(failure.message)),
      (_) => emit(RegisterUserSuccess(event.email)),
    );
  }
}
