import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/core/success/success.dart';
import 'package:mobile/src/features/auth/domain/use_cases/resend_otp.dart';
import 'package:mobile/src/features/auth/domain/use_cases/verify_otp.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OTPBloc extends Bloc<OTPEvent, OTPState> {
  final OTPUseCase otpUseCase;
  final OTPResendUseCase resendOtpUseCase;

  OTPBloc({required this.resendOtpUseCase, required this.otpUseCase})
      : super(OTPInitial()) {
    on<SubmitOTP>(_submitOtp);
    on<ResendOTP>(_resendOtp);
  }

  void _resendOtp(ResendOTP event, Emitter<OTPState> emit) async {
    emit(OTPLoading());
    final Either<Failure, OTPSent> result =
        await resendOtpUseCase(OTPResendParams(email: event.email));
    Future.delayed(const Duration(seconds: 2));
    emit(result.fold(
      (failure) => const ResendOTPFailure(message: 'failure'),
      (oTPMatched) => ResendOTPSuccess(),
    ));
  }

  void _submitOtp(SubmitOTP event, Emitter<OTPState> emit) async {
    emit(OTPLoading());
    final Either<Failure, OTPMatched> result =
        await otpUseCase(OTPParams(code: event.code, email: event.email));
    Future.delayed(const Duration(seconds: 2));
    emit(result.fold(
      (failure) => const OTPFailure(message: 'failure'),
      (oTPMatched) => OTPSuccess(),
    ));
  }
}
