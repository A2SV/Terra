import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mobile/src/features/auth/domain/use_cases/register_with_email_password_use_case.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final RegisterWithEmailPasswordUseCase registerWithEmailPasswordUseCase;
  AuthenticationBloc({
    required this.registerWithEmailPasswordUseCase,
  }) : super(AuthenticationInitial()) {
    on<AuthenticationRegisterUserEvent>(authenticationRegisterUserEvent);
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
