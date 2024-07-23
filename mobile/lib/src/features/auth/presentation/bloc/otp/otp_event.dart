part of 'otp_bloc.dart';

@immutable
sealed class OTPEvent extends Equatable {
  const OTPEvent();

  @override
  List<Object> get props => [];
}

class SubmitOTP extends OTPEvent {
  final String code;
  final String email;

  const SubmitOTP(this.code, this.email);

  @override
  List<Object> get props => [code, email];
}

class ResendOTP extends OTPEvent {
  final String email;

  const ResendOTP(this.email);

  @override
  List<Object> get props => [email];
}
