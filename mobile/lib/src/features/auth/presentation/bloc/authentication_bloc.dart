import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mobile/src/features/auth/domain/domain.dart';
import 'package:mobile/src/features/auth/domain/use_cases/use_cases.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  ResetPasswordUseCase resetPasswordUseCase;
  AuthenticationBloc({
    required this.resetPasswordUseCase,
  }) : super(AuthenticationInitial()) {
    on<ResetPasswordEvent>(_resetPasswordEvent);
  }

  FutureOr<void> _resetPasswordEvent(
      ResetPasswordEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    final response = await resetPasswordUseCase(ResetPasswordParams(
        email: event.email,
        newPassword: event.newPassword,
        confirmPassword: event.confirmPassword,
        token: event.token));
    response.fold(
        (failure) => emit(ResetPasswordError(message: failure.message)),
        (success) => emit(ResetPasswordSuccess()));
  }
}
