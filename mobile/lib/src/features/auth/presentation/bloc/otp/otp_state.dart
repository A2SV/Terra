part of 'otp_bloc.dart';

@immutable
abstract class OTPState extends Equatable {
  const OTPState();

  @override
  List<Object> get props => [];
}

class OTPFailure extends OTPState {
  final String message;

  const OTPFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class ResendOTPFailure extends OTPState {
  final String message;

  const ResendOTPFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class OTPInitial extends OTPState {}

class OTPLoading extends OTPState {}

class OTPSuccess extends OTPState {}

class OTPResendLoading extends OTPState {}

class ResendOTPSuccess extends OTPState {}
