import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/src/core/cubit/app_user/app_user_cubit.dart';
import 'package:mobile/src/core/use_case/use_case.dart';
import 'package:mobile/src/features/auth/domain/use_cases/forgot_password_usecase.dart';
import 'package:mobile/src/features/auth/domain/use_cases/get_cached_user_usecase.dart';
import 'package:mobile/src/features/auth/domain/use_cases/resend_otp_usecase.dart';
import 'package:mobile/src/features/auth/domain/use_cases/verify_otp.dart';

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
  final VerifyOTPUseCase verifyOTPUseCase;
  final GetCachedUserUsecase getCachedUserUsecase;
  final AppUserCubit appUserCubit;
  AuthenticationBloc({
    required this.registerWithEmailPasswordUseCase,
    required this.forgotPasswordUsecase,
    required this.resendOTPUsecase,
    required this.loginUseCase,
    required this.verifyOTPUseCase,
    required this.getCachedUserUsecase,
    required this.appUserCubit,
  }) : super(AuthenticationInitial()) {
    on<LoginUserEvent>(onLoginUserEvent);
    on<AuthenticationRegisterUserEvent>(authenticationRegisterUserEvent);
    on<ForgotPasswordEvent>(onForgotPasswordEvent);
    on<ResendOTPEvent>(onResendOTPEvent);
    on<VerifyOTPEvent>(onVerifyOTPEvent);
    on<GetCachedUserEvent>(onGetCachedUserEvent);
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
      (r) {
        appUserCubit.userLoggedIn(r);
        emit(LoginSuccess(user: r));
      },
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
      (failure) => emit(AuthenticationError(message: failure.message)),
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
      (l) => emit(AuthenticationError(message: l.message)),
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
      (l) => emit(AuthenticationError(message: l.message)),
      (r) => emit(ResendMailSuccess()),
    );
  }

  FutureOr<void> onVerifyOTPEvent(
    VerifyOTPEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());

    final result = await verifyOTPUseCase(OTPParams(
      email: event.email,
      code: event.code,
    ));
    result.fold(
      (l) => emit(VerifyOTPFailure(message: l.message)),
      (r) => emit(VerifyOTPSuccess()),
    );
  }

  FutureOr<void> onGetCachedUserEvent(
    GetCachedUserEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());

    final result = await getCachedUserUsecase(NoParams());
    result.fold(
      (l) => emit(GetCacheUserFailure(message: l.message)),
      (r) {
        appUserCubit.userLoggedIn(r);
        emit(GetCachedUserSuccess(user: r));
      },
    );
  }
}
