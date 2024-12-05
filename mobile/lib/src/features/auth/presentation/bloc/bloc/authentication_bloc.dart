import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/src/features/auth/domain/use_cases/forgot_password_usecase.dart';
import 'package:mobile/src/features/auth/domain/use_cases/resend_otp_usecase.dart';

import '../../../../../core/entities/user_account.dart';
import '../../../domain/domain.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final RegisterWithEmailPasswordUseCase registerWithEmailPasswordUseCase;
  final ForgotPasswordUsecase forgotPasswordUsecase;
  final ResendOTPUsecase resendOTPUsecase;
  final LoginUseCase loginUseCase;
  AuthenticationBloc({
    required this.registerWithEmailPasswordUseCase,
    required this.forgotPasswordUsecase,
    required this.resendOTPUsecase,
    required this.loginUseCase,
  }) : super(AuthenticationInitial()) {
    on<LoginUserEvent>(onLoginUserEvent);
    on<AuthenticationRegisterUserEvent>(authenticationRegisterUserEvent);
    on<ForgotPasswordEvent>(onForgotPasswordEvent);
    on<ResendOTPEvent>(onResendOTPEvent);
  }

  FutureOr<void> onLoginUserEvent(
    LoginUserEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());
    final res = await loginUseCase(
      LoginParams(email: event.email, password: event.password),
    );

    res.fold(
      (l) => emit(LoginFailed()),
      (r) => emit(LoginSuccess(user: r)),
    );
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

  FutureOr<void> onForgotPasswordEvent(
    ForgotPasswordEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());
    final result = await forgotPasswordUsecase(ForgotPasswordParams(
      email: event.email,
    ));
    result.fold(
      (l) => emit(AuthenticationError(l.message)),
      (r) => emit(ForgotPasswordSuccess()),
    );
  }

  FutureOr<void> onResendOTPEvent(
    ResendOTPEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());

    final result = await resendOTPUsecase(ResendOTPParams(
      email: event.email,
    ));
    result.fold(
      (l) => emit(AuthenticationError(l.message)),
      (r) => emit(ResendMailSuccess()),
    );
  }
}
