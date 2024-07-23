import 'package:equatable/equatable.dart';

class OTPMatched extends Success {
  const OTPMatched() : super(message: 'OTP matched');
}

class OTPSent extends Success{
    const OTPSent() : super(message: 'OTP matched');
}

abstract class Success extends Equatable {
  final String message;
  const Success({required this.message});

  @override
  List<Object> get props => [message];
}